import 'package:garden_app/data/session.dart';
import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/demesingas_laistymas_task.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';
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

List<Task> buildDemesingasLaistymasTasks() {

  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: 'Laistyti motyvaciją',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Laistyti motyvaciją',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks.mood = emoji;
                kaipViskasVyks.done = true; // taškas grafike iškart
              },
            ),
            MotyvacijosIvedimasPage(),
            KliutysIrSprendimaiPage(),
            MotyvacijosEsmePage(),
            SavimasazoKvietimasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks2;
  kaipViskasVyks2 = Task(
    text: 'Geras miegas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Geras miegas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks2, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks2.mood = emoji;
                kaipViskasVyks2.done = true;
              },
            ),
            MiegoHigienaIntroPage(),
            MiegoHigienosPrincipaiPage(),
            MiegoIpareigojimasPage(),
            LinkiuGeroMiegoPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks3;
  kaipViskasVyks3 = Task(
    text: 'Maistas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Maistas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks3, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks3.mood = emoji;
                kaipViskasVyks3.done = true;
              },
            ),
            LinkiuGeroMiegoPage1(),
            KlausimaiApieMitybaPage(),
            MitybosPokyciaiPage(),
            DemesingasValgymasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks4;
  kaipViskasVyks4 = Task(
    text: 'Laistyti kūną',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Laistyti kūną',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks4, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks4.mood = emoji;
                kaipViskasVyks4.done = true;
              },
            ),
            VandensSvarbaPage(),
            KiekVandensReikiaPage(),
            VandensUzdotisPage(),
            SiltuLinkejimuPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks5;
  kaipViskasVyks5 = Task(
    text: 'Judėjimo svarba',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Judėjimo svarba',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks5, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks5.mood = emoji;
                kaipViskasVyks5.done = true;
              },
            ),
            FizinisAktyvumasIvadasPage(),
            FizinisAktyvumasKlausimaiPage(),
            // RaumenuRelaksacijaIntroPage(),
            Audio4Page(),
            SportoMotyvacijaPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks6;
  kaipViskasVyks6 = Task(
    text: 'Kūno skenavimas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kūno skenavimas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks6, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks6.mood = emoji;
                kaipViskasVyks6.done = true;
              },
            ),
            IsbuvimoPraktikaPage(),
            // KunoSkenavimoPraktikaPage(),
            Audio3Page(),
            KunoSkenavimoRefleksijaPage(),
            IsbutiSuDiskomfortuPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks7;
  kaipViskasVyks7 = Task(
    text: 'Vis palaistyti',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Vis palaistyti',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks7, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks7.mood = emoji;
                kaipViskasVyks7.done = true;
              },
            ),
            RefleksijaApieKunoPoreikiusPage(),
            KunoPoreikiaiPapildymasPage(),
            KunoIprociaiPage(),
            SveikinimasPuseKelioPage(),
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
