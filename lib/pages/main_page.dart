import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';

class MainPage extends StatelessWidget{
  final Function(int) toResultTab;
  const MainPage({required this.toResultTab, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/Flag_of_the_Red_Cross.svg.png',
              width: 200,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.125,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
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
                  child: Text(
                    'Chatbot',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
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
                    child: Text('Search'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
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
                  child: Text('Result'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all<Size>(Size(120, 50)),
                    backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.surfaceTint),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    toResultTab(4);
                  },
                  child: Text('Settings'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
