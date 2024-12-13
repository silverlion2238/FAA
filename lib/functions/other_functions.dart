import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/pages/solution.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';

void openSolutionPage(context, resultFunction, {int pageNum = 1}) {
  final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  if (pageNum == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SolutionPage(
          solutionFunction: resultFunction,
        ),
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SolutionPage(
          solutionFunction: resultFunction,
          pageNum: pageNum,
        ),
      ),
    );
  }
}


void nullFunction() {}