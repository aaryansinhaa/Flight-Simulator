import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spiralrunner/plane.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  //plane variables

  static double planeY = 0.0;
  double initialPos = planeY;
  double height = 0;
  double time = 0;
  double gravity = -4.4;
  double velocity = 2.9;

  //game settings
  bool gameIsStated = false;

  void gameStart() {
    gameIsStated = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      //upward parabolic function indicating jump
      height = gravity * time * time + velocity * time;
      setState(() {
        planeY = initialPos - height;
      });
      if (planeCrash()) {
        timer.cancel();
        gameIsStated = false;
        _showDialog();
      }
      //keeps the time going

      //print(planeY);
      time += 0.1;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: const Center(
              child: Text(
                'G A M E  O V E R',
                style: TextStyle(color: Colors.red),
              ),
            ),
            actions: [
              GestureDetector(
                  onTap: resetGame,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      color: Colors.white,
                      child: const Text(
                        'P L A Y  A G A I N',
                        style: TextStyle(
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ))
            ],
          );
        });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      planeY = 0.0;
      gameIsStated = false;
      time = 0.0;
      initialPos = planeY;
    });
  }

  bool planeCrash() {
    if (planeY < -1.0 || planeY > 1.0) {
      return true;
    }
    return false;
  }

  void jump() {
    //resets the time to 0, helps in keeps on jumping
    setState(() {
      time = 0;
      initialPos = planeY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameIsStated ? jump : gameStart,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('🛫'),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Stack(children: [
                      Plane(planeY),
                      Container(
                        alignment: const Alignment(0, -0.5),
                        child: Text(
                          gameIsStated ? '' : 'T A P  T O  P L A Y',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      )
                    ]),
                  ),
                )),
            Expanded(
                child: Container(
              color: Colors.grey,
            ))
          ],
        ),
      ),
    );
  }
}
