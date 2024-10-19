import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/pages/data.dart';
import 'package:provider/provider.dart';



ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 255, 0, 0),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color.fromARGB(255, 255, 0, 0)
  ),

  colorScheme: ColorScheme.light(
    surface: Color.fromARGB(255, 255, 255, 255),
    primary: Color.fromARGB(255, 255, 0, 0),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 0, 0, 0),
    onSecondary: Color.fromARGB(255, 255, 0, 0),
    surfaceTint: Colors.transparent,
  ),    
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 176, 0, 0),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color.fromARGB(255, 255, 0, 0)
  ),

  colorScheme: ColorScheme.dark(
    surface: Color.fromARGB(255, 54, 54, 54),
    primary: Color.fromARGB(255, 176, 0, 0),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 255, 255, 255),
    onSecondary: Color.fromARGB(255, 255, 0, 0),
    surfaceTint: Colors.transparent,
  ),
);


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
        ],
      )
    );
  }
}