import 'package:flutter/material.dart';
import 'package:garden_app/data/session.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/pages/audio_page.dart';
import 'package:garden_app/screens/pages/gad7_page.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';
import 'package:garden_app/screens/pages/jegu_result_page_info.dart';
import 'package:garden_app/screens/pages/phq9_page.dart';
import 'package:garden_app/screens/pages/profesine_savijauta.dart';
import 'package:garden_app/screens/pages/savybes_pages.dart';
import 'package:garden_app/services/emoji_api.dart';
import 'package:garden_app/services/questionnaire_api.dart';
import 'package:garden_app/services/task_event_api.dart';
import 'package:garden_app/widgets/text_template.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';
import '../screens/paged_task_screen.dart';
import '../screens/pages/text_page.dart';

typedef EmojiPageBuilder = Widget Function(ValueChanged<String> onChanged);

Future<void> _reportTaskCompletion(Task task, Function onScreenFinish) async {
  // 1. Atnaujiname lokalią užduoties būseną
  task.done = true;
  onScreenFinish(); // Grįžimas iš ekrano

  // 2. Siunčiame įvykį į serverį
  final accountId = await Session.getAccountId();
  if (accountId != null) {
    try {
      await TaskService.completeTask(
        userPin: accountId.toString(),
        // SVARBU: Naudojame Task.text kaip unikalų taskCode
        taskCode: task.text,
      );
    } catch (e) {
      // Tvarkome klaidas (galima loginti, bet nereikia rodyti vartotojui)
      print('Klaida siunčiant užduoties pabaigą: $e');
    }
  }
}

Task makeTaskWithMood({
  required String title,
  required List<Widget> pages,
  EmojiPageBuilder? emojiBuilder,
  bool markDoneOnPick = false,
}) {
  late final Task t;

  Widget defaultEmoji(ValueChanged<String> onChanged) =>
      MoodEmojiPage(onChanged: onChanged);

  t = Task(
    text: title,
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: title,
          taskCode: title, // pvz. "Nuotaika"
          onFinish: () => _reportTaskCompletion(t, onFinish),
          pages: [
            (emojiBuilder ?? defaultEmoji)((emoji) async {
              t.mood = emoji;
              if (markDoneOnPick) t.done = true;

              try {
                final prefs = await SharedPreferences.getInstance();
                final id = prefs.getInt('account_id');
                if (id != null) {
                  await EmojiApi.save(
                    accountId: id,
                    emoji: emoji,
                    taskCode: title,
                  );
                }
              } catch (e) {
                // debugPrint('Emoji save failed: $e');
              }
            }),

            ...pages,
          ],
        ),
  );

  return t;
}

