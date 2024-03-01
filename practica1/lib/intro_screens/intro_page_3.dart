import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBA4A00),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Keep updated!',
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
                  scale: 0.8,
                  child: Lottie.network(
                    'https://lottie.host/95f73f14-2033-4c01-a7e6-7d8620208464/jjwqa8D7Pe.json',
                  ),
                ),
              ),
            ),
            const Text(
              'You\'ll recieve notifications whenever there are updates on the characters profiles.',
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
