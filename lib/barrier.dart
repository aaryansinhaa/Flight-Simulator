import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double barrierWidth;
  final double barrierHeight;
  final double barrierX;
  final bool isThisBottomBarrier;

  const Barrier({
    required this.barrierWidth,
    required this.barrierHeight,
    required this.isThisBottomBarrier,
    required this.barrierX,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: isThisBottomBarrier ? null : 0,
      bottom: isThisBottomBarrier ? 0 : null,
      left: MediaQuery.of(context).size.width * barrierX / 2,
      child: Container(
        width: MediaQuery.of(context).size.width * barrierWidth / 2,
        height: MediaQuery.of(context).size.height * barrierHeight / 2,
        color: Colors.green,
      ),
    );
  }
}
