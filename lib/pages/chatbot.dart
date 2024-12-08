import 'dart:ffi';

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


class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  List tempList = [];
  String userKey = '';
  String conversationID = '';
  bool isConnected = false;

  Future<bool> _checkConnection() async {
    String checkConnection = await checkConnectivity();
    
    if (checkConnection == 'connected') {
      print('data initialized');
      isConnected = true;
      return true;
    } else {
      print('cant access internet');
      return false;
    }
  }
 
  void _initializeData() async {
    tempList = await DataProvider().initializeData();
    userKey = tempList[0];
    conversationID = tempList[1];
  }

  @override
  void initState() {
    super.initState();
    
    _checkConnection().then(
      (isConnected) {
        if (isConnected) {
          print('initializing data');
          _initializeData();
        } else {
          print('initialization aborted');
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
      final locale = Provider.of<LanguageModel>(context, listen: false).locale.languageCode;
        _textController.clear();



      ChatMessage message = ChatMessage(
        text: text,
        isUser: true,
      );
      
      setState(() {
        _messages.insert(0, message);
        }
      );


      //check internet connection
      


      // Send message to Botpress API
      var post = await http.post(
        Uri.parse('https://chat.botpress.cloud/17157902-f630-4a68-b45a-b126fcbff509/messages'), // Replace with your Botpress API URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-user-key': userKey,
        },
        body: jsonEncode({
          'payload': {
            'text': message.text,
            'type': 'text',
          },
          'conversationId': conversationID,
        }),
      );
      if (post.statusCode == 200) {
        // Botpress API call successful
        //print('Message sent to Botpress');
      } else {
        // Handle error
        print('Failed to send message to Botpress: ${post.statusCode}');
        print('Response body: ${post.body}');
      }




      String botReply = jsonDecode(post.body)['message']['payload']['text'];


      while (botReply == jsonDecode(post.body)['message']['payload']['text']){
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
          print('Response body: ${response.body}');
          try {
            data = jsonDecode(response.body);
          } catch (e) {
            print('Error decoding response body: $e');
            return;
          }


          print(response.body);
          print(response.request);
          botReply = data['messages'][0]['payload']['text'];


          // Check if the bot's reply is the same as the user's message
          if (botReply == jsonDecode(post.body)['message']['payload']['text']) {
            await Future.delayed(Duration(seconds: 1));
          } else {
            ChatMessage botMessage = ChatMessage(
              text: botReply,
              isUser: false,
            );
            setState(() {
              _messages.insert(0, botMessage);
              }
            );
          }
        } else {
          // Handle error
          print('Failed to get messages from Botpress: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      }
    }
  

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);
    final locale = Provider.of<LanguageModel>(context).locale.languageCode;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
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
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (isConnected) {
                    _handleSubmitted(_textController.text);
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
  ChatMessage({required this.text, required this.isUser});

  final String text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(isUser ? 'U' : 'B')),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(isUser ? 'You' : 'Bot',
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}