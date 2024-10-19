import 'package:flutter/material.dart';


Widget specialFunction1(context) {
  return Column(
    children: [
      Text(
        'Primary Text(question)',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 20,
        ),
      ),
      SizedBox(height: 20,),
      Text(
        'Description',
        textAlign: TextAlign.center,),
      SizedBox(height: 20,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(
            Icons.navigate_next,
            color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),


          SizedBox(width: 20,),


          FloatingActionButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        ],
      )  
    ],
  );
}