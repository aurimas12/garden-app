import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/pirmieji_vaisiai_task.dart';

List<Task> buildPirmiejiVaisiaiTasks() {
  // 1) Vertybės
  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: 'Vertybės',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Vertybės',
          onFinish: () {
            kaipViskasVyks.done = true;
            onFinish();
          },
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

  // 2) Gyvenimo sritys
  late final Task kaipViskasVyks2;
  kaipViskasVyks2 = Task(
    text: 'Gyvenimo sritys',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Gyvenimo sritys',
          onFinish: () {
            kaipViskasVyks2.done = true;
            onFinish();
          },
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

  // 3) Kokių vaisių nori?
  late final Task kaipViskasVyks3;
  kaipViskasVyks3 = Task(
    text: 'Kokių vaisių nori?',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kokių vaisių nori?',
          onFinish: () {
            kaipViskasVyks3.done = true;
            onFinish();
          },
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

  // 4) Pauzė
  late final Task kaipViskasVyks4;
  kaipViskasVyks4 = Task(
    text: 'Pauzė',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Pauzė',
          onFinish: () {
            kaipViskasVyks4.done = true;
            onFinish();
          },
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

  // 5) O būna tiesiog taip
  late final Task kaipViskasVyks5;
  kaipViskasVyks5 = Task(
    text: 'O būna tiesiog taip',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'O būna tiesiog taip',
          onFinish: () {
            kaipViskasVyks5.done = true;
            onFinish();
          },
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

  // 6) Dėkingumas
  late final Task kaipViskasVyks6;
  kaipViskasVyks6 = Task(
    text: 'Dėkingumas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Dėkingumas',
          onFinish: () {
            kaipViskasVyks6.done = true;
            onFinish();
          },
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

  // 7) Su šypsena
  late final Task kaipViskasVyks7;
  kaipViskasVyks7 = Task(
    text: 'Su šypsena',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Su šypsena',
          onFinish: () {
            kaipViskasVyks7.done = true;
            onFinish();
          },
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
