import 'package:garden_app/data/session.dart';
import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';

import 'package:garden_app/screens/pages/zydejimas_task.dart';
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



List<Task> buildZydejimasTasks() {

  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: 'Sėdėti ir stebėti',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Sėdėti ir stebėti',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks.mood = emoji;
                kaipViskasVyks.done = true;
              },
            ),
            ZydejimoPradziaPage(),
            // SedejimoMeditacijaPage(),
            Audio6Page(),
            SedejimoMeditacijaRefleksijaPage(),
            AciuUzRupestiPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks2;
  kaipViskasVyks2 = Task(
    text: 'Nurimti, kad pastebėti',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Nurimti, kad pastebėti',
          
          onFinish: () => _reportTaskCompletion(kaipViskasVyks2, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks2.mood = emoji;
                kaipViskasVyks2.done = true;
              },
            ),
            NurimimoIvadinePage(),
            NurimimoBudaiPage(),
            NurimimoRefleksijaPage(),
            KvieciuIsbandytiNurimimoBudaPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks3;
  kaipViskasVyks3 = Task(
    text: 'Buvimo džiaugsmas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Buvimo džiaugsmas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks3, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks3.mood = emoji;
                kaipViskasVyks3.done = true;
              },
            ),
            DarymoIrBuvimoIvadasPage(),
            // PedosPage(),
            Audio7Page(),
            PeduRefleksijaPage(),
            GyvenimoZiedeliaiPage(),
          ],
        ),
  );

  // 4) Kasdienis stebėjimas
  late final Task kaipViskasVyks4;
  kaipViskasVyks4 = Task(
    text: 'Kasdienis stebėjimas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kasdienis stebėjimas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks4, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks4.mood = emoji;
                kaipViskasVyks4.done = true;
              },
            ),
            BuvimoRezimuiPage(),
            IzeminimoPratimasPage(),
            KasdienesPauzesPage(),
            JutimuTyrinejimasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks5;
  kaipViskasVyks5 = Task(
    text: 'Perfekcionizmui',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Perfekcionizmui',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks5, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks5.mood = emoji;
                kaipViskasVyks5.done = true;
              },
            ),
            PerfekcionizmasIvadasPage(),
            PerfekcionizmasPratimasPage(),
            PerfekcionizmasKlausimuPage(),
            PerfekcionizmasIsvadosPage(),
          ],
        ),
  );

  
  late final Task kaipViskasVyks6;
  kaipViskasVyks6 = Task(
    text: 'Netobulai',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Netobulai',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks6, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks6.mood = emoji;
                kaipViskasVyks6.done = true;
              },
            ),
            PerfekcionizmoTaisyklesIntroPage(),
            PerfekcionizmoTaisykleVienasPage(),
            PerfekcionizmoTaisykleDuPage(),
            UzbaigimasSiandienPage(),
          ],
        ),
  );

 
  late final Task kaipViskasVyks7;
  kaipViskasVyks7 = Task(
    text: 'Mylintis gerumas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Mylintis gerumas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks7, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks7.mood = emoji;
                kaipViskasVyks7.done = true;
              },
            ),
            KvietimasIAjautaPage(),
            // MylincioGerumoMeditacijaPage(),
            // Audio6Page(),
            Audio8Page(),
            MylincioGerumoRefleksijaPage(),
            SveikinimasDarVienosSavaitesPage(),
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
