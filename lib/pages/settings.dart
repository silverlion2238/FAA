import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage ({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:Column(
        children: <Widget>[

          ListTile(
            title: Text(translations[locale]!['App Theme: ']!),
          ),


          Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return RadioListTile<ThemeMode>(
                title: Text(translations[locale]?['System'] ?? 'System'),
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
                title: Text(translations[locale]?['Light'] ?? 'Light'),
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
                title: Text(translations[locale]?['Dark'] ?? 'Dark'),
                value: ThemeMode.dark,
                groupValue: themeModel.themeMode,  
                onChanged: (ThemeMode? value) {
                  themeModel.toggleTheme(value!);
                },
              );
            }
          ),

          ListTile(
            title: Text(translations[locale]?['Language: '] ?? 'Language: '),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 23.0),
              child: Consumer<LanguageModel>(
              builder: (context, languageModel, child) {
                return DropdownButton<Locale>(
                  value: languageModel.locale,
                  items: [
                    DropdownMenuItem(
                    value: Locale('en'),
                    child: Row(
                      children: [                        
                        Image.asset(
                          'images/uk.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        Text('English')
                        ],
                      )
                    ),
                    DropdownMenuItem(
                      value: Locale('sk'),
                      child: Row(
                        children: [
                        Image.asset(
                          'images/sk.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        Text('Slovak (Slovensky)')
                        ],
                      )
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
            ),
          ),
        ],
      )
    );
  }
}