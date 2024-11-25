import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';

Widget specialFunction1(context1) {
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
          openSolutionPage(context1, specialFunction1b);
        },
        child: Text(translations[locale]!['yes']!),
          ),
          ElevatedButton(
        onPressed: () {
          // Add your onPressed code here!

          openSolutionPage(context1, specialFunction1a);
        },
        child: Text(translations[locale]!['no']!),
          ),
        ],
      ),
    ],
  );
}

Widget specialFunction1a(context1) {
  final locale = Provider.of<LanguageModel>(context1, listen: false).locale.languageCode;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            translations[locale]!['Solution1']!,
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
          SizedBox(height: 20,),
        ],
      ),
    ],
  );
}

Widget specialFunction1b(context1) {
  final locale = Provider.of<LanguageModel>(context1, listen: false).locale.languageCode; 
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            translations[locale]!['Solution2']!,
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
          SizedBox(height: 20,),
        ],
      ),
    ],
  );
}