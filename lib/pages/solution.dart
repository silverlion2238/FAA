import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';

class SolutionPage extends StatefulWidget {

  final Function solutionFunction;

  SolutionPage({required this.solutionFunction});


  @override
  SolutionPageState createState() => SolutionPageState();
  
}


class SolutionPageState extends State<SolutionPage> {

  late Function solutionFunction; // To store the passed data

  @override
  void initState() {
    super.initState();
    solutionFunction = widget.solutionFunction; // importing solutionFunction from widget to it's state
  }
  
  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LanguageModel>(context).locale.languageCode;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Center(
            child: Column(
              children: [
                Expanded(
                    child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                      // Actual function
                      solutionFunction(context),
                      ],
                    ),
                    ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.pop(context),
                    child: Icon(
                      Icons.exit_to_app,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}