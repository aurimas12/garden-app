import 'package:garden_app/data/session.dart';
import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';
import 'package:garden_app/screens/pages/puoselejimas_task.dart';
import 'package:garden_app/screens/pages/text_page.dart';
import 'package:garden_app/services/task_event_api.dart';

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


List<Task> buildPuoselejimasTasks() {
  // 1) Sunkiu metu
  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: 'Sunkiu metu',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Sunkiu metu',
          // onFinish: () {
          //   kaipViskasVyks.done = true;
          //   onFinish();
          // },
          onFinish: () => _reportTaskCompletion(kaipViskasVyks, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks.mood = emoji;
                kaipViskasVyks.done = true;
              },
            ),
            EsamojoLaikoMeditacijosIvadinisPage(),
            // EsamojoLaikoMeditacijosIvadinisPage(),
            Audio9Page(),
            EsamojoLaikoRefleksijaPage(),
            ApkabinimuPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks2;
  kaipViskasVyks2 = Task(
    text: 'Dar prieš perdegant',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Dar prieš perdegant',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks2, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks2.mood = emoji;
                kaipViskasVyks2.done = true;
              },
            ),
            PervargimoZenklaiPage(),
            PervargimoPazymiaiPage(),
            JeguAtstatymoVeiksmaiPage(),
            TikiuosiPraversPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks3;
  kaipViskasVyks3 = Task(
    text: 'Saugi vieta',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Saugi vieta',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks3, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks3.mood = emoji;
                kaipViskasVyks3.done = true;
              },
            ),
            SaugiVietaIvadasPage(),
            // ZaidimoPuoselejimasPage(),
            Audio10Page(),
            SaugiVietaTitlePage(),
            SaugiVietaTitlePage1(),
          ],
        ),
  );

 
  late final Task kaipViskasVyks4;
  kaipViskasVyks4 = Task(
    text: 'Kūryba ir žaidimas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kūryba ir žaidimas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks4, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks4.mood = emoji;
                kaipViskasVyks4.done = true;
              },
            ),
            ZaidimoPrimReminderPage(),
            ZaidimoPuoselejimasTekstasPage(),
            MedicJokesPage(),
            ZaidimoKlausimasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks5;
  kaipViskasVyks5 = Task(
    text: 'Apibendrinimas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Apibendrinimas',
          // onFinish: () async {
          //   kaipViskasVyks5.done = true;
          //   onFinish();

          //   final accountId = await Session.getAccountId();
          // if (accountId != null) {
          //   try {
          //     // Iškviečiame TaskService, kuris naudoja TaskEventApi
          //     await TaskService.completeTask(
          //       userPin: accountId.toString(),
          //       taskCode: 'Sunkiu metu', // Naudojame Title kaip task_code
          //     );
          //   } catch (e) {
          //     // Tvarkome klaidas, jei reikia
          //   }
          // }
          // },
          onFinish: () => _reportTaskCompletion(kaipViskasVyks5, onFinish),
          pages: [
            TextPage1('Noriu paklausti, kaip tau ši Sodo programa? Gal gali apibendrinti, kiek pavyko įsitraukti, kokius pozityvius dalykus išsineši?'),
            TextPage1('Prašau, įrašyk žemiau arba pasakyk sau balsu, kaip įsipareigoji toliau savimi rūpintis?'),
            TextPage1('Siunčiu virtualų apkabinimą! Jeigu nori, gali apkabinti save!'),
            TextPage1('Ačiū Tau, ka rūpiniesi savimi! Susitikime rytoj.'),
          ],
        ),
  );

 
  late final Task kaipViskasVyks6;
  kaipViskasVyks6 = Task(
    text: 'Sodo vizualizacija',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Sodo vizualizacija',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks6, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks6.mood = emoji;
                kaipViskasVyks6.done = true;
              },
            ),
            SodoBalsoUzduotisBlock(),
            CharakterioSkalePage(),
            CharakterioRezultataiPage(),
            SkalemsAciuPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks7;
  kaipViskasVyks7 = Task(
    text: 'Laiškas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Laiškas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks7, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks7.mood = emoji;
                kaipViskasVyks7.done = true;
              },
            ),
            PaskutineUzduotisPage(),
            LaiskoInstrukcijaPage(),
            PabaigosTekstasPage(),
            PabaigosTekstasPage1(),
          ],
        ),
  );

  return [
    kaipViskasVyks,
    kaipViskasVyks2,
    kaipViskasVyks3,
    kaipViskasVyks4,
    kaipViskasVyks5,
    kaipViskasVyks6,
    kaipViskasVyks7,
  ];
}
