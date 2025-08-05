import 'package:flutter/material.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/pages/apietavetask.dart';
// import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/pages/gad7_page.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';
import 'package:garden_app/screens/pages/jegu_result_page_info.dart';
import 'package:garden_app/screens/pages/phq9_page.dart';
import 'package:garden_app/screens/pages/profesine_savijauta.dart';
import 'package:garden_app/screens/pages/savybes_pages.dart';
import '../models/task.dart';
import '../screens/paged_task_screen.dart';
import '../screens/pages/text_page.dart';

List<Task> buildPasiruosimasTasks() {
  // 1) Kaip viskas vyks – 5 puslapiai
  final kaipViskasVyks = Task(
    text: 'Kaip viskas vyks',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kaip viskas vyks',
          onFinish: onFinish,
          pages: [
            TextPage1(
              'Džiugu, kad prisijungei, čia rūpinsimės Tavo vidiniu sodu. Šią programą sudaro trumpos praktikos, kurios skatins atsigręžti į save. '
              'Tikiuosi, kad po 8 savaičių Sodo programos, tavo savijauta pagerės.\n\n'
              'O viskas vyks taip. 8 savaites, kiekvieną dieną kviesiu Tave atlikti po vieną trumpą praktiką (vidutiniškai iki 10 minučių).',
              // title: '',
              // leadingIcon: null,
            ),
            const TextPage1(
              'Sodo programa turi tam tikrą svarbų eiliškumą – todėl tik atlikus vieną užduotį – atsidarys kita. Rekomenduoju atlikti vieną praktiką per dieną. '
              'Gali atlikti ir daugiau, tačiau naujas savaitės užduočių blokelis atsidarys kas savaitę. Jeigu nekantrausi ir atliksi daugiau praktikų per dieną, viskas gerai – '
              'kviečiu nueiti į skiltį „Ekstra” ir praktikuoti papildomas užduotis iki kol atsidarys naujos savaitės praktikos.',
              // leadingIcon: null,
              // title: '',
            ),
            const TextPage1(
              'Taip pat kviečiu nusistatyti priminimus, kurie gali padėti sodininkauti nuosekliai, tai gali padaryti priminimų skiltyje.',
              // leadingIcon: null,
              // title: '',
            ),
            const TextPage1(
              'Beje, kiekvienos praktikos pradžioje kviesiu tave pažymėti savo nuotaiką, o nuotaikos grafikėlį taip pat galėsi matyti „Rezultatuose”.\n'
              'Daug neišsiplėsiu, nes vis dėlto darbuotis Sode – labiau padeda užauginti vaisių, nei skaityti ar mąstyti apie sodą.',
              // leadingIcon: null,
              // title: '',
            ),
            const TextPage1(
              'Tik noriu perspėti, kad praktikų eigoje, ypač pirmoje pusėje, gali susidurti su įvairiomis demotyvuojančiomis mintimis. '
              'Vienintelis būdas sužinoti, ar ši Sodo programa Tau – duoti laiko išmėginti. Atlik praktikas iki galo ir pažiūrėk, ar jos padarė pokytį!\n\n'
              'Susitikime rytoj užpildyti pirmąją skalę, iki! 😊',
              // leadingIcon: null,
              // title: '',
            ),
          ],
        ),
  );

  // 2) Nuotaika – kol kas tekstiniai puslapiai (vėliau į t2/t3 įdėsim skalę)
  // final nuotaika = Task(
  //   text: 'Nuotaika',
  //   screenBuilder:
  //       (onFinish) => PagedTaskScreen(
  //         title: 'Nuotaika',
  //         onFinish: onFinish,
  //         pages: [
  //           const TextPage(
  //             'Kviečiu užpildyti pirmas skales apie emocinę savijautą. Čia rasi dvi trumpas skales, kurios skirtos nuotaikai įvertinti. '
  //             'Kai užpildysi ir paspausi „Atlikta“ – pamatysi rezultatų įverčius, juos vėliau rasi skiltyje „Rezultatai“.',
  //           ),
  //           Phq9Page(onFinish: () {}),
  //           // TextPage('PHQ-9 instrukcija + klausimai (0–3).'),
  //           const TextPage('GAD-7 instrukcija + klausimai (0–3).'),
  //           const TextPage(
  //             'Rezultatų paaiškinimas: kuo didesnis balas – tuo daugiau simptomų.',
  //           ),
  //           const TextPage('Užpildei šiandienos skales – puiku!'),
  //         ],
  //       ),
  // );
  final nuotaika = Task(
    text: 'Nuotaika',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Nuotaika',
          onFinish: onFinish,
          pages: [
            // 1) Emoji pasirinkimas
            MoodEmojiPage(
              onChanged: (emoji) {
                // jei norėsi, galime čia perduoti į state / result storage
              },
            ),

            // 2) Įvadas
            const TextPage1(
              'Kviečiu užpildyti pirmas skales apie emocinę savijautą. '
              'Čia rasi dvi trumpas skales, kurios skirtos nuotaikai įvertinti. '
              'Kai užpildysi ir paspausi „Atlikta“ – pamatysi rezultatų įverčius, '
              'juos vėliau galėsi rasti skiltyje „Rezultatai“.',
              // title: 'Apie skales',
              // leadingIcon: Icons.info_outline,
            ),

            // 3) PHQ-9
            const Phq9Page(),

            // 4) GAD-7
            const Gad7Page(),

            // 5) Rezultatų paaiškinimas
            const TextPage1(
              'Žemiau matysi skalių rezultatus, jos labiausiai vertina depresijos (PHQ-9) '
              'ir nerimo (GAD-7) simptomus. Žiūrėk į rezultatus kritiškai – skalės padeda '
              'suprasti situaciją, tačiau jos nėra diagnozė.\n\n'
              'Jei balai aukšti ir jauti, kad simptomai apsunkina kasdienę veiklą, '
              'santykius ar kelia nuolatinę kančią – verta pasitarti su specialistu.\n\n'
              'Užpildei visas šiandien numatytas skales, puiku! Lauksiu Tavęs rytoj.',
              // title: 'Rezultatų paaiškinimas',
              // leadingIcon: Icons.insights,
            ),
          ],
        ),
  );
  // 3) Profesinė savijauta – laikinai tekstai
  // final profesine = Task(
  //   text: 'Profesinė savijauta',
  //   screenBuilder:
  //       (onFinish) => PagedTaskScreen(
  //         title: 'Profesinė savijauta',
  //         onFinish: onFinish,
  //         pages: const [
  //           TextPage('Kokia šiandien Tavo nuotaika? (įvadinis tekstas)'),
  //           TextPage(
  //             'Pasirink: Esu medikas / Esu studentas (mygtukai – vėliau)',
  //           ),
  //           TextPage('Instrukcija: Įsivertink 0–6 pagal teiginius (1–10).'),
  //           TextPage('Instrukcija: Įsivertink 0–6 pagal teiginius (11–16).'),
  //           TextPage('Instrukcija: Įsivertink 0–6 pagal teiginius (17–22).'),
  //         ],
  //       ),
  // );
  // final profesine = Task(
  //   text: 'Profesinė savijauta',
  //   screenBuilder:
  //       (onFinish) => PagedTaskScreen(
  //         title: 'Profesinė savijauta',
  //         onFinish: onFinish,
  //         pages: [
  //           const MoodEmojiPage(), // 1) Nuotaikos emoji
  //           const RoleSelectPage(), // 2) Pasirinkimas: medikas/studentas
  //           ScaleQuestionPage(
  //             // 3) Klausimai 1–10 (0–6)
  //             title: 'Įsivertinimas (1–10 klausimai)',
  //             questions: [
  //               '1. Jaučiu, kad darbas mane emociškai išsekina.',
  //               '2. Darbo dienos pabaigoje jaučiuosi išeikvojęs jėgas.',
  //               '3. Atsikėlęs ryte, prieš prasidedant naujai darbo dienai, jaučiuosi pavargęs.',
  //               '4. Galiu lengvai suprasti, kaip jaučiasi mano pacientai.',
  //               '5. Aš jaučiu, kad su kai kuriais pacientais elgiuosi kaip su daiktais.',
  //               '6. Visą dieną dirbdamas su žmonėmis aš tikrai jaučiu įtampą.',
  //               '7. Aš labai veiksmingai tvarkausi su savo pacientų problemomis.',
  //               '8. Jaučiuosi „perdegęs“ nuo savo darbo.',
  //               '9. Jaučiu, kad savo darbu darau teigiamą poveikį kitų žmonių gyvenimui.',
  //               '10. Nuo to laiko, kai pradėjau dirbti šį darbą, aš tapau atsainesnis žmonėms.',
  //             ],
  //           ),
  //           ScaleQuestionPage(
  //             // 4) Klausimai 11–22 (0–6)
  //             title: 'Įsivertinimas (11–22 klausimai)',
  //             questions: [
  //               '11. Aš nerimauju, kad dėl šio darbo tampu emociškai šaltesnis.',
  //               '12. Jaučiuosi labai energingas.',
  //               '13. Darbas man kelia dirglumą ir susierzinimą.',
  //               '14. Aš jaučiu, kad mano darbas reikalauja per daug pastangų.',
  //               '15. Man nelabai rūpi, kas nutinka kai kuriems pacientams.',
  //               '16. Tiesioginis darbas su žmonėmis man kelia per didelį stresą.',
  //               '17. Dirbant su pacientais man lengvai pavyksta sukurti aplinką be įtampos.',
  //               '18. Po tiesioginio darbo su savo pacientais jaučiuosi pakylėtas.',
  //               '19. Šiame darbe esu įgyvendinęs daug vertingų dalykų.',
  //               '20. Jaučiuosi tarsi būčiau pasiekęs savo jėgų ir kantrybės ribas.',
  //               '21. Emocines problemas darbe sprendžiu labai ramiai.',
  //               '22. Jaučiu, kad pacientai mane kaltina dėl kai kurių savo problemų.',
  //             ],
  //           ),
  //           const EndTextPage(
  //             // 5) Pabaigos tekstas
  //             text:
  //                 'Užpildei visą skalę, puiku! Dėl autorinių teisių grįžtamąjį ryšį pateiksiu po intervencijos. '
  //                 'Kitą kartą kviesiu užpildyti klausimyną apie Tavo savybes, pvz., ekstraversiją, neurotiškumą. Iki!',
  //           ),
  //         ],
  //       ),
  // );
  Task buildProfesineSavijautaTask() {
    return Task(
      text: 'Profesinė savijauta',
      screenBuilder:
          (onFinish) => PagedTaskScreen(
            title: 'Profesinė savijauta',
            onFinish: onFinish,
            pages: const [
              ProfMoodEmojiPage(), // psl. 1
              ProfRoleSelectPage(), // psl. 2 (Tęsti -> NextPageNotification)
              ProfMaslachScalePart(from: 1, to: 10), // psl. 3
              ProfMaslachScalePart(from: 11, to: 22), // psl. 4
              ProfEndPage(), // psl. 5
            ],
          ),
    );
  }

  // // 4) Savybės
  // final savybes = Task(
  //   text: 'Savybės',
  //   screenBuilder:
  //       (onFinish) => PagedTaskScreen(
  //         title: 'Savybės',
  //         onFinish: onFinish,
  //         pages: const [
  //           TextPage('Įvadas apie Didįjį Penketą.'),
  //           TextPage('Instrukcija: 1–5 skalė.'),
  //           TextPage('Teiginiai 1–20.'),
  //           TextPage('Teiginiai 21–40.'),
  //           TextPage('Teiginiai 41–60.'),
  //         ],
  //       ),
  // );
  Task buildSavybesTask() {
    return Task(
      text: 'Savybės',
      screenBuilder:
          (onFinish) => PagedTaskScreen(
            title: 'Savybės',
            onFinish: onFinish,
            pages: const [
              SavybesMoodEmojiPage(), // page 1
              SavybesIntroPage(), // page 2
              BigFiveScalePage(), // page 3 – 60 teiginių 1..5
              SavybesResultsInfoPage(), // page 4
              SavybesEndPage(), // page 5
            ],
          ),
    );
  }

  // // 5) Jėgų atstatymas
  // final jegu = Task(
  //   text: 'Jėgų atstatymas',
  //   screenBuilder:
  //       (onFinish) => PagedTaskScreen(
  //         title: 'Jėgų atstatymas',
  //         onFinish: onFinish,
  //         pages: const [
  //           TextPage('Įvadas: savijautos klausimynas (0–5).'),
  //           TextPage('Savijautos teiginiai.'),
  //           TextPage('Įvadas: atsistatymo nuo streso (1–4).'),
  //           TextPage('Atsistatymo teiginiai.'),
  //           TextPage('Rezultatų paaiškinimas ir ribos.'),
  //         ],
  //       ),
  // );
  final jegu = Task(
    text: 'Jėgų atstatymas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Jėgų atstatymas',
          onFinish: onFinish,
          pages: const [
            JeguMoodEmojiPage(), // page1
            SavijautosScalePage(), // page2
            RecoveryExperiencePage(), // page3
            // JeguResultsInfoPage(), // page4
            JeguResultsInfoPage1(savijautaScore: 12, recoveryScore: 30),
            JeguEndPage(), // page5
          ],
        ),
  );
  // // 6) Šiek tiek apie Tave
  // final apieTave = Task(
  //   text: 'Šiek tiek apie Tave',
  //   screenBuilder:
  //       (onFinish) => PagedTaskScreen(
  //         title: 'Šiek tiek apie Tave',
  //         onFinish: onFinish,
  //         pages: const [
  //           TextPage('Įvadas: demografiniai klausimai.'),
  //           TextPage('Darbo kontekstas, krūvis, budėjimai, atlygis.'),
  //           TextPage('Miegas, santykiai, vaikai, aktyvumas.'),
  //           TextPage('Stresas (0–10), terapija, sutrikimai, vaistai.'),
  //           TextPage('Pabaiga: Ačiū! Pereinam prie vizualizacijos.'),
  //         ],
  //       ),
  // );
  final apieTaveTask = Task(
    text: 'Šiek tiek apie Tave',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Šiek tiek apie Tave',
          onFinish: onFinish,
          pages: const [
            MoodSelectionPage(), // page1
            RoleSelectionPage(),
            QuestionnairePage(),
            FinalQuestionsPage(),
            FinalPage(),
          ],
        ),
  );

  // // 7) Sodo fantazija
  // final sodoFantazija = Task(
  //   text: 'Sodo fantazija',
  //   screenBuilder:
  //       (onFinish) => PagedTaskScreen(
  //         title: 'Sodo fantazija',
  //         onFinish: onFinish,
  //         pages: const [
  //           TextPage('Kokia šiandien Tavo nuotaika? (įvadas)'),
  //           TextPage('Instrukcija: balso įrašymas apie sodą.'),
  //           TextPage('Mygtukas: „Tęsti be įrašymo“ (vėliau)'),
  //           TextPage('Baigiamasis tekstas.'),
  //           TextPage('Valio! Pasiruošimas baigtas.'),
  //         ],
  //       ),
  // );

  return [
    kaipViskasVyks,
    nuotaika,
    // profesine,
    buildProfesineSavijautaTask(),
    // savybes,
    buildSavybesTask(),
    jegu,
    apieTaveTask,
    // sodoFantazija,
  ];
}
