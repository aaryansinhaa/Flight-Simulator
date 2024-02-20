import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spiralrunner/plane.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double planeY = 0;
  void jump() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        planeY -= 0.05;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: jump,
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
                    child: Stack(children: [Plane(planeY)]),
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
