import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/pages/chatbot.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:flutter_application_0_0_5/pages/search.dart';
import 'package:flutter_application_0_0_5/pages/result.dart';
import 'package:flutter_application_0_0_5/pages/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_application_0_0_5/functions/http_functions.dart';
import 'package:flutter_application_0_0_5/pages/main_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => InjuryNotifier()),
        ChangeNotifierProvider(create: (context) => LanguageModel()),
        ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: MyApp(),
    ),
  );

  //Firebase
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
}



class DataProvider with ChangeNotifier{
  String? userKey;
  String? conversationID;



  Future<List<String?>> initializeData() async {
    userKey = await createUser();
    conversationID = await createConversation(userKey);
    notifyListeners();
    return [userKey,conversationID]; // Update widgets that depend on this data

  }
}



//Change Notifiers

//Theme Notifier
class ThemeModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Default to system theme

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(ThemeMode newThemeMode) {
    _themeMode = newThemeMode;
    notifyListeners(); // Notify listeners to rebuild
  }
}

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentLightTheme = redLightTheme;
  ThemeData _currentDarkTheme = redDarkTheme;

  ThemeData get currentLightTheme => _currentLightTheme;
  ThemeData get currentDarkTheme => _currentDarkTheme;

  void setTheme(ThemeData theme, ThemeData darkTheme) {
    _currentLightTheme = theme;
    _currentDarkTheme = darkTheme;
    notifyListeners();
  }
}


//syncing displayed injuries
class InjuryNotifier extends ChangeNotifier {
  List<Injury> _displayInjuries = injuries;

  List<Injury> get displayInjuries => _displayInjuries;

  void whichInjury(BuildContext context, String query) {

    _displayInjuries = injuries.where((injury) => injury.getName(context).toLowerCase().contains(query.toLowerCase())).toList();

    notifyListeners();

  }


  void getResults ({
    required List<Injury> resultInjuries
  }) async {
    _displayInjuries = resultInjuries;
    notifyListeners();
  }
}

//My App
class MyApp extends StatefulWidget {  
  @override
  
  MyAppState createState() => MyAppState();
}

//State of My App
class MyAppState extends State<MyApp> {
  

  
  //switching tabs 
  int _selectedIndex = 2; // To keep track of the selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //passing _onItemTapped function
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    // Initialize _widgetOptions here, after the instance is created
    _widgetOptions = <Widget>[
      ChecklistScreen(toResultTab: _onItemTapped), // Now you can use _onItemTapped
      ResultScreen(),
      MainPage(toResultTab: _onItemTapped,),
      ChatScreen(),
      SettingsPage(),
    ];
  }

  //Material App
  @override
  Widget build(BuildContext context) {
    
    return Consumer<LanguageModel>(
      builder: (context, languageModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: languageModel.locale,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
            Locale('sk'),
          ],
          themeMode: Provider.of<ThemeModel>(context).themeMode, // Get theme from provider
          theme: Provider.of<ThemeNotifier>(context).currentLightTheme,
          darkTheme: Provider.of<ThemeNotifier>(context).currentDarkTheme,
          home: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              title: Text(
                'Prvá pomoc pre školákov',
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            ),
            body: _widgetOptions.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.search), //, color: Theme.of(context).appBarTheme.foregroundColor
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: 'Results',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Main',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chatbot',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            ),
          ),
        );
      },
    );
  }
}