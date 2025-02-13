import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:flutter_application_0_0_5/functions/special_functions.dart';

class MainPage extends StatelessWidget{
  final Function toResultTab;

  const MainPage({super.key, required this.toResultTab,});
  

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LanguageModel>(context).locale.languageCode;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/single_icon_page-0001.jpg',
              width: 200,
            ),
            
            
            Flexible(
              child: SizedBox(height: MediaQuery.of(context).size.height * 0.125,),
            ),


            //First Row
            
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.9, 50)),
                backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                  ),
                ),
              ),
              onPressed: () {
                toResultTab(0);
              },
              child: Text(translations[locale]!['search']!),
            ),


            Flexible(child: SizedBox(height: 10),),  
            
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.9, 50)),
                backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                  ),
                ),
              ),
              onPressed: () {
                toResultTab(1);
              },
                child: Text(translations[locale]!['results']!),
            ),
          
        
            Flexible(child: SizedBox(height: 10),),  



            //Second Row
        
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.9, 50)),
                backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                  ),
                ),
              ),
              onPressed: () {
              toResultTab(3);
              },
              child: Text(translations[locale]!['chatbot']!),
            ),
          ],
        ),
      ),
    );
  }
}
