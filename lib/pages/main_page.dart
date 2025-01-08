import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/functions/other_functions.dart';
import 'package:flutter_application_0_0_5/functions/results_functions.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';

class MainPage extends StatelessWidget{

  
  const MainPage({super.key});
  
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.125,),


            //First Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.4, 50)),
                    backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    openSolutionPage(context, functionNBleed);
                  },
                  child: Text(translations[locale]!['Nosebleed']!),
                ),


                SizedBox(width: 20),
                
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.4, 50)),
                    backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    openSolutionPage(context, functionFracture);
                  },
                    child: Text(translations[locale]!['Fracture']!),
                ),
              ],
            ),
            SizedBox(height: 20),   



            //Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.4, 50)),
                    backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                  openSolutionPage(context, functionDislocation);
                  },
                  child: Text(translations[locale]!['Dislocation']!),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.4, 50)),
                    backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    openSolutionPage(context, functionHypervent);
                  },
                  child: Text(translations[locale]!['Hypervent']!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
