import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF34495E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Want more lore?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
              child: OverflowBox(
                minHeight: 500,
                maxHeight: 500,
                child: Transform.scale(
                  scale: 0.6,
                  child: Lottie.network(
                    'https://lottie.host/27321bc8-8c5f-4ac3-a3fb-092a426a11a0/Z4fDb62pMW.json',
                  ),
                ),
              ),
            ),
            const Text(
              'Learn some interesting information about the characters. Be careful, though, maybe you won\'t like what you learn.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
