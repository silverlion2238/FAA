import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter_application_0_0_5/main.dart';



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

  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  //FlutterTtsSingleton.instance.setVoice(Map<String, String>.from(Provider.of<VoiceNotifier>(context, listen: false).selectedVoice));
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['NosebleedSolution$pageNum']!,);
  return Column(
    children: [
      Image(
        image: AssetImage('images/sja/child-nosebleed.png'),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.height / 2,
      ),
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
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionNBleed, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['back']!),
          ),
          //Next button
          if (translations[locale]!['NosebleedSolution${pageNum + 1}'] != null)
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
                openSolutionPage(context, functionNBleed, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['next']!),
            ),
        ],
      ),
    ],
  );

}

Widget functionBurns(context, {int pageNum = 1}) {

  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['BurnsSolution$pageNum']!);
  return Column(
    children: [
      if (pageNum == 1)
        Image(
          image: AssetImage('images/sja/calling-for-help---male.png'),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.height / 2,
        ),
      if (pageNum == 2)
        Image(
          image: AssetImage('images/sja/sja-burn-or-a-scald-poster.png'),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.height / 2,
        ),
      if (pageNum == 3)
        Image(
          image: AssetImage('images/sja/step2-minor-burns-scalds-adult-first-aid.png'),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.height / 2,
        ),
      if (pageNum == 4)
        Image(
          image: AssetImage('images/sja/step3-minor-burns-scalds-adult-first-aid.webp'),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.height / 2,
        ),
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
                openSolutionPage(context, functionBurns, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['back']!),
          ),
          if (translations[locale]!['BurnsSolution${pageNum + 1}'] != null)
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
                openSolutionPage(context, functionBurns, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['next']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionCBurn(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['ChemicalBurnsSolution$pageNum']!);
  return Column(
    children: [
    if (pageNum == 1)
      Image(
        image: AssetImage('images/sja/step1-chemical-burns-first-aid-advice.webp'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
      ),
    if (pageNum == 2)
      Image(
        image: AssetImage('images/sja/sja-burn-or-a-scald-poster.png'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
      ),
    if (pageNum == 3)
      Image(
        image: AssetImage('images/sja/step4-chemical-burns-first-aid-advice.webp'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
        ),
    if (pageNum == 4)
      Image(
        image: AssetImage('images/sja/step2-chemical-burns-first-aid-advice.png'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
      ),
    if (pageNum == 5)
      Image(
        image: AssetImage('images/sja/adult-shock.webp'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
      ),
    if (pageNum == 6)
      Image(
        image: AssetImage('images/sja/calling-for-help---male.png'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
      ),
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
              openSolutionPage(context, functionCBurn, pageNum: pageNum - 1);
            }
          },
          child: Text(translations[locale]!['back']!),
        ),
        if (translations[locale]!['ChemicalBurnsSolution${pageNum + 1}'] != null)
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
              openSolutionPage(context, functionCBurn, pageNum: pageNum + 1);
            },
            child: Text(translations[locale]!['next']!),
          ),
        ],
      ),
    ],
  );
}

