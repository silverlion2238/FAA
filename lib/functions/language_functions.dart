import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';

class LanguageData {
  String translate(String key) {
    final locale = LanguageModel().locale.languageCode;
    if (translations[locale] != null && translations[locale]![key] != null) {
      return translations[locale]![key]!;
    } else {
      if (translations[locale] == null) {
        print('translations[locale]! is null');
        print(locale);
        print(key);
        return 'Translation not found';
      } else {
        print('translations[locale]![key] is null');
        print(locale);
        print(key);
        return 'Translation not found';
      }
    }
  }

  String updateTranslation(String key,context) {
    final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    if (translations[locale] != null && translations[locale]![key] != null) {
      return translations[locale]![key]!;
    } else {
      if (translations[locale] == null) {
        print('translations[locale]! is null');
        print(locale);
        print(key);
        return 'Translation not found';
      } else {
        print('translations[locale]![key] is null');
        print(locale);
        print(key);
        return 'Translation not found';
      }
    }
  }
}

