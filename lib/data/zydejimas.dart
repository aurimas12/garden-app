import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';

import 'package:garden_app/screens/pages/zydejimas_task.dart';

List<Task> buildZydejimasTasks() {
  // 1) Sėdėti ir stebėti
  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: 'Sėdėti ir stebėti',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Sėdėti ir stebėti',
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
            ZydejimoPradziaPage(),
            // SedejimoMeditacijaPage(),
            Audio6Page(),
            SedejimoMeditacijaRefleksijaPage(),
            AciuUzRupestiPage(),
          ],
        ),
  );

  // 2) Nurimti, kad pastebėti
  late final Task kaipViskasVyks2;
  kaipViskasVyks2 = Task(
    text: 'Nurimti, kad pastebėti',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Nurimti, kad pastebėti',
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
            NurimimoIvadinePage(),
            NurimimoBudaiPage(),
            NurimimoRefleksijaPage(),
            KvieciuIsbandytiNurimimoBudaPage(),
          ],
        ),
  );

  // 3) Buvimo džiaugsmas
  late final Task kaipViskasVyks3;
  kaipViskasVyks3 = Task(
    text: 'Buvimo džiaugsmas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Buvimo džiaugsmas',
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
            BuvimoRezimuiPage(),
            IzeminimoPratimasPage(),
            KasdienesPauzesPage(),
            JutimuTyrinejimasPage(),
          ],
        ),
  );

  // 5) Perfekcionizmui
  late final Task kaipViskasVyks5;
  kaipViskasVyks5 = Task(
    text: 'Perfekcionizmui',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Perfekcionizmui',
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
            PerfekcionizmasIvadasPage(),
            PerfekcionizmasPratimasPage(),
            PerfekcionizmasKlausimuPage(),
            PerfekcionizmasIsvadosPage(),
          ],
        ),
  );

  // 6) Netobulai
  late final Task kaipViskasVyks6;
  kaipViskasVyks6 = Task(
    text: 'Netobulai',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Netobulai',
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
            PerfekcionizmoTaisyklesIntroPage(),
            PerfekcionizmoTaisykleVienasPage(),
            PerfekcionizmoTaisykleDuPage(),
            UzbaigimasSiandienPage(),
          ],
        ),
  );

  // 7) Mylintis gerumas
  late final Task kaipViskasVyks7;
  kaipViskasVyks7 = Task(
    text: 'Mylintis gerumas',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: 'Mylintis gerumas',
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
