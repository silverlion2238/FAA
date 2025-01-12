import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:flutter_application_0_0_5/functions/special_functions.dart';

class SolutionPage extends StatefulWidget {

  final Function solutionFunction;
  final int pageNum;

  SolutionPage({required this.solutionFunction, this.pageNum = 1});
  


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
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              FlutterTtsSingleton.instance.stop();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
          title: Text(
            //App bar title
            // If the function is in specialFunctions, don't show the name of the injury(beacuse there's none)
            specialFunctions.contains(solutionFunction) ? '' : injuries.where((inj) => inj.getFunction() == solutionFunction).first.getName(context),
          )
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                        // Add Hero widget with a unique tag
                        Hero(
                          tag: 'solutionHero_${UniqueKey().toString()}',
                          child: Material(
                          type: MaterialType.transparency,
                          child: solutionFunction(context, pageNum: widget.pageNum),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}