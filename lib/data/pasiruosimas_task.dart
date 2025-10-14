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
import 'package:garden_app/widgets/text_template.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';
import '../screens/paged_task_screen.dart';
import '../screens/pages/text_page.dart';


typedef EmojiPageBuilder = Widget Function(ValueChanged<String> onChanged);

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
          onFinish: () {
            t.done = true;
            onFinish();
          },
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
    title: 'Nuotaika',

    markDoneOnPick: true,
    pages: [
      TextPage1(
        'Kviečiu užpildyti pirmas skales apie emocinę savijautą. '
        'Čia rasi dvi trumpas skales, kurios skirtos nuotaikai įvertinti. '
        'Kai užpildysi ir paspausi „Atlikta“ – pamatysi rezultatų įverčius, '
        'juos vėliau galėsi rasti skiltyje „Rezultatai“.',
      ),

      // Phq9Page(),
      // Gad7Page(),
      Phq9Page(
        onSubmitted: (answers, total) async {
          final id = await Session.getAccountId();
          if (id == null) return;
          await QuestionnaireApi.submit(
            accountId: id,
            kind: 'phq9',
            answers: answers,
            total: total,
            taskCode: 'Nuotaika',
          );
        },
      ),

      Gad7Page(
        onSubmitted: (answers, total) async {
          final id = await Session.getAccountId();
          if (id == null) return;
          await QuestionnaireApi.submit(
            accountId: id,
            kind: 'gad7',
            answers: answers,
            total: total,
            taskCode: 'Nuotaika',
          );
        },
      ),
      TextPage1(
        'Žemiau matysi skalių rezultatus, jos labiausiai vertina depresijos (PHQ-9) '
        'ir nerimo (GAD-7) simptomus. Žiūrėk į rezultatus kritiškai – skalės padeda '
        'suprasti situaciją, tačiau jos nėra diagnozė.\n\n'
        'Jei balai aukšti ir jauti, kad simptomai apsunkina kasdienę veiklą, '
        'santykius ar kelia nuolatinę kančią – verta pasitarti su specialistu.\n\n'
        'Užpildei visas šiandien numatytas skales, puiku! Lauksiu Tavęs rytoj.',
      ),
    ],
  );

 
  final profesine = makeTaskWithMood(
    title: 'Profesinė savijauta',

    pages: [
      ProfRoleSelectPage(),
      ProfMaslachScalePart(from: 1, to: 10),
      ProfMaslachScalePart(from: 11, to: 22),
      ProfEndPage(),
    ],
  );


  final savybes = makeTaskWithMood(
    title: 'Savybės',
    // emojiBuilder: (onChanged) => SavybesMoodEmojiPage(onChanged: onChanged),
    pages: const [
      SavybesIntroPage(),
      BigFiveScalePage(),
      SavybesResultsInfoPage(),
      SavybesEndPage(),
    ],
  );

  // 5) Jėgų atstatymas
  final jegu = makeTaskWithMood(
    title: 'Jėgų atstatymas',
    // emojiBuilder: (onChanged) => JeguMoodEmojiPage(onChanged: onChanged),
    pages: const [
      SavijautosScalePage(),
      RecoveryExperiencePage(),
      JeguResultsInfoPage1(savijautaScore: 12, recoveryScore: 30),
      JeguEndPage(),
    ],
  );


  final apieTaveTask = makeTaskWithMood(
    title: 'Šiek tiek apie Tave',
    // emojiBuilder: (onChanged) => ProfMoodEmojiPage(onChanged: onChanged),
    pages: const [
      ProfRoleSelectPage(),
      klausimynas1(),
      PsichologinisKlausimynasPage(),
      apie1(),
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
