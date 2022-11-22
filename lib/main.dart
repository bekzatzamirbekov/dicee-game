import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: const Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 2;
  void randomDice(){
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        randomDice();
                      },
                      child: Image.asset('images/dice$leftDiceNumber.png'))),
              Expanded(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        randomDice();
                      },
                      child: Image.asset('images/dice$rightDiceNumber.png'))),
            ],
          ),
        ),
        const SizedBox(height: 100,),
        Center(
          child: RawMaterialButton(
            onPressed: () {
              randomDice();
            },
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(15.0),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.touch_app,
              size: 35.0,
            ),
          ),
        )
      ],
    );
  }
}
