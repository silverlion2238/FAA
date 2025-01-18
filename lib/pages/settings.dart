import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
      body:ListView(
        children: <Widget>[
          
          // Theme selection title
          ListTile(
            title: Text(translations[locale]!['App Theme']!),
          ),

          // Theme selection
          Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return Column(
                children: [
                  RadioListTile<String>(
                    title: Text(translations[locale]?['System'] ?? 'System'),
                    value: 'system',
                    groupValue: themeModel.themeMode.toString(),
                    onChanged: (String? value) {
                      themeModel.toggleTheme(ThemeMode.system);
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(translations[locale]?['RedLight'] ?? 'Red Light'),
                    value: 'red_light',
                    groupValue: themeModel.themeMode.toString(),
                    onChanged: (String? value) {
                      themeModel.toggleTheme(ThemeMode.light);
                      Provider.of<ThemeNotifier>(context, listen: false).setTheme(redLightTheme, redDarkTheme);
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(translations[locale]?['RedDark'] ?? 'Red Dark'),
                    value: 'red_dark',
                    groupValue: themeModel.themeMode.toString(),
                    onChanged: (String? value) {
                      themeModel.toggleTheme(ThemeMode.dark);
                      Provider.of<ThemeNotifier>(context, listen: false).setTheme(redLightTheme, redDarkTheme);
                    },
                  ),
                ],
              );
            }
          ),

          
          // Language selection title
          SizedBox(
            width: double.infinity,
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translations[locale]?['Language'] ?? 'Language: '),

                  Padding(
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
                              restoreInjuries(context);
                              context.read<InjuryNotifier>().getResults(resultInjuries: injuries);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ]
              ),
            ),
          ),

            // Divider
          Divider(
            indent: 32.0,
            endIndent: 32.0,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
            thickness: 1,
          ),
          

          // Mute switch
          Consumer<VoiceNotifier>(
            builder: (context, voiceNotifier, child) {
              return SwitchListTile(
                title: Text(translations[locale]?['Mute'] ?? 'Mute'),
                value: voiceNotifier.isMuted(), 
                onChanged: (bool value) {
                  voiceNotifier.setMute(value); 
                },
              );
            },
          ),
            
          

          
          SizedBox(
            width: double.infinity,
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translations[locale]?['audio'] ?? 'audio'),

                  Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Consumer<LanguageModel>(
                      builder: (context, languageModel, child) {
                        return Consumer<VoiceNotifier>(
                          builder: (context, voiceNotifier, child) {
                            return DropdownButton<Map>(
                              value: voiceNotifier.selectedVoice.isNotEmpty ? voiceNotifier.selectedVoice : null,
                              items: voiceNotifier.voices.map((voice) {
                                return DropdownMenuItem<Map>(
                                  value: voice,
                                  child: Row(
                                    children: [
                                      if (voice['locale'].contains('en')) Image.asset('images/uk.png', width: 24, height: 24) else Image.asset('images/sk.png', width: 24, height: 24),
                                      const SizedBox(width: 8),
                                      Text(voice['name']),
                                    ]
                                  ),
                                );
                              }).toList(),
                              onChanged: (Map? newVoice) {
                                
                                if (newVoice != null) {
                                  voiceNotifier.setSelectedVoice(newVoice);
                                }
                                FlutterTtsSingleton.instance.speak(newVoice?['name']);
                                //print(Provider.of<VoiceNotifier>(context, listen: false).selectedVoice);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ]
              ),
            ),
          ),
        ],
      )
    );
  }
}