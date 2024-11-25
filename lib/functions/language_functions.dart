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
      return 'Translation not found';
    }
  }
}