Widget functionFracture(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['FractureSolution$pageNum']!);
  return Column(
    children: [
      Image(
        image: AssetImage('images/sja/step$pageNum-how-to-make-an-arm-sling.png'),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.height / 2,
      ),
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
                openSolutionPage(context, functionFracture, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['back']!),
          ),
          if (translations[locale]!['FractureSolution${pageNum + 1}'] != null)
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
                openSolutionPage(context, functionFracture, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['next']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionDislocation(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['DislocationSolution$pageNum']!);
  return Column(
    children: [
      Image(
        image: AssetImage('images/sja/elevation-sling-first-aid-advice-step2.png'),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.height / 2,
      ),
      SizedBox(height: 20,),
      
      Text(
        translations[locale]!['DislocationSolution$pageNum']!,
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
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionDislocation, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['back']!),
          ),
          if (translations[locale]!['DislocationSolution${pageNum + 1}'] != null)
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
                openSolutionPage(context, functionDislocation, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['next']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionHypervent(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['HyperventSolution$pageNum']!);
  return Column(
    children: [
      Image(
        image: AssetImage('images/sja/step1adult-choking-first-aid-advice.png'),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.height / 2,
      ),
      SizedBox(height: 20,),
      
      Text(
        translations[locale]!['HyperventSolution$pageNum']!,
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
              if (pageNum == 1) {
                Navigator.popUntil(context, (route) => route.isFirst);
              } else {
                openSolutionPage(context, functionHypervent, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['back']!),
          ),
          if (translations[locale]!['HyperventSolution${pageNum + 1}'] != null)
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
                openSolutionPage(context, functionHypervent, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['next']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionUnconsciousB(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['UnconsciousSolution$pageNum']!);
  return Column(
    children: [
      Image(
        image: AssetImage('images/stab.png'),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.height / 2,
      ),
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
                openSolutionPage(context, functionUnconsciousB, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['back']!),
          ),
          if (translations[locale]!['UnconsciousSolution${pageNum + 1}'] != null)
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
                openSolutionPage(context, functionUnconsciousB, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['next']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionEpilepsy(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['EpilepsySolution$pageNum']!);
  return Column(
    children: [
      Image(
        image: AssetImage('images/sja/step2-adult-seizures-first-aid.png'),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.height / 2,
      ),
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
                openSolutionPage(context, functionEpilepsy, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['back']!),
          ),
          if (translations[locale]!['EpilepsySolution${pageNum + 1}'] != null)
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
                openSolutionPage(context, functionEpilepsy, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['next']!),
            ),
        ],
      ),
    ],
  );
}

Widget functionAsthmaAtt(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['AsthmaAttackSolution$pageNum']!);
  return Column(
    children: [
      Image(
        image: AssetImage('images/sja/child-asthma.png'),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.height / 2,
      ),
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
                openSolutionPage(context, functionAsthmaAtt, pageNum: pageNum - 1);
              }
            },
            child: Text(translations[locale]!['back']!),
          ),
          if (translations[locale]!['AsthmaAttackSolution${pageNum + 1}'] != null)
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
                openSolutionPage(context, functionAsthmaAtt, pageNum: pageNum + 1);
              },
              child: Text(translations[locale]!['next']!),
            ),
        ],
      ),
    ],
  );
}


Widget functionRecPos(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['RecPos$pageNum']!);
  int imageNum = pageNum + 1;
  return Column(
    children: [
    Image(
        image: AssetImage('images/sja/step$imageNum-adult-recovery-position-first-aid.png'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
      ),
    SizedBox(height: 20,),
    Text(
      translations[locale]!['RecPos$pageNum']!,
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
            if (pageNum == 1) {
              Navigator.popUntil(context, (route) => route.isFirst);
            } else {
              openSolutionPage(context, functionRecPos, pageNum: pageNum - 1);
            }
          },
          child: Text(translations[locale]!['back']!),
        ),
        if (translations[locale]!['RecPos${pageNum + 1}'] != null)
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
              openSolutionPage(context, functionRecPos, pageNum: pageNum + 1);
            },
            child: Text(translations[locale]!['next']!),
          ),
        ],
      ),
    ],
  );
}

Widget functionCPR(context, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  FlutterTtsSingleton.instance.stop();
  FlutterTtsSingleton.instance.speak(translations[locale]!['cpr$pageNum']!);
  int imageNum = pageNum + 1;
  return Column(
    children: [
    
    if (pageNum == 1)
      Image(
      image: AssetImage('images/sja/calling-for-help---male.png'),
      width: MediaQuery.of(context).size.height / 2,
      height: MediaQuery.of(context).size.height / 2,
    ),
    
    if (pageNum == 2)
      Image(
        image: AssetImage('images/sja/cpr-step-2.png'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
      ),
    if (pageNum == 3)
      Image(
        image: AssetImage('images/sja/cpr-step-1.png'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
      ),
    if (pageNum == 4)
      Image(
        image: AssetImage('images/AED_Sign_700x.webp'),
        width: MediaQuery.of(context).size.height / 2,
        height: MediaQuery.of(context).size.height / 2,
      ),
    SizedBox(height: 20,),
    Text(
      translations[locale]!['cpr$pageNum']!,
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
            if (pageNum == 1) {
              Navigator.popUntil(context, (route) => route.isFirst);
            } else {
              openSolutionPage(context, functionCPR, pageNum: pageNum - 1);
            }
          },
          child: Text(translations[locale]!['back']!),
        ),
        if (translations[locale]!['cpr${pageNum + 1}'] != null)
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
              openSolutionPage(context, functionCPR, pageNum: pageNum + 1);
            },
            child: Text(translations[locale]!['next']!),
          ),
        ],
      ),
    ],
  );
}