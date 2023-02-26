import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: TextButton(
        // splashscreennaX (1:18)
        onPressed: () {},
        style: TextButton.styleFrom (
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(43*fem, 165.5*fem, 42*fem, 0*fem),
          width: double.infinity,
          decoration: BoxDecoration (
            color: const Color(0xff179bff),
            borderRadius: BorderRadius.circular(35*fem),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // appname5bZ (1:19)
                margin: EdgeInsets.fromLTRB(4.12*fem, 0*fem, 0*fem, 254*fem),
                width: 311.12*fem,
                height: 90.5*fem,
                child: Image.asset(
                  'assets/page-1/images/app-name.png',
                  width: 311.12*fem,
                  height: 90.5*fem,
                ),
              ),
              Container(
                // fitzwaterjg7 (1:21)
                width: 345*fem,
                height: 426*fem,
                child: Image.asset(
                  'assets/page-1/images/fitz-water.png',
                ),
              ),
            ],
          ),
        ),
      ),
          );
  }
}