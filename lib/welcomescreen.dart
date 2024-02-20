import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:spiralrunner/porsche.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('✈️Flight Simulator'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                const Icon(
                  Icons.airplanemode_on,
                  color: Color.fromARGB(255, 0, 137, 11),
                  size: 100.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                GradientText(
                  'Flight Simulator',
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                  colors: const [
                    Color.fromARGB(255, 238, 240, 105),
                    Color.fromARGB(255, 255, 64, 64),
                    Color.fromARGB(255, 205, 92, 16),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Let\'s Explode 🔥✈️🔥✈️🔥✈️🔥',
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
                      MaterialPageRoute(builder: (context) => const Porsche()),
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
                const SizedBox(
                  height: 300,
                ),
                const Text('Made with ❤️ by Entrymellon'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
