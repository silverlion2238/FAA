import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/pages/solution.dart';



void openSolutionPage (context, resultFunction) {
    showModalBottomSheet(
      barrierColor: Theme.of(context).colorScheme.surface,
      isScrollControlled: true,
      context: context, 
      builder: (context) => SolutionPage(
        solutionFunction: resultFunction
      )
    );
  }





void nullFunction() {}

