
import 'package:flutter_application_0_0_5/data/language_data.dart';

Map<String, Map<String, String>> translations1 = translations;
void main() {
  
  for (var j = 0; j < translations1['en']!.length; j++) {
    try {
      var tmp = translations1['sk']![translations1['en']!.keys.elementAt(j)];
      if (tmp == null) {
        print(translations1['en']!.keys.elementAt(j));
      }
    } catch (e) {
      print('en: ${translations1['en']!.keys.elementAt(j)}');
    }
  }

  for (var j = 0; j < translations1['en']!.length; j++) {
    try {
      var tmp = translations1['en']![translations1['sk']!.keys.elementAt(j)];
      if (tmp == null) {
        print('sk: ${translations1['sk']!.keys.elementAt(j)}');
      }
    } catch (e) {
      print(translations1['sk']!.keys.elementAt(j));
    }
  }
}