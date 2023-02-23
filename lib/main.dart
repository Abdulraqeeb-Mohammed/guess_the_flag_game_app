import 'package:flutter/material.dart';
import 'package:guess_the_flag_game/QuizScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

//QuizScreen
  // DONE: Add an image view
  // DONE: Add a random country to select
  // Done: Add Three random image
  // Done: Change the quiz when answered
  // Done: Add FlutterToast to indicate when choose a correct answer
  // Done: Add the button to move to the second screen
//TODO: Pass the data to the result screen

