import 'package:flutter/material.dart';

class Plane extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final planeY;
  final double planeWidth;
  final double planeHeight;
  const Plane(
      {this.planeY, required this.planeHeight, required this.planeWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, (2 * planeY + planeWidth) / (2 - planeWidth)),
      child: Image.asset(
        'assets/images/airplane.png',
        height: MediaQuery.of(context).size.height * 3 / 4 * planeHeight / 2,
        width: MediaQuery.of(context).size.width * planeWidth / 2,
        fit: BoxFit.fill,
      ),
    );
  }
}