List<Task> buildPasiruosimasTasks() {
  final kaipViskasVyks = makeTaskWithMood(
    title: 'Kaip viskas vyks',
    pages: const [
      TextTemplate(
        standalone: false,
        children: [
          P(
            'Džiugu, kad prisijungei, čia rūpinsimės Tavo vidiniu sodu. Šią programą sudaro trumpos praktikos, kurios skatins atsigręžti į save. '
            'Tikiuosi, kad po 8 savaičių Sodo programos, tavo savijauta pagerės.\n\n'
            'O viskas vyks taip. 8 savaites, kiekvieną dieną kviesiu Tave atlikti po vieną trumpą praktiką (vidutiniškai iki 10 minučių).',
          ),
        ],
        // 'Džiugu, kad prisijungei, čia rūpinsimės Tavo vidiniu sodu. Šią programą sudaro trumpos praktikos, kurios skatins atsigręžti į save. '
        // 'Tikiuosi, kad po 8 savaičių Sodo programos, tavo savijauta pagerės.\n\n'
        // 'O viskas vyks taip. 8 savaites, kiekvieną dieną kviesiu Tave atlikti po vieną trumpą praktiką (vidutiniškai iki 10 minučių).',
      ),
      TextPage1(
        'Sodo programa turi tam tikrą svarbų eiliškumą – todėl tik atlikus vieną užduotį – atsidarys kita. Rekomenduoju atlikti vieną praktiką per dieną. '
        'Gali atlikti ir daugiau, tačiau naujas savaitės užduočių blokelis atsidarys kas savaitę. Jeigu nekantrausi ir atliksi daugiau praktikų per dieną, viskas gerai – '
        'kviečiu nueiti į skiltį „Ekstra” ir praktikuoti papildomas užduotis iki kol atsidarys naujos savaitės praktikos.',
      ),
      TextPage1(
        'Taip pat kviečiu nusistatyti priminimus, kurie gali padėti sodininkauti nuosekliai, tai gali padaryti priminimų skiltyje.',
      ),
      TextPage1(
        'Beje, kiekvienos praktikos pradžioje kviesiu tave pažymėti savo nuotaiką, o nuotaikos grafikėlį taip pat galėsi matyti „Rezultatuose”.\n'
        'Daug neišsiplėsiu, nes vis dėlto darbuotis Sode – labiau padeda užauginti vaisių, nei skaityti ar mąstyti apie sodą.',
      ),
      TextPage1(
        'Tik noriu perspėti, kad praktikų eigoje, ypač pirmoje pusėje, gali susidurti su įvairiomis demotyvuojančiomis mintimis. '
        'Vienintelis būdas sužinoti, ar ši Sodo programa Tau – duoti laiko išmėginti. Atlik praktikas iki galo ir pažiūrėk, ar jos padarė pokytį!\n\n'
        'Susitikime rytoj užpildyti pirmąją skalę, iki! 😊',
      ),
    ],
  );

  final nuotaika = makeTaskWithMood(
    title: 'Motyvacija',

    markDoneOnPick: true,
    pages: [
      TextPage1(
        'Kviečiu pirmai savirefleksijai. Noriu užduoti Tau kelis klausimus.',
      ),
      TextPage1(
        'Kodėl pasirinkai dalyvauti tyrime, susijusiame su emocinės sveikatos puoselėjimu ir gerinimu? Ko tikiesi iš šios programos? Gali užrašyti.',
      ),
      TextPage1(
        'Kaip norėtum pagerinti savo emocinę savijautą? Jeigu reikėtų išsikelti du svarbiausius tikslus, susijusius su Tavo emocinės savijautos gerove, kokie jie būtų? (Pavyzdžiai: sumažėjęs nerimas, pagerėjęs miegas, geresni santykiai su kolegomis, mažesnis vienišumo jausmas, geriau valdomas pyktis, didesnis lengvumo pojūtis darbe ir t.t.).',
      ),
      TextPage1(
        'Tikiuosi, kad ši Sodo programa padės Tau siekti Tavo emocinės savijautos gerėjimo tikslų, čia rasi įvairių įrankių, kurie padės Tau jaustis geriau. Taip pat viliuosi, kad kai bus sunku rasti laiko ar nesinorės ateiti į šį Sodą – vis tiek ateisi, nes turėsi aiškiai įvardintas priežastis ir tikslus kodėl tai darai.Iki susitikimo rytoj! Lauksiu Tavęs! :) ',
      ),
    ],
  );

  final profesine = makeTaskWithMood(
    title: 'Dabartinė situacija',

    pages: [
      // ProfRoleSelectPage(),
      // ProfMaslachScalePart(from: 1, to: 10),
      // ProfMaslachScalePart(from: 11, to: 22),
      // ProfEndPage(),
      TextPage1(
        'Šiandien kviesiu šiek tiek pareflektuoti apie dabartinę Tavo situaciją.',
      ),
      TextPage1(
        'Noriu paklausti, kokie yra dabartiniai didžiausią stresą keliantys Tau dalykai?Jeigu gali, apibūdink juos sau kuo konkrečiau. Prašau ne tik įvardinti sritį – darbas, šeima, sveikata ar kt., bet apibūdinti kuo konkrečiau, pavyzdžiui:„Didžiausią stresą kelia konfliktai su kolege A”; „Neturiu laiko atauti jėgas, nuolat galvoju apie darbą arba reikia rūpintis šeimos reikalais”;„Jaučiu labai daug atsakomybės už pacientus, bijau klysti”;„Nerimauju dėl savo sveikatos, bijau, kas bus, jeigu liga progresuos”.',
      ),
      TextPage1(
        'O kokius būdus naudoji tvarkytis su stresais? Kokie būdai tau padeda atgauti jėgas, nurimti, jausti daugiau energijos?Įrašyk.',
      ),
      TextPage1(
        'Tikiuosi, kad Sodo programoje rasi psichologinių įrankių, kurie padės tvarkytis ir su didžiausiais stresais Tavo gyvenime! Iki susitikimo.',
      ),
      // TextPage1('text'),
    ],
  );

  final savybes = makeTaskWithMood(
    title: 'Kai nebus motyvacijos',
    // emojiBuilder: (onChanged) => SavybesMoodEmojiPage(onChanged: onChanged),
    pages: const [
      // SavybesIntroPage(),
      // BigFiveScalePage(),
      // SavybesResultsInfoPage(),
      // SavybesEndPage(),
      TextPage1(
        'Pasiruošimo Sodo programai metu labai svarbu apgalvoti, ką daryti, kai nebus motyvacijos.',
      ),
      TextPage1(
        'Motyvacija yra gan sudėtingas fenomenas…Kaip manai, kas būtent Tave motyvuoja daryti dalykus?Galbūt noras saugumo, baimė, noras patirti malonias emocijas ar sumažinti nemalonias, išvengti katastrofų, rūpestis savimi? Skirk kelias minutes ir pagalvok apie Tave motyvuojančius veiksnius.',
      ),
      TextPage1(
        'Būna taip, kad žinome, ko norime, bet vis tiek sunku tai daryti dėl nesusiformavusių įpročių. Pavyzdžiui, žinome, kad daržovės - sveika, bet nevalgome jų daugiau, ens nespėjame, neprisimename, teikiame prioritetą kažkam kitam. Tad noriu pakviesti tave pasvarstyti, o kaip sau priminsi dalyvauti šioje Sodo programoje? Kartais per darbų šūsnį gali tiesiog pamiršti paspausti programėlės ikonėlę ar nenorėti prisijungti. Galbūt gali užsirašyti priminimus ar nusistatyti žadintuvą, kuris kiekvieną dieną primintų prisijungti? Galbūt  tiesiog vertybės išsigryninimas (pavyzdžiui, emocinė sveikata) padės Tau? Gal yra dar kokių būdų, kurie padėtų nuosekliai, kiekvieną dieną prisijungti prie šios programos ir formuoti įpročius? Skirk keletą minučių pagalvoti apie tai.',
      ),
      TextPage1(
        'Jeigu manai, kad naudinga, tai kviečiu tiesiog dabar paimti ir nusistatyti žadintuvą, kuris skambės kiekvieną dieną Tau patogiu metu ir taip primins įsijungti programėlę. :) Bet, kaip norisi, gal turi savo būdą! Iki rytojaus! :)',
      ),
      // TextPage1('text'),
    ],
  );

  // 5) Jėgų atstatymas
  final jegu = makeTaskWithMood(
    title: 'Trumpa praktika',
    // emojiBuilder: (onChanged) => JeguMoodEmojiPage(onChanged: onChanged),
    pages: const [
      // SavijautosScalePage(),
      // RecoveryExperiencePage(),
      // JeguResultsInfoPage1(savijautaScore: 12, recoveryScore: 30),
      // JeguEndPage(),
      TextPage1(
        'Kaip minėjau, kartais kviesiu tam tikroms praktikoms čia ir dabar. Noriu pakviesti nesudėtingai ir minimaliai laiko užimančiai praktikai.',
      ),
      TextPage1(
        'Kviečiu tave pastebėti savo kūną. Kuriose kūno dalyse jauti daugiausiai įtampos? Gal gali dabar švelniai pajudėti? Jei gali, pasukio dabar riešus, pėdas ir galvą.',
      ),
      TextPage1(
        'Jeigu jautiesi patogiai - pabandyk atsistoti ir tarsi nusipurtyti įtampą. Jeigu turi daugiau laiko - gali pajudinti pečius, liemenį, pratempti tas vietas, kur jauti daugiausiai įtampos.',
      ),
      TextPage1(
        'Kviečiu kasdien karts nuo karto pastebėti, kiek įsitempęs Tavo kūnas ir sąmoningai kažkiek atpalaiduoti kūną. Iki kito susitikimo :)',
      ),
    ],
  );

  final apieTaveTask = makeTaskWithMood(
    title: 'Nemalonios emocijos',
    // emojiBuilder: (onChanged) => ProfMoodEmojiPage(onChanged: onChanged),
    pages: const [
      // ProfRoleSelectPage(),
      // klausimynas1(),
      // PsichologinisKlausimynasPage(),
      // apie1(),
      TextPage1(
        'Įdomu, kaip tu reaguoji, ką dažniausiai darai ar kaip būni su nemaloniomis emocijomis? Gal gali kelias akimirkas apie tai pagalvoti.',
      ),
      TextPage1(
        'Noriu tik pasakyti, kad gali būti taip, jog sodininkaujant, atliekant praktikas šiame Sode - patirsi nemalonių emocijų. Kviečiu jų neišsigąsti, nepradėti vengti praktikų, bet tiesiog priimti kaip yra ir tęsti.',
      ),
      TextPage1(
        'Tikiuosi, kad po šios Sodo programos patirsi daugiau lengvumo, kad ir kokios emocijos,mintys ar situacijos užkluptų.',
      ),
      TextPage1('Liko tik viena pasiruošimo užduotis ir keliausime toliau :)'),
    ],
  );

  final sodoFantazija = makeTaskWithMood(
    title: 'Sodo fantazija',
    // emojiBuilder: (onChanged) => ProfMoodEmojiPage(onChanged: onChanged),
    pages: [apie1s(), AudioIntroPage2(), apie2s(), apie3s()],
  );

  return [
    kaipViskasVyks,
    nuotaika,
    profesine,
    savybes,
    jegu,
    apieTaveTask,
    sodoFantazija,
  ];
}
