import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    ); // MaterialApp
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 25,
              top: 150,
              child: Image.asset(
                'assets/images/Illustration1.png',
                fit: BoxFit.cover,
              ),
            ),
            WaveWidget(
              config: CustomConfig(
                  gradients: [
                    [
                      Colors.lightBlueAccent.withOpacity(0.8),
                      Colors.lightBlueAccent.shade200.withOpacity(0.7)
                    ],
                    [
                      Colors.lightBlueAccent.withOpacity(0.8),
                      Colors.lightBlueAccent.shade100.withOpacity(0.7)
                    ]
                  ],
                  gradientBegin: Alignment.centerLeft,
                  gradientEnd: Alignment.centerRight,
                  durations: [10300, 10000],
                  heightPercentages: [0.35, 0.38],
                  blur: const MaskFilter.blur(BlurStyle.solid, 40)),
              size: const Size(double.infinity, double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}
