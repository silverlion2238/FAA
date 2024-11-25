import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/functions/language_functions.dart';

enum Symptom {
  coughing,
  sweating,
  bleeding,
  mildCut,
  severeCut,
  cantMove, 
  painInInjuredArea,
  swelling,
  bruise;






  String getName() {
      switch (this) {
        case Symptom.coughing:
          return LanguageData().translate('Cough');
        case Symptom.sweating:
          return LanguageData().translate('Sweating');
        case Symptom.bleeding:
          return LanguageData().translate('Bleeding');
        case Symptom.mildCut:
          return LanguageData().translate('MildCut');
        case Symptom.severeCut:
          return LanguageData().translate('SevereCut');
        case Symptom.cantMove:
          return LanguageData().translate('CantMove');
        case Symptom.painInInjuredArea:
          return LanguageData().translate('PainInArea');
        case Symptom.swelling:
          return LanguageData().translate('Swelling');
        case Symptom.bruise:
          return LanguageData().translate('Bruise');
      }
    }



@override
String toString() =>  name;
}



class Injury {
  String name = "";
  String description = "";
  String solution = "";
  List<Symptom> symptoms = [];
  Function result = nullFunction;

  Injury(this.name, this.description, this.solution, this.symptoms, this.result);

  String getName(){
    return name;
  }

  String getDescription() {
    return description;
  }

  String getSolution() {
    return solution;
  }

  void printData(){
    print(name);
    print(description);
    print(symptoms);
    print(solution);
  }

  Function getFunction () {
    return result;
  }
}




















//=============================================================================================//
//Injuries



















List<Injury> injuries = [
    Injury(
      LanguageData().translate('CommonCold'),
      LanguageData().translate('CommonColdDesc'),
      LanguageData().translate('CommonColdSolution'),
      [Symptom.coughing, Symptom.sweating],
      function2,
    ),
    Injury(
      LanguageData().translate('MildCut'),
      LanguageData().translate('MildCutDesc'),
      LanguageData().translate('MildCutSolution'),
      [Symptom.bleeding, Symptom.mildCut],
      function3,
    ),
    Injury(
      LanguageData().translate('SevereCut'),
      LanguageData().translate('SevereCutDesc'),
      LanguageData().translate('SevereCutSolution'),
      [Symptom.bleeding, Symptom.severeCut],
      function2,
    ),
    Injury(
      LanguageData().translate('Nosebleed'),
      LanguageData().translate('NosebleedDesc'),
      LanguageData().translate('NosebleedSolution'),
      [Symptom.bleeding],
      function3,
    ),
    Injury(
      LanguageData().translate('Sprain'),
      LanguageData().translate('SprainDesc'),
      LanguageData().translate('SprainSolution'),
      [Symptom.cantMove],
      function2,
    ),
    Injury(
      LanguageData().translate('Dislocation'),
      LanguageData().translate('DislocationDesc'),
      LanguageData().translate('DislocationSolution'),
      [Symptom.painInInjuredArea, Symptom.cantMove, Symptom.swelling],
      function3,
    ),
    Injury(
      LanguageData().translate('BoneFracture'),
      LanguageData().translate('BoneFractureDesc'),
      LanguageData().translate('BoneFractureSolution'),
      [Symptom.painInInjuredArea, Symptom.cantMove],
      function3,
    ),
  ];






//=============================================================================================//
//Theme Data



ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 255, 0, 0),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    selectedItemColor: Color.fromARGB(255, 255, 0, 0),
    unselectedItemColor: Color.fromARGB(255, 54, 54, 54),
    
  ),

  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 255, 255, 255),
    primary: Color.fromARGB(255, 255, 0, 0),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 0, 0, 0),
    onSecondary: Color.fromARGB(255, 255, 0, 0),
    surfaceTint: Colors.transparent,
  ),    
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,


  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 176, 0, 0),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    selectedItemColor: Color.fromARGB(255, 255, 0, 0),
    unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
  ),

  colorScheme: ColorScheme.dark(
    surface: Color.fromARGB(255, 54, 54, 54),
    primary: Color.fromARGB(255, 176, 0, 0),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 255, 255, 255),
    onSecondary: Color.fromARGB(255, 255, 0, 0),
    surfaceTint: Colors.transparent,
  ),
);