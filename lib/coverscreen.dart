import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {
  //const CoverScreen({super.key});
  final gameIsStated;
  const CoverScreen({this.gameIsStated});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.5),
      child: Text(
        gameIsStated ? '' : 'T A P  T O  P L A Y',
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}
