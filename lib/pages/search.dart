import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/functions/special_functions.dart';
import 'package:flutter_application_0_0_5/pages/data.dart';
import 'package:flutter_application_0_0_5/pages/solution.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';

//variables
List<Symptom> selectedSymptoms = [];



//functions
List<Injury> whichInjury(List<Symptom> appearedSymptoms) {  
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

  ChecklistScreen({required this.toResultTab});

  @override
  ChecklistScreenState createState() => ChecklistScreenState();
}



class ChecklistScreenState extends State<ChecklistScreen> {

  //opening of result page
  

  List<Symptom> items = Symptom.values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(items[index].getName),
            value: selectedSymptoms.contains(items[index]),
            onChanged: (value) {
              setState(() {
                if (value!) {
                  selectedSymptoms.add(items[index]);
                } else {
                  selectedSymptoms.remove(items[index]);
                }
              });
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


//============================================================================================//
// Decision tree for result search

          List<Injury>possibleInjuries = whichInjury(selectedSymptoms);

          if (possibleInjuries.isEmpty) {

            //Wrong Input Error
            showDialog(
              context: context, 
              builder: (context) => AlertDialog(
                title: Text('Wrong Input'),
                content: Text('No results with these options'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
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
