import 'package:garden_app/models/task.dart';
import 'package:garden_app/screens/mood_emoji_page.dart';
import 'package:garden_app/screens/paged_task_screen.dart';
import 'package:garden_app/screens/pages/jegu_atstatymas.dart';
import 'package:garden_app/screens/pages/minciu_task.dart';


List<Task> buildMinciuSejimasTasks() {

  late final Task kaipViskasVyks;
  kaipViskasVyks = Task(
    text: '4 Komponentai',
    screenBuilder:
        (onFinish) => PagedTaskScreen(
          title: '4 Komponentai',
          onFinish: () {
            kaipViskasVyks.done = true;
            onFinish();
          },
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
