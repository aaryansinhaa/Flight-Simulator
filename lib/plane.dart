import 'package:flutter/material.dart';

class Plane extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final planeY;
  const Plane(this.planeY, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, planeY),
      child: Image.asset(
        'assets/images/airplane.png',
        height: 70,
        width: 70,
      ),
    );
  }
}
