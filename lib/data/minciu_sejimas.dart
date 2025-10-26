import 'package:garden_app/data/session.dart';
import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';
import 'package:garden_app/screens/pages/minciu_task.dart';

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

List<Task> buildMinciuSejimasTasks() {

  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: '4 Komponentai',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: '4 Komponentai',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks.mood = emoji;
                kaipViskasVyks.done = true; // kad grafike būtų taškas iškart
              },
            ),
            PsichoKomponentaiPage(),
            InterpretacijosPage(),
            KeitimoStrategijosPage(),
            BraskePratimasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks2;
  kaipViskasVyks2 = Task(
    text: 'Automatinės mintys',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Automatinės mintys',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks2, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks2.mood = emoji;
                kaipViskasVyks2.done = true;
              },
            ),
            KvepavimoMeditacijaPage(),
            MindfulnessIlgaPage(),
            MindfulnessApibendrinimasPage(),
            SportoBakterijosPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks3;
  kaipViskasVyks3 = Task(
    text: 'Realybės interpretacijos',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Realybės interpretacijos',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks3, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks3.mood = emoji;
                kaipViskasVyks3.done = true;
              },
            ),
            MinciuZaidasPage(),
            PrasmiuPriskyrimasPage(),
            BusenosPoveikisPage(),
            VidinisSodasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks4;
  kaipViskasVyks4 = Task(
    text: 'Minčių persėjimas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Minčių persėjimas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks4, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks4.mood = emoji;
                kaipViskasVyks4.done = true;
              },
            ),
            MastymoKrastutinumaiPage(),
            RacionalesnesMintysPage(),
            SituacijuPratimasPage(),
            DraugiskosMintysPabaigaPage(),
          ],
        ),
  );

  late final Task kaipViskasVyks5;
  kaipViskasVyks5 = Task(
    text: 'Mintys kaip debesys',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Mintys kaip debesys',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks5, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks5.mood = emoji;
                kaipViskasVyks5.done = true;
              },
            ),
            MintysKaipDebesysPage(),
            SodoTyrinejimasPage(),
            MintiesPerformulavimasPage(),
            SantykisSuMintimisApibendrinimasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks6;
  kaipViskasVyks6 = Task(
    text: 'Neramios mintys',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Neramios mintys',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks6, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks6.mood = emoji;
                kaipViskasVyks6.done = true;
              },
            ),
            NerimastinguMinciuIvadasPage(),
            NerimoTechnikosPastabaPage(),
            NerimavimoTechnikaPage1(),
            NerimoPratimoPabaigaPage(),
          ],
        ),
  );

  late final Task kaipViskasVyks7;
  kaipViskasVyks7 = Task(
    text: 'Aplinkos stebėjimas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Aplinkos stebėjimas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks7, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks7.mood = emoji;
                kaipViskasVyks7.done = true;
              },
            ),
            SkirtingiAkiniaiPage(),
            PasaulioAkiniaiPage(),
            // PilnaprotaujantisZiurejimasPage(),
            Audio1Page(),
            AntrosSavaitesPabaigaPage(),
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
