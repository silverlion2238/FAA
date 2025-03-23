import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/pages/settings.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:flutter_application_0_0_5/functions/http_functions.dart';

import 'dart:ffi' if (dart.library.html) 'dart:html';

class ChatScreen extends StatefulWidget {

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {

  ActionButtonStyle chatbotButtonStyle(context) {
    return ActionButtonStyle(
      iconDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      iconColor: Theme.of(context).colorScheme.onPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LlmChatView(
          style: LlmChatViewStyle(
            backgroundColor: Theme.of(context).colorScheme.surface,
            addButtonStyle: chatbotButtonStyle(context),
            recordButtonStyle: chatbotButtonStyle(context),
            chatInputStyle: ChatInputStyle(
              backgroundColor: Theme.of(context).colorScheme.surface,
              hintText: translations[locale]?['Type a message'] ?? 'Type a message',
              textStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),                
            )
          ),
          provider: GeminiProvider(
            model: GenerativeModel(
              model: 'gemini-1.5-flash',  
              apiKey: 'AIzaSyDTfOaFnF9b0SBlHUbAIdgkh9ioYhBGBsQ',
            ),
            chatGenerationConfig: GenerationConfig(
              temperature: 0,
              topK: 40,
              topP: 0.95,
              maxOutputTokens: 8192,
              responseMimeType: 'text/plain',
            ),
          ),
        )
      )
    );
  }
}