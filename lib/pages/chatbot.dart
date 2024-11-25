import 'package:flutter/material.dart';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_0_0_5/main.dart';
import 'package:flutter_application_0_0_5/pages/settings.dart';
import 'package:flutter_application_0_0_5/data/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_0_0_5/data/language_data.dart';



class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  late String userKey;
  late String conversationID;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the provider and get the data
    final dataProvider = Provider.of<DataProvider>(context);
    userKey = dataProvider.userKey ?? '';
    conversationID = dataProvider.conversationID ?? '';
    if (userKey.isEmpty || conversationID.isEmpty) {
      // Fetch the data
      dataProvider.fetchData();
    }
    userKey = dataProvider.userKey ?? '';
    conversationID = dataProvider.conversationID ?? '';
  }
  


  /*
  String userKey = '';
  String conversationID = '';

  createUser().then((_) {
      createConversation(userKey);
    });
  */

    void _handleSubmitted(String text, userKey,conversationID) async {
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
      print('User key: $userKey');
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
        print('Message sent to Botpress');
      } else {
        // Handle error
        print('Failed to send message to Botpress: ${post.statusCode}');
        print('Response body: ${post.body}');
      }
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
      try {
        data = jsonDecode(response.body);
      } catch (e) {
        print('Error decoding response body: $e');
        return;
      }
      print(response.body);
      print(response.request);
      String botReply = data['messages'][0]['payload']['text'];
      ChatMessage botMessage = ChatMessage(
        text: botReply,
        isUser: false,
      );
      setState(() {
        _messages.insert(0, botMessage);
      });
    } else {
      // Handle error
      print('Failed to get response from Botpress: ${response.statusCode}');
      print('Response body: ${response.body}');
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
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: (text) => _handleSubmitted(text, userKey, conversationID),
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text, userKey, conversationID),
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