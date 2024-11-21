import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/pages/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage ({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:Column(
        children: <Widget>[

          ListTile(
            title: Text('App Theme: '),
          ),


          Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return RadioListTile<ThemeMode>(
                title: const Text('System'),
                value: ThemeMode.system,
                groupValue: themeModel.themeMode,  
                onChanged: (ThemeMode? value) {
                  themeModel.toggleTheme(value!);
                },
              );
            }
          ),
          
            
          Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return RadioListTile<ThemeMode>(
                title: const Text('Light'),
                value: ThemeMode.light,
                groupValue: themeModel.themeMode,  
                onChanged: (ThemeMode? value) {
                  themeModel.toggleTheme(value!);
                },
              );
            },
          ),
          
          
          
          Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return RadioListTile<ThemeMode>(
                title: const Text('Dark'),
                value: ThemeMode.dark,
                groupValue: themeModel.themeMode,  
                onChanged: (ThemeMode? value) {
                  themeModel.toggleTheme(value!);
                },
              );
            }
          ),

          ListTile(
            title: Text('Language: '),
          ),
          Consumer<LanguageModel>(
            builder: (context, languageModel, child) {
              return DropdownButton<Locale>(
                value: languageModel.locale,
                items: [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: Locale('es'),
                    child: Text('Spanish'),
                  ),
                ],
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    languageModel.changeLanguage(newLocale);
                  }
                },
              );
            },
          ),
        ],
      )
    );
  }
}