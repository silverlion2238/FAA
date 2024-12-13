import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';



/*
Widget function1(context) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
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



Widget functionNBleed (context, {int pageNum = 1}) {
  print(pageNum);
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  
  return Column(
    children: [
      Image(image: AssetImage('images/sja/child-nosebleed.png')),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['NosebleedSolution$pageNum']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Previous button
          ElevatedButton(
            onPressed: () {
              // Add your onPressed code here!
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionNBleed, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['no']!),
          ),
          //Next button
          if (translations[locale]!['NosebleedSolution${pageNum + 1}'] != null)
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
                openSolutionPage(context, functionNBleed, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['yes']!),
            ),
        ],
      ),
    ],
  );

}

Widget functionBurns(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  return Column(
    children: [
      Image(image: AssetImage('images/sja/sja-burn-or-a-scald-poster.png')),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['BurnsSolution$pageNum']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionBurns, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['no']!),
          ),
          if (translations[locale]!['BurnsSolution${pageNum + 1}'] != null)
            ElevatedButton(
              onPressed: () {
                openSolutionPage(context, functionBurns, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['yes']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionCBurn(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  return Column(
    children: [
    if (pageNum != 4)
      Image(image: AssetImage('images/cool.png')),
    if (pageNum == 4)
      Image(image: AssetImage('images/sja/step2-chemical-burns-first-aid-advice.png')),
    SizedBox(height: 20,),
    Text(
      translations[locale]!['ChemicalBurnsSolution$pageNum']!,
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 20,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            if (pageNum == 1) {
              Navigator.popUntil(context, (route) => route.isFirst);
            } else {
              openSolutionPage(context, functionCBurn, pageNum: pageNum - 1);
            }
          },
          child: Text(translations[locale]!['no']!),
        ),
        if (translations[locale]!['ChemicalBurnsSolution${pageNum + 1}'] != null)
          ElevatedButton(
            onPressed: () {
              openSolutionPage(context, functionCBurn, pageNum: pageNum + 1);
            },
            child: Text(translations[locale]!['yes']!),
          ),
        ],
      ),
    ],
  );
}

Widget functionFracture(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  return Column(
    children: [
      Image(image: AssetImage('images/f_arm.jpg')),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['FractureSolution$pageNum']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionFracture, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['no']!),
          ),
          if (translations[locale]!['FractureSolution${pageNum + 1}'] != null)
            ElevatedButton(
              onPressed: () {
                openSolutionPage(context, functionFracture, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['yes']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionDislocation(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  return Column(
    children: [
      /*
      Image(image: AssetImage('images/dislocation.jpg')),
      SizedBox(height: 20,),
      */
      Text(
        translations[locale]!['DislocationSolution$pageNum']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionDislocation, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['no']!),
          ),
          if (translations[locale]!['DislocationSolution${pageNum + 1}'] != null)
            ElevatedButton(
              onPressed: () {
                openSolutionPage(context, functionDislocation, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['yes']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionHypervent(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  return Column(
    children: [
      /*
      Image(image: AssetImage('images/hypervent.jpg')),
      SizedBox(height: 20,),
      */
      Text(
        translations[locale]!['HyperventSolution$pageNum']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionHypervent, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['no']!),
          ),
          if (translations[locale]!['HyperventSolution${pageNum + 1}'] != null)
            ElevatedButton(
              onPressed: () {
                openSolutionPage(context, functionHypervent, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['yes']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionUnconsciousB(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  return Column(
    children: [
      Image(image: AssetImage('images/stab.png')),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['UnconsciousSolution$pageNum']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionUnconsciousB, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['no']!),
          ),
          if (translations[locale]!['UnconsciousSolution${pageNum + 1}'] != null)
            ElevatedButton(
              onPressed: () {
                openSolutionPage(context, functionUnconsciousB, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['yes']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionEpilepsy(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  return Column(
    children: [
      Image(image: AssetImage('images/epil.jpg')),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['EpilepsySolution$pageNum']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionEpilepsy, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['no']!),
          ),
          if (translations[locale]!['EpilepsySolution${pageNum + 1}'] != null)
            ElevatedButton(
              onPressed: () {
                openSolutionPage(context, functionEpilepsy, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['yes']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionAsthmaAtt(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  return Column(
    children: [
      Image(image: AssetImage('images/asthma.jpg')),
      SizedBox(height: 20,),
      Text(
        translations[locale]!['AsthmaAttackSolution$pageNum']!,
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionAsthmaAtt, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['no']!),
          ),
          if (translations[locale]!['AsthmaAttackSolution${pageNum + 1}'] != null)
            ElevatedButton(
              onPressed: () {
                openSolutionPage(context, functionAsthmaAtt, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['yes']!),
            ),
        ],
      ),
    ],
  );
}
