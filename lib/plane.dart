import 'package:flutter/material.dart';

class Plane extends StatelessWidget {
  final planeY;
  Plane(this.planeY);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, planeY),
      height: 70,
      width: 70,
      child: Image.asset('assets/airplane.png'),
    );
  }
}