import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    super.initState();
    startTimer();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller!);
  }

  startTimer() {
    var duration = const Duration(milliseconds: 3000);
    return Timer(duration, () {
      _controller!.forward().whenComplete(() {
        Navigator.pushReplacementNamed(context, '/snapshott');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: FadeTransition(
        opacity: _opacityAnimation!,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/page-1/images/water-meter-fill.gif',
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
