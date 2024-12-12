import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/functions/language_functions.dart';

/* Old Data
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






  String getName(context) {
      switch (this) {
        case Symptom.coughing:
          return LanguageData().updateTranslation('Cough', context);
        case Symptom.sweating:
          return LanguageData().updateTranslation('Sweating', context);
        case Symptom.bleeding:
          return LanguageData().updateTranslation('Bleeding', context);
        case Symptom.mildCut:
          return LanguageData().updateTranslation('MildCut', context);
        case Symptom.severeCut:
          return LanguageData().updateTranslation('SevereCut', context);
        case Symptom.cantMove:
          return LanguageData().updateTranslation('CantMove', context);
        case Symptom.painInInjuredArea:
          return LanguageData().updateTranslation('PainInArea', context);
        case Symptom.swelling:
          return LanguageData().updateTranslation('Swelling', context);
        case Symptom.bruise:
          return LanguageData().updateTranslation('Bruise', context);
      }
    }



@override
String toString() =>  name; 
}
*/

// Correct Data
enum Symptom {
  bleeding,
  blister,
  crackingSound,
  foaming,
  immobility,
  laboredBreathing,
  nausea,
  nosebleed,
  numbness,
  pain,
  rBreathing,
  rHeartbeat,
  reddening,  
  slurredSpeech,
  swelling,
  twitching,
  unresponsive,
  wheezing; 

  String getName(context) {
    switch (this) {
      case Symptom.bleeding:
        return LanguageData().updateTranslation('Bleeding', context);
      case Symptom.blister:
        return LanguageData().updateTranslation('Blister', context);
      case Symptom.crackingSound:
        return LanguageData().updateTranslation('CrackingSound', context);
      case Symptom.foaming:
        return LanguageData().updateTranslation('Foaming', context);
      case Symptom.immobility:
        return LanguageData().updateTranslation('Immobility', context);
      case Symptom.laboredBreathing:
        return LanguageData().updateTranslation('LaboredBreath', context);
      case Symptom.nausea:
        return LanguageData().updateTranslation('Nausea', context);
      case Symptom.nosebleed:
        return LanguageData().updateTranslation('Nosebleed', context);
      case Symptom.numbness:
        return LanguageData().updateTranslation('Numbness', context);
      case Symptom.pain:
        return LanguageData().updateTranslation('Pain', context);
      case Symptom.rBreathing:
        return LanguageData().updateTranslation('RapidBreath', context);
      case Symptom.rHeartbeat:
        return LanguageData().updateTranslation('RapidPulse', context);
      case Symptom.reddening:
        return LanguageData().updateTranslation('Reddening', context);
      case Symptom.slurredSpeech:
        return LanguageData().updateTranslation('SlurredSpeech', context);
      case Symptom.swelling:
        return LanguageData().updateTranslation('Swelling', context);
      case Symptom.twitching:
        return LanguageData().updateTranslation('Twitching', context);
      case Symptom.unresponsive:
        return LanguageData().updateTranslation('Unresponsive', context);
      case Symptom.wheezing:
        return LanguageData().updateTranslation('Wheezing', context);
    }
  }

