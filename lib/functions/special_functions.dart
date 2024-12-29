import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';



// Function for identifying the bone injury

Widget specialBoneFunction(context1, {pageNum = 0}) {
  final locale = Provider.of<LanguageModel>(context1).locale.languageCode;
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
        onPressed: () {
          // Add your onPressed code here!
          openSolutionPage(context1, functionFracture);
        },
        child: Text(translations[locale]!['yes']!),
          ),
          ElevatedButton(
        onPressed: () {
          // Add your onPressed code here!

          openSolutionPage(context1, specialBonesFunction2);
        },
        child: Text(translations[locale]!['no']!),
          ),
        ],
      ),
    ],
  );
}











// Function for identifying the type of burns

Widget specialBurnsFunction(context1, {pageNum = 0}) {
  final locale = Provider.of<LanguageModel>(context1).locale.languageCode;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            translations[locale]!['primaryText']!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20,),
          Text(
            translations[locale]!['description']!,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 200,),
        ],
      ),


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
        onPressed: () {
          // Add your onPressed code here!
          openSolutionPage(context1, functionBurns);
        },
        child: Text(translations[locale]!['yes']!),
          ),
          ElevatedButton(
        onPressed: () {
          // Add your onPressed code here!

          openSolutionPage(context1, functionCBurn);
        },
        child: Text(translations[locale]!['no']!),
          ),
        ],
      ),
    ],
  );
}

Widget specialBonesFunction2(context1, {pageNum = 0}) {
  final locale = Provider.of<LanguageModel>(context1).locale.languageCode;
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
        onPressed: () {
          // Add your onPressed code here!
          openSolutionPage(context1, functionDislocation);
        },
        child: Text(translations[locale]!['yes']!),
          ),
          ElevatedButton(
        onPressed: () {
          // Add your onPressed code here!

          openSolutionPage(context1, functionFracture);
        },
        child: Text(translations[locale]!['no']!),
          ),
        ],
      ),
    ],
  );
}

