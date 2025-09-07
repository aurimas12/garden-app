import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';
import 'package:garden_app/screens/pages/sodo_draugai_task.dart';




List<Task> buildSodoDraugaiTasks() {
  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: 'Kukutis',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kukutis',
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
            SusipazinimasSuKukuciuPage(),
            KukucioGalybePage(),
            KukucioRefleksijaPage(),
            VidinisSodoDraugasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks2;
  kaipViskasVyks2 = Task(
    text: 'Kalnas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kalnas',
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
            TesinysApieSodoDraugaPage(),
            // KalnoMeditacijaPage(),
            Audio5Page(),
            KalnoMeditacijosRefleksijaPage(),
            SiltiLinkejimaiPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks3;
  kaipViskasVyks3 = Task(
    text: 'Draugiški balsai',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Draugiški balsai',
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
            KalbejimasSuSavimiPage(),
            NuosirdusZodziaiSauPage(),
            BukimeSauDraugaisPage(),
            DraugiskuMinciuPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks4;
  kaipViskasVyks4 = Task(
    text: 'Asertyvumas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Asertyvumas',
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
            SodoDrauguIvadasPage(),
            ElgesioPalyginimasPage(),
            ElgesioStiliaiDetaliauPage(),
            ElgesioStiliaiApibendrinimasPage(),
          ],
        ),
  );

  late final Task kaipViskasVyks5;
  kaipViskasVyks5 = Task(
    text: 'Kad išgirstų',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kad išgirstų', // buvo "DKad išgirstų"
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
            PoreikiuIsakymoIvadasPage(),
            PoreikiuIsakymoTechnikaPage(),
            NesmurtineKomunikacijaPage(),
            PoreikiuIsakymoPriminimasPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks6;
  kaipViskasVyks6 = Task(
    text: 'Kad išgirsčiau',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Kad išgirsčiau',
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
            KlausymosiIvadasPage(),
            KasPadedaKlausytisPage(),
            KasNepadedaKlausytisPage(),
            LinkejimaiPage(),
          ],
        ),
  );


  late final Task kaipViskasVyks7;
  kaipViskasVyks7 = Task(
    text: 'Konfliktų sprendimas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Konfliktų sprendimas',
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
            KonfliktuIvadasPage(),
            CalmModelPage(),
            SmaikstusPatarimasPage(),
            ApkabinuPage(),
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
