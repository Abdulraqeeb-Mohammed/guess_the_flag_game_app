import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guess_the_flag_game/ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen();

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> countries = [
    "Estonia",
    "France",
    "Germany",
    "Ireland",
    "Italy",
    "Monaco",
    "Nigeria",
    "Poland",
    "Russia",
    "Spain",
    "UK",
    "US",
  ];

  int randomNum = Random().nextInt(3);
  int correctAnswers = 0;
  int wrongAnswers = 0;

  @override
  void initState() {
    countries.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 16),
              const Text(
                "Guess The Flag?",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              Text(
                countries[randomNum],
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              for(int i = 0 ; i < 3; i++)
                FlagButton(
                  name: countries[i],
                  onPressed: () {
                    if(randomNum == i){
                      correctAnswers++;
                      Fluttertoast.showToast(msg: "Correct Answer!", backgroundColor: Colors.green, toastLength: Toast.LENGTH_SHORT);
                    }else{
                      wrongAnswers++;
                      Fluttertoast.showToast(msg: "Wrong Answer!", backgroundColor: Colors.redAccent, toastLength: Toast.LENGTH_SHORT);
                    }
                    setState(() {
                      countries.shuffle();
                      randomNum = Random().nextInt(3);
                    });
                  },
                ),
              SizedBox(height: 50),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(correctAnswers: correctAnswers, wrongAnswers: wrongAnswers,)));
              }, child: Text("Result"))
            ],
          ),
        ),
      ),
    );
  }
}

class FlagButton extends StatelessWidget {
  const FlagButton({super.key, required this.name, required this.onPressed});

  final String name;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Image.asset(
          "assets/countries/$name.png",
          height: 150,
        ));
  }
}
