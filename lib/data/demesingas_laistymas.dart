import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/demesingas_laistymas_task.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';

List<Task> buildDemesingasLaistymasTasks() {

  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: 'Laistyti motyvaciją',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Laistyti motyvaciją',
          onFinish: () {
            kaipViskasVyks.done = true;
            onFinish();
          },
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
