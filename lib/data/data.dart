import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/functions/special_functions.dart';
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

  String getName(BuildContext context) {
    final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    // Return the translated name based on the locale
    return LanguageData().updateTranslation(name, context);
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
      'CommonCold'),
      'CommonColdDesc'),
      'CommonColdSolution'),
      [Symptom.coughing, Symptom.sweating],
      functionCCold,
    ),
    Injury(
      'MildCut'),
      'MildCutDesc'),
      'MildCutSolution'),
      [Symptom.bleeding, Symptom.mildCut],
      functionMCut,
    ),
    Injury(
      'SevereCut'),
      'SevereCutDesc'),
      'SevereCutSolution'),
      [Symptom.bleeding, Symptom.severeCut],
      functionSCut,
    ),
    Injury(
      'Nosebleed'),
      'NosebleedDesc'),
      'NosebleedSolution'),
      [Symptom.bleeding],
      functionNBleed,
    ),
    Injury(
      'Dislocation'),
      'DislocationDesc'),
      'DislocationSolution'),
      [Symptom.painInInjuredArea, Symptom.cantMove, Symptom.swelling],
      functionDislocation,
    ),
    Injury(
      'BoneFracture'),
      'BoneFractureDesc'),
      'BoneFractureSolution'),
      [Symptom.painInInjuredArea, Symptom.cantMove],
      functionFracture,
    ),
  ];
*/


// Correct Injuries
List<Injury> origInjuries = [
  Injury(
    'Burns', // Popálenina
    'BurnsDesc', 
    'BurnsSolution1', 
    [Symptom.pain, Symptom.reddening, Symptom.blister], 
    functionBurns,
  ),
  Injury(
    'ChemicalBurns', // Poleptanie
    'ChemicalBurnsDesc',
    'ChemicalBurnsSolution1',
    [Symptom.pain, Symptom.reddening],
    functionCBurn,
  ),
  Injury(
    'Fracture', // Zlomenina
    'FractureDesc',
    'FractureSolution1',
    [Symptom.pain, Symptom.immobility, Symptom.crackingSound, Symptom.swelling],
    functionFracture,
  ),
  Injury(
    'Dislocation', // Vykĺbenina
    'DislocationDesc',
    'DislocationSolution1',
    [Symptom.pain, Symptom.immobility, Symptom.swelling], 
    functionDislocation,
  ),
  Injury(
    'Nosebleed', // Krvácanie z nosa
    'NosebleedDesc',
    'NosebleedSolution1',
    [Symptom.nosebleed],
    functionNBleed,
  ),
  Injury(
    'Hypervent', // Hyperventilácia
    'HyperventDesc',
    'HyperventSolution1',
    [Symptom.rBreathing, Symptom.rHeartbeat, Symptom.nausea, Symptom.numbness],
    functionHypervent,
  ),
  Injury(
    'Unconscious', // Bezvedomie
    'UnconsciousDesc',
    'UnconsciousSolution1',
    [Symptom.unresponsive], 
    functionUnconscious,          //<===========================    REPLACE WITH UNCONSCIOUS FUNCTION
  ),
  Injury(
    'RecPos',
    'RecPosDesc',
    'RecPosSolution1',
    [],
    functionRecPos,
  ),
  Injury(
    'cpr',
    'cprDesc',
    'cprSolution1',
    [],
    functionCPR,
  ),
  Injury(
    'Epilepsy', 
    'EpilepsyDesc',
    'EpilepsySolution1',
    [Symptom.foaming, Symptom.twitching],
    functionEpilepsy,
  ),
  Injury(
    'AsthmaAttack', // Astmatický záchvat
    'AsthmaAttackDesc', 
    'AsthmaAttackSolution1', 
    [Symptom.laboredBreathing, Symptom.wheezing, Symptom.slurredSpeech], 
    functionAsthmaAtt,
  ),
];

List<Injury> injuries = origInjuries;

void restoreInjuries(context) {
    injuries = origInjuries;
  }

//injuries functions lengths

Map<String, int> injuriesFunctionsLength = {
  'functionBurns': 4,
  'functionCBurn': 6,
  'functionFracture': 1,
  'functionDislocation': 5,
  'functionNBleed': 6,
  'functionHypervent': 3,
  'functionUnconscious': 3,
  'functionRecPos': 6,
  'functionCPR': 7,
  'functionEpilepsy': 4,
  'functionAsthmaAtt': 5,
  'specialBoneFunction': 1,
  'specialBoneFunction2': 1,
  'specialBurnsFunction': 1,
  'functionUnconsciousB': 3,
  'functionFractureArm': 8,
  'functionFractureLeg': 3,
  };




//=============================================================================================//
//Theme Data



ThemeData redLightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFC2000B),
  ),

  dropdownMenuTheme: DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(Color(0xFFC2000B)),
    ),
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
    surfaceTint: Color.fromARGB(255, 255, 255, 255),
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

  dropdownMenuTheme: DropdownMenuThemeData(
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(Color(0xFFC2000B)),
    ),
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
    surfaceTint: Color.fromARGB(255, 255, 255, 255),
    onSurface: Color.fromARGB(255, 255, 255, 255)
    
  ),
);
