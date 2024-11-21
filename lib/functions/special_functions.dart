import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';

Widget specialFunction1(context) {
  final locale = Provider.of<LanguageModel>(context).locale.languageCode;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            translations[locale]!['primaryText']!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20,),
          Text(
            translations[locale]!['description']!,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
        ],
      ),
      FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(
          Icons.navigate_next,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ],
  );
}