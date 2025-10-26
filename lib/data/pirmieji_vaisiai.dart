import 'package:garden_app/data/session.dart';
import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/pirmieji_vaisiai_task.dart';
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
List<Task> buildPirmiejiVaisiaiTasks() {

  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: 'Vertybės',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Vertybės',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks.mood = emoji;
                kaipViskasVyks.done = true;
              },
            ),
            VertybiuIvadasPage(),
            VertybiuSarasasPage(),
            VertybiuRefleksijaPage(),
            VertybiuApibendrinimasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks2;
  kaipViskasVyks2 = Task(
    text: 'Gyvenimo sritys',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Gyvenimo sritys',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks2, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks2.mood = emoji;
                kaipViskasVyks2.done = true;
              },
            ),
            VertybiuApibendrinimasPage1(),
            GyvenimoSriciuVertinimasPage(),
            GyvenimoSriciuPlanavimasPage(),
            PuikuGalimeKeliautiToliauPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks3;
  kaipViskasVyks3 = Task(
    text: 'Kokių vaisių nori?',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kokių vaisių nori?',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks3, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks3.mood = emoji;
                kaipViskasVyks3.done = true;
              },
            ),
            PuikuGalimeKeliautiToliauPage(),
            PasirinkimoKryzkelePage(),
            PasirinkimoKryzkeleApibendrinimasPage(),
            PasirinkimoKryzkeleKlausimasPage(),
          ],
        ),
  );

  
  late final Task kaipViskasVyks4;
  kaipViskasVyks4 = Task(
    text: 'Pauzė',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Pauzė',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks4, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks4.mood = emoji;
                kaipViskasVyks4.done = true;
              },
            ),
            StabteltiKvietimasPage(),
            TrumpaKvepavimoPauzePage(),
            StabtelejimoNaudaPage(),
            SiltiLinkejimaiPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks5;
  kaipViskasVyks5 = Task(
    text: 'O būna tiesiog taip',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'O būna tiesiog taip',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks5, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks5.mood = emoji;
                kaipViskasVyks5.done = true;
              },
            ),
            GyvenimoIstorijaIntroPage(),
            AntAtbrailosPage(),
            AntAtbrailosTesinysPage(),
            AntAtbrailosPabaigaPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks6;
  kaipViskasVyks6 = Task(
    text: 'Dėkingumas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Dėkingumas',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks6, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks6.mood = emoji;
                kaipViskasVyks6.done = true;
              },
            ),
            DekingumoIvadasPage(),
            DekingumoPratimasPage(),
            DekingumoPrimimasPage(),
            DekojimoPraktikaiPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks7;
  kaipViskasVyks7 = Task(
    text: 'Su šypsena',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Su šypsena',
          onFinish: () => _reportTaskCompletion(kaipViskasVyks7, onFinish),
          pages: [
            MoodEmojiPage(
              onChanged: (emoji) {
                kaipViskasVyks7.mood = emoji;
                kaipViskasVyks7.done = true;
              },
            ),
            SviesiojiGyvenimoPusePage(),
            HumoroIstoryjaIntroPage(),
            HumoroIstorijaPage(),
            PriespaskutineSavaitePage(),
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
