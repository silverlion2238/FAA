import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/pages/settings.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';
import 'package:flutter_application_0_0_5/functions/http_functions.dart';

import 'dart:ffi' if (dart.library.html) 'dart:html';

class ChatScreen extends StatefulWidget { 
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  String userKey = '';
  String conversationID = '';
  bool isConnected = false;
  bool isWaiting = false;

  Future<bool> _checkConnection() async {
    String checkConnection = await checkConnectivity();
    
    if (checkConnection == 'connected') {
      //print('Connected to the internet');
      isConnected = true;
      return true;
    } else {
      //print('cant access internet');
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Connection Error'),
            content: Text('Cannot access the internet. Please check your connection and try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
      return false;
    }
  }
 
  void _initializeData() async {
    print(Provider.of<ChatDataProvider>(context, listen: false).userKey);
    
    
    userKey = Provider.of<ChatDataProvider>(context, listen: false).userKey;
    conversationID = Provider.of<ChatDataProvider>(context, listen: false).conversationID;
    print('userKey in chatbot: $userKey');
    print('conversationID in chatbot: $conversationID');
    
    //getting the previous messages from the bot


    var previousConv = await http.get(
      Uri.parse('https://chat.botpress.cloud/17157902-f630-4a68-b45a-b126fcbff509/conversations/$conversationID/messages'), // Replace with your Botpress API URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-user-key': userKey,
      },
    );

    if (previousConv.statusCode == 200) {
      // Parse the response and display the bot's reply
      Map<String, dynamic> data;
      print('Response body: ${previousConv.body}');
      
      

      try {
        data = jsonDecode(previousConv.body);
      } catch (e) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('Error decoding previous chat response body: $e'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
        return;
      }

      var tempMessages = data['messages'];
      for (int i = tempMessages.length - 1; i >= 0; i--) {
        if (i % 2 == 1) {
          addMessageToChat(tempMessages[i]['payload']['text'], true);
        } else {
          addMessageToChat(tempMessages[i]['payload']['text'], false);
        }
      }
      //['payload']['text']
      } else {
        // Handle error
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('Failed to load previous messages from Botpress: ${previousConv.statusCode}\nResponse body: ${previousConv.body}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      }
      
  }

  @override
  void initState() {
    super.initState();
    
    _checkConnection().then(
      (isConnected) {
        if (isConnected) {
          _initializeData();
          //print('initializing data');
        } else {
          //print('initialization aborted');
          if (mounted) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Initialization Aborted'),
                content: Text('Data initialization was aborted due to no internet connection.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        }
      }
    );
  }


  


  /*
  String userKey = '';
  String conversationID = '';

  createUser().then((_) {
      createConversation(userKey);
    });
  */

  void _handleSubmitted(String text,) async {
    
    print('userKey on pressed: $userKey');
    print('conversationID on pressed: $conversationID');
    late final String locale;
    _textController.clear();
    HttpRequest? post;

    addMessageToChat(text, true);
    


    //check internet connection
    
    try {
      if (post != null) {
        print('Post already exists');
      } else {
      
    
      // Send message to Botpress API
        try {
          var post = await http.post(
            Uri.parse('https://chat.botpress.cloud/17157902-f630-4a68-b45a-b126fcbff509/messages'), // Replace with your Botpress API URL
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-user-key': userKey,
            },
            body: jsonEncode({
              'payload': {
                'text': text,
                'type': 'text',
              },
              'conversationId': conversationID,
            }),
          );
        

          if (post.statusCode == 200) {
            // Botpress API call successful
            isWaiting = true;
            addMessageToChat('.', false);
            
          } else {
            if (mounted) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('Failed to send message to Botpress: ${post.statusCode}\nResponse body: ${post.body}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          }




          String botReply = jsonDecode(post.body)['message']['payload']['text'];


//CHECKING THE RESPONSE FROM THE BOTPRESS API AND DISPLAYING THE BOT'S REPLY IN THE APP UI TO THE USER

          while (isWaiting){
            var response = await http.get(
              Uri.parse('https://chat.botpress.cloud/17157902-f630-4a68-b45a-b126fcbff509/conversations/$conversationID/messages'), // Replace with your Botpress API URL
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'x-user-key': userKey,
              },
            );

            if (response.statusCode == 200) {
              // Parse the response and display the bot's reply
              Map<String, dynamic> data;
              //print('Response body: ${response.body}');
              
              

              try {
                data = jsonDecode(response.body);
              } catch (e) {
                if (mounted) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text('Error decoding response body: $e'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
                return;
              }

              /*
              print(response.body);
              print(response.request);
              */
              botReply = data['messages'][0]['payload']['text'];


              // Check if the bot's reply is the same as the user's message
              if (botReply == jsonDecode(post.body)['message']['payload']['text']) {
                await Future.delayed(Duration(seconds: 1));

                if (mounted) {// Replacing the placeholder message with the bot's reply and adding a dot
                  Provider.of<ChatMessagesProvider>(context, listen: false).changeMessageAt(0,
                    ChatMessage(
                      context: context,
                      text: '${Provider.of<ChatMessagesProvider>(context, listen: false).messages[0]}.',
                      isUser: false,
                    )
                  );                  
                }
              } else {
                if (mounted) {// Replacing the placeholder message with the bot's reply
                  Provider.of<ChatMessagesProvider>(context, listen: false).changeMessageAt(0,
                    ChatMessage(
                      context: context,
                      text: botReply,
                      isUser: false,
                    )
                  );
                }
                isWaiting = false;
                FlutterTtsSingleton.instance.speak(botReply);
              }
            } else {
              // Handle error
              if (mounted) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text('Failed to get messages from Botpress: ${response.statusCode}\nResponse body: ${response.body}'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            }
          }
        } catch (e) {
          if (mounted) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text('Error sending message to Botpress: $e'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        }//end of try-catch
      }
    } catch (e) {
      print(e);
    }
      return;
    }
  
  void addMessageToChat(String text, bool isUser) {
    ChatMessage message = ChatMessage(
      context: context,
      text: text,
      isUser: isUser,
    );
    Provider.of<ChatMessagesProvider>(context, listen: false).addMessage(message);
  }



  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
    final dataProvider = Provider.of<ChatDataProvider>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder( // CHAT <=====================================================================>
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => Provider.of<ChatMessagesProvider>(context, listen: false).messages[index],
              itemCount: Provider.of<ChatMessagesProvider>(context, listen: false).messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(locale),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer(String locale) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: (text) {
                  if (isConnected) {
                  _handleSubmitted(text);
                    } else {
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: Text(translations[locale]!['wrongInput']!),
                        content: Text(translations[locale]!['noResults']!),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: Text(translations[locale]!['ok']!)),
                        ],
                      )
                    );
                  }
                },
                decoration:
                    InputDecoration.collapsed(
                      hintText: translations[locale]!['sendMessage'] ?? "Send a message",
                      hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withAlpha(150),),
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send, color: isWaiting ? Theme.of(context).iconTheme.color?.withAlpha(150) : Theme.of(context).iconTheme.color),
                onPressed: () {
                  if (isConnected) {
                    if (!isWaiting) {
                      _handleSubmitted(_textController.text);
                    }
                  } else {
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        title: Text(translations[locale]!['wrongInput']!),
                        content: Text(translations[locale]!['noResults']!),
                        actions: [
                          TextButton(onPressed: () => Navigator.pop(context), child: Text(translations[locale]!['ok']!)),
                        ],
                      )
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}





class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.isUser, required this.context}) {
    locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
  }

  final BuildContext context;
  late final String locale;
  final String text;
  final bool isUser;
  


  @override
  Widget build(BuildContext context) {
    if (isUser) { // If the message is from the user
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(translations[locale]!['you']!, style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ],
        ),
      );
    } else { // If the message is from the bot
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Icon(Icons.assistant),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Chatbot', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: changeAsterisksForBold(text), 
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
          ],
        ),
      );
    } 
  }
}

Text changeAsterisksForBold(String text) {
  final RegExp exp = RegExp(r'\*\*(.*?)\*\*');
  final List<TextSpan> spans = [];
  int start = 0;

  for (final Match match in exp.allMatches(text)) {
    if (match.start > start) {
      spans.add(TextSpan(text: text.substring(start, match.start)));
    }
    spans.add(TextSpan(text: match.group(1), style: TextStyle(fontWeight: FontWeight.bold)));
    start = match.end;
  }

  if (start < text.length) {
    spans.add(TextSpan(text: text.substring(start)));
  }

  return Text.rich(TextSpan(children: spans), textAlign: TextAlign.justify,);
}