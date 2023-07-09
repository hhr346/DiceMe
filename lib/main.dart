import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[400],
        appBar: AppBar(
          title: const Text(
            'Let\'s roll some dice!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              fontFamily: 'Fasthand',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal[800],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftN = 1;
  int rightN = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  for (int i = 0; i < 10; i++) {
                    Future.delayed(Duration(milliseconds: 200 * i), () {
                      setState(() {
                        // leftN = leftN % 6 + 1;
                        leftN = Random().nextInt(6) + 1;
                      });
                    });
                  }
                },
                child: Image(
                  image: AssetImage('images/dice$leftN.png'),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  for (int i = 0; i < 15; i++) {
                    Future.delayed(Duration(milliseconds: 200 * i), () {
                      setState(() {
                        rightN = Random().nextInt(6) + 1;
                      });
                    });
                  }
                },
                child: Image(
                  image: AssetImage('images/dice$rightN.png'),
                ),
              ),
            ),
          ],
        ),
        Text(
          leftN > rightN
              ? 'Left win!'
              : leftN < rightN
                  ? 'Right win!'
                  : 'Tie! Row again!',
          style: const TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
