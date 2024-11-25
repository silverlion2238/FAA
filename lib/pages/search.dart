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
  if (symptomList.contains(Symptom.painInInjuredArea) | symptomList.contains(Symptom.cantMove)) {
    return specialFunction1;
  } else {
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
    final locale = Provider.of<LanguageModel>(context).locale.languageCode;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(items[index].getName()),
            value: selectedSymptoms.contains(items[index]),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  if (value) {
                    selectedSymptoms.add(items[index]);
                  } else {
                    selectedSymptoms.remove(items[index]);
                  }
                });
              }
            },
          );
        },
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

          if (possibleInjuries.isEmpty) {

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