  @override
  String toString() => name;
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


















/* old Injuries
List<Injury> origInjuries = [
    Injury(
      LanguageData().translate('CommonCold'),
      LanguageData().translate('CommonColdDesc'),
      LanguageData().translate('CommonColdSolution'),
      [Symptom.coughing, Symptom.sweating],
      functionCCold,
    ),
    Injury(
      LanguageData().translate('MildCut'),
      LanguageData().translate('MildCutDesc'),
      LanguageData().translate('MildCutSolution'),
      [Symptom.bleeding, Symptom.mildCut],
      functionMCut,
    ),
    Injury(
      LanguageData().translate('SevereCut'),
      LanguageData().translate('SevereCutDesc'),
      LanguageData().translate('SevereCutSolution'),
      [Symptom.bleeding, Symptom.severeCut],
      functionSCut,
    ),
    Injury(
      LanguageData().translate('Nosebleed'),
      LanguageData().translate('NosebleedDesc'),
      LanguageData().translate('NosebleedSolution'),
      [Symptom.bleeding],
      functionNBleed,
    ),
    Injury(
      LanguageData().translate('Dislocation'),
      LanguageData().translate('DislocationDesc'),
      LanguageData().translate('DislocationSolution'),
      [Symptom.painInInjuredArea, Symptom.cantMove, Symptom.swelling],
      functionDislocation,
    ),
    Injury(
      LanguageData().translate('BoneFracture'),
      LanguageData().translate('BoneFractureDesc'),
      LanguageData().translate('BoneFractureSolution'),
      [Symptom.painInInjuredArea, Symptom.cantMove],
      functionFracture,
    ),
  ];
*/


// Correct Injuries
List<Injury> origInjuries = [
  Injury(
    LanguageData().translate('Burns'), // Popálenina
    LanguageData().translate('BurnsDesc'), 
    LanguageData().translate('BurnsSolution'), 
    [Symptom.pain, Symptom.reddening, Symptom.blister], 
    functionBurns,
  ),
  Injury(
    LanguageData().translate('ChemicalBurns'), // Poleptanie
    LanguageData().translate('ChemicalBurnsDesc'),
    LanguageData().translate('ChemicalBurnsSolution'),
    [Symptom.pain, Symptom.reddening],
    functionCBurn,
  ),
  Injury(
    LanguageData().translate('Fracture'), // Zlomenina
    LanguageData().translate('FractureDesc'),
    LanguageData().translate('FractureSolution'),
    [Symptom.pain, Symptom.immobility, Symptom.crackingSound, Symptom.swelling],
    functionFracture,
  ),
  Injury(
    LanguageData().translate('Dislocation'), // Vykĺbenina
    LanguageData().translate('DislocationDesc'),
    LanguageData().translate('DislocationSolution'),
    [Symptom.pain, Symptom.immobility, Symptom.swelling], 
    functionDislocation,
  ),
  Injury(
    LanguageData().translate('Nosebleed'), // Krvácanie z nosa
    LanguageData().translate('NosebleedDesc'),
    LanguageData().translate('NosebleedSolution'),
    [Symptom.nosebleed],
    functionNBleed,
  ),
  Injury(
    LanguageData().translate('Hypervent'), // Hyperventilácia
    LanguageData().translate('HyperventDesc'),
    LanguageData().translate('HyperventSolution'),
    [Symptom.rBreathing, Symptom.rHeartbeat, Symptom.nausea, Symptom.numbness],
    functionHypervent,
  ),
  Injury(
    LanguageData().translate('Unconscious'), // Bezvedomie
    LanguageData().translate('UnconsciousDesc'),
    LanguageData().translate('UnconsciousSolution'),
    [Symptom.unresponsive], 
    functionUnconscious,
  ),
  Injury(
    LanguageData().translate('Epilepsy'), 
    LanguageData().translate('EpilepsyDesc'),
    LanguageData().translate('EpilepsySolution'),
    [Symptom.foaming, Symptom.twitching],
    functionEpilepsy,
  ),
  Injury(
    LanguageData().translate('AsthmaAttack'), // Astmatický záchvat
    LanguageData().translate('AsthmaAttackDesc'), 
    LanguageData().translate('AsthmaAttackSolution'), 
    [Symptom.laboredBreathing, Symptom.wheezing, Symptom.slurredSpeech], 
    functionAsthmaAtt,
  ),
];

List<Injury> injuries = origInjuries;

void restoreInjuries(context) {
    injuries = origInjuries;
  }




//=============================================================================================//
//Theme Data



ThemeData redLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFC2000B),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    selectedItemColor: Color(0xFFC2000B),
    unselectedItemColor: Color.fromARGB(255, 80, 80, 80),
    
  ),

  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 255, 255, 255),
    primary: Color(0xFFC2000B),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 0, 0, 0),
    onSecondary: Color(0xFFC2000B),
    surfaceTint: Color.fromARGB(255, 200, 200, 200),
    onSurface: Color.fromARGB(255, 0, 0, 0),
  ),    
);

ThemeData redDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,


  appBarTheme: AppBarTheme(
    //backgroundColor: Color.fromARGB(255, 71, 4, 4),
    backgroundColor: Color(0xFFC2000B),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    selectedItemColor: Color(0xFFC2000B),
    unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
  ),

  colorScheme: ColorScheme.dark(
    surface: Color.fromARGB(255, 80, 80, 80),
    primary: Color(0xFFC2000B),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 255, 255, 255),
    onSecondary: Color(0xFFC2000B),
    surfaceTint: Color.fromARGB(255, 200, 200, 200),
    onSurface: Color.fromARGB(255, 255, 255, 255)
    
  ),
);

ThemeData greenLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF12491D),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF12491D),
    unselectedItemColor: Color.fromARGB(255, 80, 80, 80),
  ),
  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 255, 255, 255),
    primary: Color(0xFF12491D),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 0, 0, 0),
    onSecondary: Color(0xFF12491D),
    surfaceTint: Color.fromARGB(255, 200, 200, 200),
    onSurface: Color.fromARGB(255, 0, 0, 0),
  ),
);

ThemeData greenDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF12491D),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF12491D),
    unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
  ),
  colorScheme: ColorScheme.dark(
    surface: Color.fromARGB(255, 80, 80, 80),
    primary: Color(0xFF12491D),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 255, 255, 255),
    onSecondary: Color(0xFF12491D),
    surfaceTint: Color.fromARGB(255, 200, 200, 200),
    onSurface: Color.fromARGB(255, 255, 255, 255),
  ),
);

ThemeData blueLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue[900],
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue[900]!,
    unselectedItemColor: Color.fromARGB(255, 80, 80, 80),
  ),
  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 255, 255, 255),
    primary: Colors.blue[900]!,
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 0, 0, 0),
    onSecondary: Colors.blue[900]!,
    surfaceTint: Color.fromARGB(255, 200, 200, 200),
    onSurface: Color.fromARGB(255, 0, 0, 0),
  ),
);

ThemeData blueDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue[900]!,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue[900]!,
    unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
  ),
  colorScheme: ColorScheme.dark(
    surface: Color.fromARGB(255, 80, 80, 80),
    primary: Colors.blue[900]!,
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 255, 255, 255),
    onSecondary: Colors.blue[900]!,
    surfaceTint: Color.fromARGB(255, 200, 200, 200),
    onSurface: Color.fromARGB(255, 255, 255, 255),
  ),
);