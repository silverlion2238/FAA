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

          // Title Personalization
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12.0),
              child: Text(
              translations[locale]?['Personalization'] ?? 'Personalization',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              )
            )
          ),


          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(translations[locale]?['App Theme'] ?? 'App Theme: '),
                    subtitle: Text(
                      translations[locale]?['ThemeSetDesc'] ?? 'Set the theme of the application',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Consumer<ThemeModel>(
                    builder: (context, themeModel, child) {
                      return DropdownButton<ThemeMode>(
                        alignment: Alignment.centerRight,
                        underline: Container(),
                        value: themeModel.themeMode,
                        items: [
                          DropdownMenuItem(
                            value: ThemeMode.system,
                            child: Text(translations[locale]?['System'] ?? 'System'),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text(translations[locale]?['RedLight'] ?? 'Red Light'),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text(translations[locale]?['RedDark'] ?? 'Red Dark'),
                          ),
                        ],
                        onChanged: (ThemeMode? newValue) {
                          if (newValue != null) {
                            themeModel.toggleTheme(newValue);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Theme selection title
          
          // Title Language
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12.0),
              child: Text(
              translations[locale]?['Language'] ?? 'Language',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              )
            )
          ),
          
          

          
          // Language selection

          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(translations[locale]?['Text'] ?? 'Text'),
                      subtitle: Text(
                        translations[locale]?['LangSetDesc'] ?? 'Set the language of the application',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
                          fontSize: 13.0,
                        ),
                      ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Consumer<LanguageModel>(
                      builder: (context, languageModel, child) {
                        return DropdownButton<Locale>(
                          alignment: Alignment.centerRight,                        
                          underline: Container(),
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
                                  Text('Slovenský')
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
              ],
            ),
          ),
          // Theme selection title

          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12.0),
              child: Text(
              translations[locale]?['audio'] ?? 'Audio',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              )
            )
          ),

          // Mute switch
          Consumer<VoiceNotifier>(
            builder: (context, voiceNotifier, child) {
              return SwitchListTile(
                title: Text(translations[locale]?['Mute'] ?? 'Narrator'),
                subtitle: Text(
                  translations[locale]?['MuteDesc'] ?? 'Turn off the narrator',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
                    fontSize: 13.0,
                  ),
                ),
                value: voiceNotifier.isMuted(), 
                onChanged: (bool value) {
                  voiceNotifier.setMute(value); 
                },
              );
            },
          ),
            



          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: ListTile(
                    title: Text(
                      translations[locale]?['Voice'] ?? 'Voice',
                        style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withAlpha(
                          Provider.of<VoiceNotifier>(context).isMuted() ? 255 : 123,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      translations[locale]?['LangSetDesc'] ?? 'Set the theme of the application',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withAlpha(
                          Provider.of<VoiceNotifier>(context).isMuted() ? 200 : 100,
                        ),
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width > 530 ? 265 : MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Consumer<LanguageModel>(
                      builder: (context, languageModel, child) {
                        return Consumer<VoiceNotifier>(
                          builder: (context, voiceNotifier, child) {
                            return DropdownButton<Map>(
                              alignment: Alignment.centerRight,
                              isExpanded: true,
                              underline: Container(),
                              value: voiceNotifier.selectedVoice.isNotEmpty ? voiceNotifier.selectedVoice : null,
                              items: voiceNotifier.voices.map((voice) {
                              return DropdownMenuItem<Map>(
                                value: voice,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                      if (voice['locale'].contains('en')) 
                                      Image.asset(
                                        'images/uk.png', 
                                        width: 24,
                                        height: 24,
                                        color: Provider.of<VoiceNotifier>(context).isMuted() ? null : Theme.of(context).colorScheme.surface,
                                        colorBlendMode: Provider.of<VoiceNotifier>(context).isMuted() ? null : BlendMode.saturation,
                                      )
                                      else 
                                      Image.asset(
                                        'images/sk.png', 
                                        width: 24, 
                                        height: 24,
                                        color: Provider.of<VoiceNotifier>(context).isMuted() ? null : Theme.of(context).colorScheme.surface,
                                        colorBlendMode: Provider.of<VoiceNotifier>(context).isMuted() ? null : BlendMode.saturation,
                                      ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(voice['name']),
                                    ),
                                  ]
                                  ),
                                );
                              }).toList(),
                              onChanged: !Provider.of<VoiceNotifier>(context).isMuted() ? null : (Map? newVoice) {
                              if (newVoice != null) {
                                voiceNotifier.setSelectedVoice(newVoice);
                              }
                              FlutterTtsSingleton.instance.speak(newVoice?['name']);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                )


              ],
            ),
          ),


          // Title AI

          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 12.0),
              child: Text(
              translations[locale]?['AI'] ?? 'AI',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              )
            )
          ),

          // AI model selection

          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(translations[locale]?['Model'] ?? 'Model '),
                    subtitle: Text(
                      translations[locale]?['ModelDesc'] ?? 'Set the LLM model of the AI',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Consumer<AIModel>(
                    builder: (context, aiModel, child) {
                      return DropdownButton<String>(
                        alignment: Alignment.centerRight,
                        underline: Container(),
                        value: aiModel.model,
                        items: aiModels.map((model) {
                          return DropdownMenuItem<String>(
                            value: model,
                            child: Text(model),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            aiModel.setModel(newValue);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}