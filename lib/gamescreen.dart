import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spiralrunner/barrier.dart';
import 'package:spiralrunner/coverscreen.dart';
import 'package:spiralrunner/plane.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
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
  double planeHeight = 0.2;
  double planeWidth = 0.3;

  //Barrier settings
  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.20; //out of 2;
  List<List<double>> barrierHeight = [
    //out of 2
    //[top,bottom]
    [0.3, 0.2],
    [0.2, 0.3],
  ];
  //game settings
  bool gameIsStated = false;
  void moveMap() {
    for (int i = 0; i < barrierX.length; i++) {
      setState(() {
        barrierX[i] -= 0.05;
      });

      if (barrierX[i] <= 1.5) {
        barrierX[i] += 3;
      }
    }
  }

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
      moveMap();
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
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= planeWidth &&
          barrierX[i] + barrierWidth >= -planeWidth &&
          (planeY <= -1 + barrierHeight[i][0] ||
              planeY + planeHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
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
                  child: Stack(
                    children: [
                      //plane
                      Plane(
                        planeY: planeY,
                        planeHeight: planeHeight,
                        planeWidth: planeWidth,
                      ),
                      //cover screen
                      CoverScreen(
                        gameIsStated: gameIsStated,
                      ),
                      //top barrier 0
                      Barrier(
                        barrierX: barrierX[0],
                        barrierWidth: barrierWidth,
                        barrierHeight:
                            1 - barrierHeight[0][0], // Adjusted this line
                        isThisBottomBarrier: false,
                      ),

                      //bottom barrier 0
                      Barrier(
                        isThisBottomBarrier: true,
                        barrierHeight: barrierHeight[0][1],
                        barrierWidth: barrierWidth,
                        barrierX: barrierX[0],
                      ),

                      //top barrier 1
                      Barrier(
                        isThisBottomBarrier: false,
                        barrierHeight:
                            1 - barrierHeight[1][0], // Adjusted this line
                        barrierWidth: barrierWidth,
                        barrierX: barrierX[1],
                      ),

                      //bottom barrier 1
                      Barrier(
                        isThisBottomBarrier: true,
                        barrierHeight: barrierHeight[1][1],
                        barrierWidth: barrierWidth,
                        barrierX: barrierX[1],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
