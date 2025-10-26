import 'package:garden_app/services/week_access_service.dart';
import 'package:garden_app/models/task.dart';

const Map<String, int> SECTION_TO_WEEK_MAP = {
    'Pasiruošimas': 1,
    'Minčių sėjimas': 2,
    'Sodinukai': 3,
    'Dėmesingas laistymas': 4,
    'Sodo draugai': 5,
    'Žydėjimas': 6,
    'Pirmieji vaisiai': 7,
    'Puoselėjimas': 8,
};

Future<Map<String, List<Task>>> getAvailableSections(
    Map<String, List<Task>> allSections, int accountId) async {
  
  final availableSections = <String, List<Task>>{};

  for (final entry in allSections.entries) {
    final sectionTitle = entry.key;
    // Gauname savaitės numerį, jei nerasime - nustatome 99 (neegzistuojanti savaitė)
    final weekNumber = SECTION_TO_WEEK_MAP[sectionTitle] ?? 99; 
    
    // Tikriname prieinamumą su servisu
    final isAvailable = await WeekAccessService.isWeekAvailable(accountId, weekNumber);
    
    if (isAvailable) {
      availableSections[sectionTitle] = entry.value;
    }
  }

  return availableSections;
}