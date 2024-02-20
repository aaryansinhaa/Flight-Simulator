import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spiralrunner/gamescreen.dart';

class Porsche extends StatelessWidget {
  const Porsche({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🚘'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    //color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset('assets/porsche.jpeg'),
                const SizedBox(height: 10),
                Text(
                  'Before starting, Let\'s look at the amazing Porsche 911!!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameScreen()),
                    );
                  },
                  child: const Text(
                    "LESSS GO 🦅✈️🔥",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 77, 84, 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
