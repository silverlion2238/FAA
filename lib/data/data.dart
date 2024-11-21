import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter/material.dart';

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






  String get getName {
      switch (this) {
        case Symptom.coughing:
          return 'Coughing';
        case Symptom.sweating:
          return 'Sweating';
        case Symptom.bleeding:
          return 'Bleeding';
        case Symptom.mildCut:
          return 'Mild cut';
        case Symptom.severeCut:
          return 'Severe cut';
        case Symptom.cantMove:
          return "Can't move";
        case Symptom.painInInjuredArea:
          return 'Pain in injured area';
        case Symptom.swelling:
          return 'Swelling';
        case Symptom.bruise:
          return 'Bruise';
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
    "Common Cold",
    "Description1",
    "Result1!",
    [Symptom.coughing, Symptom.sweating],
    function2,
    ),

  Injury(
    "Mild Cut",
    "Small bruise or cut with small blood loss",
    "Disinfect and let it heal, if you have band aid you can use it",
    [Symptom.bleeding, Symptom.mildCut],
    function3,
    ),

  Injury(
    "Severe Cut",
    "Deep cut with intense bleeding",
    "Apply pressure on the wound and try to bandage it to prevent blood loss",
    [Symptom.bleeding, Symptom.severeCut,],
    function2,
    ),

  Injury(
    "Nouse Bleeding",
    "Bleeding from nouse",
    "Angle the head forward, if you can cool forehead and wait until it stops",
    [Symptom.bleeding,],
    function3,
    ),
    
  Injury(
    "Sprained leg",
    "It is the most commonly occurring injury in sports, mainly in ball sports",
    "Bandage the foot so it can't move freely, if the injured person has high boots, don't remove them, just tie the laces as thight as possible",
    [Symptom.cantMove],
    function2,
    ),
  Injury(
    'Dislocation', 
    'Bone is dislocated from the joint', 
    'Try to put the bone to the right place', 
    [Symptom.painInInjuredArea, Symptom.cantMove, Symptom.swelling],
    function3,
  ),
  Injury(
    'Bone fracture', 
    'Broken bone', 
    'Try to fix it in place', 
    [Symptom.painInInjuredArea, Symptom.cantMove,], 
    function3
  )
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