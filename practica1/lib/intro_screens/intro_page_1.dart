import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF023020),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Create a favourite list.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Transform.scale(
            scale: 9.0,
            child: Lottie.network(
              'https://lottie.host/835f72a2-be4c-41a5-9411-f01badfc1259/QtKEH68EAf.json',
            ),
          ),
          const Text(
            'Add your most favourtie characters to your favourite list, so you can easly locate them.',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
