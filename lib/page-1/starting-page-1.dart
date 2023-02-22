import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class StartPage1 extends StatefulWidget {
  @override
  State<StartPage1> createState() => _StartPage1State();
}

class _StartPage1State extends State<StartPage1> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            // startingpage1vgs (1:141)
            padding: EdgeInsets.fromLTRB(75*fem, 98*fem, 76*fem, 91*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(35*fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // tellusmoreaboutnj5 (1:142)
                  margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 10*fem),
                  child: Text(
                    'Tell us more about ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 32*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2368750572*ffem/fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // autogroupgzwm3uu (39vfZJ27P1hMGJgpe7GzwM)
                  margin: EdgeInsets.fromLTRB(18*fem, 0*fem, 16*fem, 14*fem),
                  width: double.infinity,
                  height: 102*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // yourselfMQo (1:143)
                        left: 18*fem,
                        top: 0*fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8*fem, 0*fem, 8*fem, 0*fem),
                          width: 208*fem,
                          height: 66*fem,
                          child: Text(
                            'Yourself',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 53.5999984741*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2368750568*ffem/fem,
                              fontStyle: FontStyle.italic,
                              color: const Color(0xff179bff),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // designsyndromedoodleline321TcF (1:149)
                        left: 0*fem,
                        top: 45*fem,
                        child: Align(
                          child: SizedBox(
                            width: 245*fem,
                            height: 57*fem,
                            child: Image.asset(
                              'assets/page-1/images/design-syndrome-doodle-line-32-1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // helloillustrationFo1 (1:145)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 54*fem),
                  width: double.infinity,
                  height: 422*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // ellipse2YGK (1:146)
                        left: 24*fem,
                        top: 384*fem,
                        child: Align(
                          child: SizedBox(
                            width: 231*fem,
                            height: 38*fem,
                            child: Image.asset(
                              'assets/page-1/images/ellipse-2-mxF.png',
                              width: 231*fem,
                              height: 38*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // bigshoesstandingposeRb1 (1:147)
                        left: 0*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 279*fem,
                            height: 403*fem,
                            child: Image.asset(
                              'assets/page-1/images/big-shoes-standing-pose.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   // arrowVqm (1:150)
                //   margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 0*fem),
                //   child: TextButton(
                //     onPressed: () {},
                //     style: TextButton.styleFrom(
                //       padding: EdgeInsets.zero,
                //     ),
                //     child: Container(
                //       width: 101*fem,
                //       height: 101*fem,
                //       child: Image.asset(
                //         'assets/page-1/images/arrow-MFH.png',
                //         width: 101*fem,
                //         height: 101*fem,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
              ),
      ),
      floatingActionButton:
      SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton.extended(
          shape: const CircleBorder(side: BorderSide(color: Colors.blueAccent)),
          label: const Icon(Icons.arrow_forward,size: 70,),

          onPressed: (){
            Navigator.pushNamed(context, '/startPage2');
          },
          elevation: 0,
          foregroundColor: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}