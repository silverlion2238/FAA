import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/functions/language_functions.dart';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:flutter_application_0_0_5/pages/search.dart';
import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter_application_0_0_5/pages/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';


List<Injury> displayInjuries = injuries;


void executeFunction(context, index) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  Function functionBuffer = displayInjuries[index].getFunction();
  openSolutionPage(context, functionBuffer);
}


class ResultScreen extends StatefulWidget {
  @override
  ResultScreenState createState() => ResultScreenState();
}



class ResultScreenState extends State<ResultScreen> {
  List<Injury> displayInjuries = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    displayInjuries = context.watch<InjuryNotifier>().displayInjuries;
  }

  @override
  Widget build(BuildContext context) {
    String locale = Provider.of<LanguageModel>(context).locale.languageCode;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
        hintText: 'Search...',
        //border: InputBorder.none,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          onChanged: (query) {
        context.read<InjuryNotifier>().whichInjury(context,query);
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: ListView.builder(
        itemCount: displayInjuries.length,
        itemBuilder: (context,index) {
          return InkWell(

            

            onTap: () => executeFunction(context,index),

            child:ListTile(
                title: Text(displayInjuries[index].getName(context)),
              //subtitle: Text(displayInjuries[index].getDescription()),
            ),

          );
        }
      ),

      
    floatingActionButton: FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.refresh ,
          color: Theme.of(context).colorScheme.onPrimary
        ),
        

        onPressed: () {
          context.read<InjuryNotifier>().getResults(resultInjuries: injuries);
          /*print('injuries: ${injuries.print(name)}');
          for (var injury in injuries) {
            print(injury.getName());
          }*/
        }
    )
    );
  }
}

