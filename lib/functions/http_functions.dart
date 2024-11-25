import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_0_0_5/models/language_model.dart';
import 'package:provider/provider.dart'; 
import 'package:flutter_application_0_0_5/main.dart';

Future<String> createUser() async {
  String userKey = '';
  final response = await http.post(
    Uri.parse('https://chat.botpress.cloud/17157902-f630-4a68-b45a-b126fcbff509/users'), // Webhook URL
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
    }),
  ); 

  if (response.statusCode == 200) {
    // User created successfully, extract the user key from the response
    final responseBody = response.body; 
    userKey = jsonDecode(responseBody)['key'];
    print('User key: $userKey');
    return userKey;
  } else {
    // Handle errors
    print('Failed to create user: ${response.statusCode}'); 
    return '';
  }
}//https://webhook.botpress.cloud/17157902-f630-4a68-b45a-b126fcbff509






Future<String> createConversation(userKey) async {
  String conversationID = '';
  final response = await http.post(
    Uri.parse('https://chat.botpress.cloud/17157902-f630-4a68-b45a-b126fcbff509/conversations'), // Webhook URL
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'x-user-key': userKey,
    },
    body: jsonEncode(<String, String>{
      'type': 'open', // Add a valid key-value pair
      }
    ),
  ); 

  if (response.statusCode == 200) {
    // conversation created successfully, extract the conversation id from the response
    conversationID = jsonDecode(response.body)['conversation']['id']; 
    print('ConversationID: $conversationID');
    return conversationID;
  } else {
    // Handle errors
    print('Failed to create conversation: ${response.statusCode}'); 
    print(response.body);
    print(response.request);
    return '';
  }
}

