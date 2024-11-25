import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/pages/solution.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';



void openSolutionPage (context, resultFunction) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    showModalBottomSheet(
      barrierColor: Theme.of(context).colorScheme.surface,
      //isScrollControlled: true,
      context: context, 
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: SolutionPage(
          solutionFunction: resultFunction
        ),
      )
    );
  }





void nullFunction() {}

