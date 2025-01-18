import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter_application_0_0_5/main.dart';

//for appbar title
List<Function> specialFunctions = [
  specialBurnsFunction,
  specialBoneFunction,
  specialBonesFunction2,
  functionUnconsciousB,
  functionFractureArm,
  functionFractureLeg,
];
// Function for identifying the bone injury

Widget specialBoneFunction(context, {pageNum = 0}) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;


  //TTS
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['Cracks?']!);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [ 
          Text(
            translations[locale]!['Cracks?']!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 200,),
        ],
      ),

      /*
      FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(
          Icons.navigate_next,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),*/
      //Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
              backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                ),
              ),
            ),
            onPressed: () {
              // Add your onPressed code here!
              openSolutionPage(context, functionFracture);
            },
            child: Text(translations[locale]!['yes']!),
          ),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
              backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                ),
              ),
            ),
            onPressed: () {
              // Add your onPressed code here!

              openSolutionPage(context, specialBonesFunction2);
            },
            child: Text(translations[locale]!['no']!),
          ),
        ],
      ),
    ],
  );
}
// Function for identifying the type of burns

Widget specialBurnsFunction(context, {pageNum = 0}) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;

  //TTS
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['TypeOfPain']!);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            translations[locale]!['TypeOfPain']!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 200,),
        ],
      ),


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
              backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                ),
              ),
            ),
            
            onPressed: () {
              // Add your onPressed code here!
              openSolutionPage(context, functionBurns);
            },
            child: Text(translations[locale]!['yes']!),
          ),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
              backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                ),
              ),
            ),
            onPressed: () {
              // Add your onPressed code here!

              openSolutionPage(context, functionCBurn);
            },
            child: Text(translations[locale]!['no']!),
          ),
        ],
      ),
    ],
  );
}

Widget specialBonesFunction2(context, {pageNum = 0}) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;

  //TTS
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['Joints?']!);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            translations[locale]!['Joints?']!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 200,),
        ],
      ),


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
              backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                ),
              ),
            ),
            onPressed: () {
              // Add your onPressed code here!
              openSolutionPage(context, functionDislocation);
            },
            child: Text(translations[locale]!['yes']!),
          ),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
              backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                ),
              ),
            ),
            onPressed: () {
              // Add your onPressed code here!

              openSolutionPage(context, functionFracture);
            },
            child: Text(translations[locale]!['no']!), // No
          ),
        ],
      ),
    ],
  );
}

Widget functionUnconscious(context, {int pageNum = 1}) {



  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['isBreathingStep$pageNum']!);
  return Column(
    children: [
      if (pageNum == 1)
        Image(
          image: AssetImage('images/sja/step2_primary_survey_first_aid.png'),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.height / 2,
        ),
      if (pageNum == 2)
        Image(
          image: AssetImage('images/angle_head.png'),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.height / 2,
        ),
      if (pageNum == 3)
        Image(
          image: AssetImage('images/check_breath.png'),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.height / 2,
        ),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['isBreathingStep$pageNum']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),



      if (translations[locale]!['isBreathingStep${pageNum + 1}'] != null) 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
                backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                  ),
                ),
              ),
              onPressed: () {
                if (pageNum == 1) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                } else {
                  openSolutionPage(context, functionUnconscious, pageNum: pageNum - 1);
                }
              },
              child: Text(translations[locale]!['back']!),
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
                backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                  ),
                ),
              ),
              onPressed: () {
                openSolutionPage(context, functionUnconscious, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['next']!),
            ),
          ],
        ),



      if (translations[locale]!['isBreathingStep${pageNum + 1}'] == null)  



        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
                backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                  ),
                ),
              ),
              onPressed: () {
                openSolutionPage(context, functionRecPos);
              },
              child: Text(translations[locale]!['BreathAff']!),
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
                backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                  ),
                ),
              ),
              onPressed: () { 
                openSolutionPage(context, functionCPR);
              },
              child: Text(translations[locale]!['BreathNeg']!),
            ),
          ],
        ),
    ],
  );
}

Widget functionFracture(context, {pageNum = 0}) {

  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['FractureSolution0']!);
  return Column(
    children: [
      Image(
        image: AssetImage('images/sja/adult-shock.webp'),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.height / 2,
      ),
      
      SizedBox(height: 20,),    

      Text(
        translations[locale]!['FractureSolution0']!,
        textAlign: TextAlign.center,
      ),

      SizedBox(height: 20,),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
              backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                ),
              ),
            ),
            onPressed: () {
              openSolutionPage(context, functionFractureArm);
            },
            child: Text(translations[locale]!['Arm']!),
          ),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
              backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                ),
              ),
            ),
            onPressed: () { 
              openSolutionPage(context, functionFractureLeg);
            },
            child: Text(translations[locale]!['Leg']!),
          ),
        ],
      ),
    ],
  );
}