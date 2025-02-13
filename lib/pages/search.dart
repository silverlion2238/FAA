import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/functions/special_functions.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:flutter_application_0_0_5/pages/solution.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';

//variables
List<Symptom> selectedSymptoms = [];
//List<Injury> injuries = []; // Define the injuries variable



//functions
List<Injury> whichInjury(BuildContext context, List<Symptom> appearedSymptoms) {  
  return injuries.where((injuryTemp) {
    return appearedSymptoms.every((symptomTemp) => injuryTemp.symptoms.contains(symptomTemp));
  }).toList();
}




//special cases of undecidable outcome check and execution
Function switchCase(List<Symptom> symptomList) {


  //special case 1
  switch (symptomList) {
    case List<Symptom> symptoms when symptoms.contains(Symptom.immobility) || symptoms.contains(Symptom.swelling):
      return specialBoneFunction;
    case List<Symptom> symptoms when symptoms.contains(Symptom.reddening):
      return specialBurnsFunction;
    default:
      return nullFunction;
  }
}       































//classes
class ChecklistScreen extends StatefulWidget {
  final Function(int) toResultTab;

  const ChecklistScreen({required this.toResultTab, super.key});

  @override
  ChecklistScreenState createState() => ChecklistScreenState();
}



class ChecklistScreenState extends State<ChecklistScreen> {
  

  //opening of result page
  
  List<Symptom> items = Symptom.values;

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,




      body: Column(
        children: [
          Expanded(
            child: Padding(padding: EdgeInsets.all(8.0),
            child: Provider.of<LayoutProvider>(context).isTwoColumnLayout ? 
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: selectedSymptoms.contains(items[index])
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
                      foregroundColor: Theme.of(context).colorScheme.onPrimary, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedSymptoms.contains(items[index])) {
                          selectedSymptoms.remove(items[index]);
                        } else {
                          selectedSymptoms.add(items[index]);
                        }
                      });
                    },
                    child: Text(
                      items[index].getName(context),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selectedSymptoms.contains(items[index])
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  );
                
              },
            )
            : ListView.builder(
              
              itemCount: items.length,
              itemBuilder: (context, index) {
                return 
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      
                      elevation: 0,
                      backgroundColor: selectedSymptoms.contains(items[index])
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                      if (selectedSymptoms.contains(items[index])) {
                        selectedSymptoms.remove(items[index]);
                      } else {
                        selectedSymptoms.add(items[index]);
                      }
                      });
                    },
                    child: Text(
                      items[index].getName(context),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: selectedSymptoms.contains(items[index])
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    );
                  
                
              },
            ),)
          ),
        ],
      ),
      
      




      floatingActionButton: FloatingActionButton(

        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        

        onPressed: () {    
          final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;

//============================================================================================//
// Decision tree for result search

          List<Injury>possibleInjuries = whichInjury(context, selectedSymptoms);
          List<Injury>otherPossibleIjuries = [];

          if (possibleInjuries.isEmpty) {
            for (Symptom symptom in selectedSymptoms) {
              otherPossibleIjuries += whichInjury(context, selectedSymptoms.where((symptomTemp) => symptomTemp != symptom).toList());
              //otherPossibleIjuries.addAll(injuries.where((injury) => injury.symptoms.contains(symptom)));
            }

            if (otherPossibleIjuries.isNotEmpty) {
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: Text(translations[locale]!['wrongInput']!),
                  content: Text(translations[locale]!['unclearResults']!),
                  actions: [
                    for (Injury injury in otherPossibleIjuries) 
                    TextButton(
                      onPressed: () => openSolutionPage(context, injury.getFunction()), 
                      child: Text(
                        injury.getName(context),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      )
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context), 
                      child: Text(
                        translations[locale]!['back']!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      )
                    ),
                  ],
                )
              );
            } else {

            //Wrong Input Error
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: Text(translations[locale]!['wrongInput']!),
                  content: Text(translations[locale]!['noResults']!),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: Text(translations[locale]!['ok']!)),
                  ],
                )
              );
            }
          // Only one option = skip
          } else if (possibleInjuries.length == 1) {
            Function resultFunction = possibleInjuries[0].getFunction();           
            openSolutionPage(context,resultFunction);
          } else {
            Function functionBuffer = switchCase(selectedSymptoms);
            //search for special cases
            if (functionBuffer != nullFunction) {              
              //Correct function execution
              openSolutionPage(context,functionBuffer);
            } else {
              //regular search
              widget.toResultTab(1);
              context.read<InjuryNotifier>().getResults(resultInjuries: possibleInjuries);
              //Pass data to result.dart
            }
          }
        },
      ),
    );
  }   
}
