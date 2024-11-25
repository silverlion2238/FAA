
import 'package:flutter/material.dart';

class LanguageModel extends ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void changeLanguage(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
} 