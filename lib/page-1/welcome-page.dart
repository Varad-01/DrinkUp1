import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // welcomepageQJP (1:22)
            padding: EdgeInsets.fromLTRB(45*fem, 93*fem, 45*fem, 160*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: const Color(0xfff9f9f9),
              borderRadius: BorderRadius.circular(35*fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // welcometodrinkupg11 (1:25)
                  margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 62*fem),
                  child: Text(
                    'Welcome to DrinkUp',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 36*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2368751102*ffem/fem,
                      color: const Color(0xff0a0f25),
                    ),
                  ),
                ),
                Container(
                  // autogroupcja7hRu (39varBNBtLPxka7WYxcJa7)
                  margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 12*fem, 86*fem),
                  width: double.infinity,
                  height: 335*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // ellipse2bXH (1:23)
                        left: 5*fem,
                        top: 307*fem,
                        child: Align(
                          child: SizedBox(
                            width: 142*fem,
                            height: 26*fem,
                            child: Image.asset(
                              'assets/page-1/images/ellipse-2.png',
                              width: 142*fem,
                              height: 26*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // shinyhappymorningjogrCK (1:30)
                        left: 0*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 316*fem,
                            height: 335*fem,
                            child: Image.asset(
                              'assets/page-1/images/shiny-happy-morning-jog.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // signupbuttonikK (1:26)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 51*fem),
                  width: double.infinity,
                  height: 50*fem,
                  decoration: BoxDecoration (
                    color: const Color(0xff179bff),
                    borderRadius: BorderRadius.circular(50*fem),
                  ),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/signUp');
                    },
                    // style: ,
                    child: Text(
                      'Sign Up',
                      style: TextStyle (
                        fontFamily: 'Satoshi',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2368750572*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),

                  ),
                ),
                Container(
                  // loginbutton94w (1:28)
                  width: double.infinity,
                  height: 50*fem,
                  decoration: BoxDecoration (
                    border: Border.all(color: const Color(0xff179bff)),
                    borderRadius: BorderRadius.circular(50*fem),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: const BorderSide(color: Color(0xff179bff)),
                        ),
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle (
                        fontFamily: 'Satoshi',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2368750572*ffem/fem,
                        color: const Color(0xff000000),
                      ),
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