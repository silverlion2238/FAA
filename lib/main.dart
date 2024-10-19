import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/pages/data.dart';
import 'package:flutter_application_0_0_5/pages/search.dart';
import 'package:flutter_application_0_0_5/pages/result.dart';
import 'package:flutter_application_0_0_5/pages/settings.dart';
import 'package:provider/provider.dart';




void main() async {

  //Firebase
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();



  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (context) => InjuryNotifier()),
      ],
      child: MyApp(),
    ),
  );
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



//syncing displayed injuries
class InjuryNotifier extends ChangeNotifier {
  List<Injury> _displayInjuries = injuries;

  List<Injury> get displayInjuries => _displayInjuries;

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
  int _selectedIndex = 0; // To keep track of the selected tab


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
      SettingsPage(),
    ];
  }



  //Material App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      themeMode: Provider.of<ThemeModel>(context).themeMode, // Get theme from provider
      theme: lightTheme,
      darkTheme: darkTheme,

      home: Scaffold(


        backgroundColor: Theme.of(context).colorScheme.surface,

        appBar: AppBar(
          title: Text(
            'My App',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),


        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),


        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Results',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],

          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}