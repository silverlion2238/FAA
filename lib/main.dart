import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/gestures.dart';
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
import 'package:flutter_tts/flutter_tts.dart';
import 'package:diacritic/diacritic.dart';
import 'dart:ffi' if (dart.library.html) 'dart:html';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env");
    print('API KEY: ${dotenv.env['API_KEY']}');
  } catch (e) {
    print('Error loading .env file: $e');
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => InjuryNotifier()),
        ChangeNotifierProvider(create: (context) => LanguageModel()),
        ChangeNotifierProvider(create: (context) => ChatDataProvider()),
        ChangeNotifierProvider(create: (context) => VoiceNotifier()),
        ChangeNotifierProvider(create: (_) => LayoutProvider()),
      ],
      child: MyApp(),
    ),
  );

  //Firebase
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
}

//Providers

class LayoutProvider extends ChangeNotifier {
  bool _isTwoColumnLayout = false;

  bool get isTwoColumnLayout => _isTwoColumnLayout;

  void setLayout(bool isTwoColumnLayout) {
    _isTwoColumnLayout = isTwoColumnLayout;
    notifyListeners();
  }
}

class VoiceNotifier extends ChangeNotifier {
  List<Map> _voices = [];
  Map _selectedVoice = {};
  bool _mute = true;

  List<Map> get voices => _voices;
  Map get selectedVoice => _selectedVoice;
  bool get mute => _mute;

  void setVoices(List<Map> voices) {
    _voices = voices;
    notifyListeners();
  }

  void setSelectedVoice(Map voice) {
    _selectedVoice = voice;
    FlutterTtsSingleton.instance.setVoice(Map<String, String>.from(voice));
    print('Selected voice: $voice');  
    notifyListeners();
  }

  bool isMuted() {
    return _mute;
  }

  void setMute(bool mute) {
    _mute = mute;
    FlutterTtsSingleton.instance.setVolume(mute ? 1 : 0);
    notifyListeners();
  }
}

class ChatDataProvider with ChangeNotifier{
  String? userKey;
  String? conversationID;



  Future<List<String?>> initializeData() async {
    userKey = await createUser();
    conversationID = await createConversation(userKey);
    notifyListeners();
    return [userKey,conversationID]; // Update widgets that depend on this data

  }
}

class ThemeModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(ThemeMode newThemeMode) {
    _themeMode = newThemeMode;
    notifyListeners();
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

class InjuryNotifier extends ChangeNotifier {
  List<Injury> _displayInjuries = injuries;

  List<Injury> get displayInjuries => _displayInjuries;

  void searchInjury(BuildContext context, String query) {

    _displayInjuries = injuries.where(
      (injury) => removeDiacritics(injury.getName(context).toLowerCase()).contains(removeDiacritics(query.toLowerCase()))
      ).toList();

    notifyListeners();

  }


  void getResults ({
    required List<Injury> resultInjuries
  }) async {
    _displayInjuries = resultInjuries;
    notifyListeners();
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}


//Flutter TTS Singleton
class FlutterTtsSingleton {
  static final FlutterTts _instance = FlutterTts();

  FlutterTtsSingleton._privateConstructor();

  static FlutterTts get instance => _instance;
}


//My App
class MyApp extends StatefulWidget {  
  @override
  
  MyAppState createState() => MyAppState();
}

//State of My App
class MyAppState extends State<MyApp> {
  
  FlutterTts _flutterTts = FlutterTtsSingleton.instance;
  //switching tabs 
  int _selectedIndex = 2; // To keep track of the selected tab
  

  void _switchPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index, duration: Duration(microseconds: 500), curve: Curves.ease);
  }

  PageController _pageController = PageController(initialPage: 2);

  //passing _switchPage function
  late List<Widget> _appPages;

  @override
  void initState() {
    super.initState();
    // Initialize _appPages here, after the instance is created
    initTTS();
    _appPages = <Widget>[
      ChecklistScreen(toResultTab: _switchPage), // Now you can use _switchPage
      ResultScreen(),
      MainPage(toResultTab: _switchPage),
      ChatScreen(),
      SettingsPage(),
    ];
  }

  void initTTS() {
    _flutterTts.getVoices.then((data) {
      if (!mounted) return;
      try {
        List<String> langs = translations.keys.toList();
        List<Map> voices = List<Map>.from(data);
        List<Map> enVoices = voices.where((data) => data['locale'].contains('en')).toList();
        List<Map> skVoices = voices.where((data) => data['locale'].contains('sk')).toList();
        List<Map> usableVoices = enVoices + skVoices;
        print(usableVoices);
        Provider.of<VoiceNotifier>(context, listen: false).setVoices(usableVoices);
        Map currentVoice;
        try {
          currentVoice = usableVoices.where((voice) => voice['locale'].contains(Provider.of<LanguageModel>(context, listen: false).locale.toString())).first;
        } catch (e) {
          Provider.of<VoiceNotifier>(context, listen: false).setMute(false);
          currentVoice = usableVoices.isNotEmpty ? usableVoices.first : {};
        }
        Provider.of<VoiceNotifier>(context, listen: false).setSelectedVoice(currentVoice);

      } catch (e) {
        print('Error getting voices');
        print(e);
      }
    });
  }


  //Material App
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageModel>(
      builder: (context, languageModel, child) {
        return MaterialApp(
          scrollBehavior: AppScrollBehavior(),
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
          themeMode: Provider.of<ThemeModel>(context).themeMode, 
          theme: Provider.of<ThemeNotifier>(context).currentLightTheme,
          darkTheme: Provider.of<ThemeNotifier>(context).currentDarkTheme,
          home: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translations[languageModel.locale.languageCode]!['appTitle']!,
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  if (_selectedIndex == 0) 
                  DropdownButton<bool>(
                    value: Provider.of<LayoutProvider>(context).isTwoColumnLayout,
                    dropdownColor: Color(0xFFC2000B),
                    items: [
                      DropdownMenuItem(
                        value: true,
                        child: Icon(
                          Icons.view_module,
                          color: Colors.white,
                          ),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Icon(
                          Icons.view_agenda,
                          color: Colors.white,
                          ),
                      ),
                    ],
                    onChanged: (bool? newBool) {
                      if (newBool != null) {
                        setState(() {
                          Provider.of<LayoutProvider>(context, listen: false).setLayout(newBool);
                        });
                      }
                    },
                  )
                ],
              ),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            ),
            body: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
              },
              children: _appPages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.search), //, color: Theme.of(context).appBarTheme.foregroundColor
                  label: translations[languageModel.locale.languageCode]!['search']??'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: translations[languageModel.locale.languageCode]!['results']??'Results',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: translations[languageModel.locale.languageCode]!['home']??'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: translations[languageModel.locale.languageCode]!['chatbot']??'Chatbot',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: translations[languageModel.locale.languageCode]!['settings']??'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _switchPage,
              selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            ),
          ),
        );
      },
    );
  }
}