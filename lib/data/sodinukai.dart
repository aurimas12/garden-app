import 'package:garden_app/data/session.dart';
import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';
import 'package:garden_app/screens/pages/sodinukai_task.dart';
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

List<Task> buildSodinukaiTasks() {

  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: 'Gauti, kad duoti',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Gauti, kad duoti',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks.mood = emoji;
                kaipViskasVyks.done = true; // taškas grafike iškart
              },
            ),
            SavaitesPradziaSavirupaPage(),
            PerdegimasGautiPage(),
            JeguAtkurimoIdejosPage(),
            SavaitesPabaigosTrumpaPage(),
          ],
        ),
  );

  
  late final Task kaipViskasVyks2;
  kaipViskasVyks2 = Task(
    text: 'Malonumų sodinukai',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Malonumų sodinukai',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks2, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks2.mood = emoji;
                kaipViskasVyks2.done = true;
              },
            ),
            DzuginanciosVeiklosPage(),
            IrasytiVeiklasPage(),
            SuplanuotiVeiklaPage(),
            KavosAkimirkaPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks3;
  kaipViskasVyks3 = Task(
    text: 'Ribų sodinukai',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Ribų sodinukai',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks3, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks3.mood = emoji;
                kaipViskasVyks3.done = true;
              },
            ),
            RibosSantykyjePage(),
            NePratimasPage(),
            KaipBuvoTauPage(),
            PasirupinimoPabaigaPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks4;
  kaipViskasVyks4 = Task(
    text: 'Įsisąmoninti gavimą',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Įsisąmoninti gavimą',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks4, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks4.mood = emoji;
                kaipViskasVyks4.done = true;
              },
            ),
            DekingumoIvadasPage(),
            DekingumoPraktikaPage(),
            DekingumoApibendrinimasPage(),
            AciuUzPraktikasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks5;
  kaipViskasVyks5 = Task(
    text: 'Davimo sodinukai',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Davimo sodinukai',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks5, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks5.mood = emoji;
                kaipViskasVyks5.done = true;
              },
            ),
            PozirisIDavimaIntroPage(),
            DavimasBeLukesciuPage(),
            PerdegimoVengimasPage(),
            PabaigaBeLukesciuPage(),
          ],
        ),
  );

 
  late final Task kaipViskasVyks6;
  kaipViskasVyks6 = Task(
    text: 'Kaip pasodinti perdegimą',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kaip pasodinti perdegimą',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks6, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks6.mood = emoji;
                kaipViskasVyks6.done = true;
              },
            ),
            MesNesameIndaiPage(),
            PerdegimoRizikosVeiksniaiPage(),
            RizikosVeiksniuApmasymasPage(),
            IkiKitoKartoPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks7;
  kaipViskasVyks7 = Task(
    text: 'Atsigręžti į kūną',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Atsigręžti į kūną',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks7, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks7.mood = emoji;
                kaipViskasVyks7.done = true;
              },
            ),
            MindfulnessJudesiaiIntroPage(),
            // DemesinguJudesiuPraktikaPage(),
            Audio2Page(),
            PraktikosApibendrinimasPage(),
            Sveikinimas21UzduotisPage(),
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
