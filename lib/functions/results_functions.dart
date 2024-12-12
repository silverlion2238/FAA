import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';



/*
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

Widget functionCCold(context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Text(
    translations[locale]!['placeholder3']!,
    textAlign: TextAlign.center,
  );
}
*/


Widget functionBurns(context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    children: [
      Text(
        translations[locale]!['BurnsDesc']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['BurnsSolution']!,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget functionCBurn (context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    children: [
      Text(
        translations[locale]!['ChemicalBurnsDesc']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['ChemicalBurnsSolution']!,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget functionFracture (context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    children: [
      Text(
        translations[locale]!['FractureDesc']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['FractureSolution']!,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget functionDislocation (context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    children: [
      Text(
        translations[locale]!['DislocationDesc']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['DislocationSolution']!,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget functionNBleed (context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    children: [
      Text(
        translations[locale]!['NosebleedDesc']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['NosebleedSolution']!,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget functionHypervent (context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    children: [
      Text(
        translations[locale]!['HyperventDesc']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['HyperventSolution']!,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget functionUnconscious (context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    children: [
      Text(
        translations[locale]!['UnconsciousDesc']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['UnconsciousSolution']!,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget functionEpilepsy (context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    children: [
      Text(
        translations[locale]!['EpilepsyDesc']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['EpilepsySolution']!,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget functionAsthmaAtt (context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    children: [
      Text(
        translations[locale]!['AsthmaAttackDesc']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['AsthmaAttackSolution']!,
        textAlign: TextAlign.center,
      ),
    ],
  );
}