
import 'package:flutter/material.dart';

class LanguageModel extends ChangeNotifier {
  Locale _locale = Locale('sk');
  bool _hasShownWarning = false;

  Locale get locale => _locale;
  bool get hasShownWarning => _hasShownWarning;

  void changeLanguage(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }

  void setHasShownWarning(bool value) {
    _hasShownWarning = value;
    notifyListeners();
  }
} 