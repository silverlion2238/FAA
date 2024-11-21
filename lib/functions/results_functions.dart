import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';




Widget function1(context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Text(
    translations[locale]!['placeholder1']!,
    textAlign: TextAlign.center,);
}

Widget function2(context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Text(
    translations[locale]!['placeholder2']!,
    textAlign: TextAlign.center,);
}


Widget function3(context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Text(
    translations[locale]!['placeholder3']!,
    textAlign: TextAlign.center,
  );
}


