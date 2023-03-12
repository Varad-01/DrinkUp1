import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Scene extends StatefulWidget {

  @override
  State<Scene> createState() => _SceneState();
}

String phonenumber= FirebaseAuth.instance.currentUser!.phoneNumber.toString();
class _SceneState extends State<Scene> {
  String phoneNumber = FirebaseAuth.instance.currentUser!.phoneNumber.toString();
  List<String> docIDs = [];

  void initState() {
    print("called init");
    super.initState();
    getData();
  }

  int consumed=0;
  int remainWater=0;
  Future getData() async{
    print("getData() func is called");
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString()).get().then((value) async{
      setState(() {
        consumed=value['consumed'];
        remainWater=value['consumptionTarget'] - consumed;
        if(remainWater<0){
          remainWater=0;
        }
      });
    }).catchError((error) => print("Failed to load users data: $error"));
  }


  @override
  Widget build(BuildContext context) {
    print(remainWater);
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.fromLTRB(0*fem, 86*fem, 0*fem, 0*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(35*fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupnjqvdUP (Vx2MxBYGGapQT6sKm9njqV)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 135*fem),
                  width: double.infinity,
                  // color: Colors.yellow,
                  // height: 116*fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        // jvj (1:16)
                        "$consumed"+"ml",
                        style: SafeGoogleFont (
                          'MuseoModerno',
                          fontSize: 70*ffem,
                          fontWeight: FontWeight.w300,
                          // height: 1.59*ffem/fem,
                          color: const Color(0xff0091ff),
                        ),
                      ),
                      Text(
                        "Remaining $remainWater ml",
                        style: SafeGoogleFont (
                          'MuseoModerno',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w300,
                          // height: 1.59*ffem/fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),



                Container(
                  // autogroupmjyuPGX (Vx2NGkqeYv1dmAfadVMjyu)
                  width: double.infinity,
                  height: 579*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // boymeditating8tK (1:4)
                        left: 43*fem,
                        top: 22.9999847412*fem,
                        child: Align(
                          child: SizedBox(
                            width: 344*fem,
                            height: 288*fem,
                            child: Image.asset(
                              'assets/page-1/images/boy-meditating.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      WaveWidget(
                        config: CustomConfig(
                            gradients: [
                              [
                                Colors.blue.withOpacity(0.3),
                                // Colors.blue.shade900.withOpacity(0.7)//2
                                const Color.fromRGBO(23, 155, 255,1).withOpacity(0.9)
                              ],
                              [
                                Colors.blue.withOpacity(0.8),
                                // Colors.blue.shade900.withOpacity(0.7) //1
                                const Color.fromRGBO(23, 155, 255,1).withOpacity(0.7)
                              ]
                            ],
                            gradientBegin: Alignment.centerLeft,
                            gradientEnd: Alignment.centerRight,
                            durations: [10300, 10000],
                            // heightPercentages: [0.35, 0.38],
                            heightPercentages: [0.3,0.3],
                            blur: const MaskFilter.blur(BlurStyle.solid, 40)),
                        size: const Size(double.infinity, double.infinity),
                      ),
                      Positioned(
                        left: 40.0000915527*fem,
                        top: 19.0000228882*fem,
                        child: Align(
                          child: Transform.rotate(
                            angle: 142 * pi / 180, // 45 degrees in radians
                            child: SizedBox(
                              width: 45.67*fem,
                              height: 53.68*fem,
                              child: Image.asset(
                                'assets/page-1/images/blue-water-drop.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        // bluewaterdrop9ym (1:19)
                        left: 344*fem,
                        top: 23*fem,
                        child: Align(
                          child: Transform.rotate(
                            angle: 215 * pi / 180,
                            child: SizedBox(
                              width: 50.11*fem,
                              height: 54.58*fem,
                              child: Image.asset(
                                'assets/page-1/images/blue-water-drop-Edh.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),),
                      ),
                      Positioned(
                        // bluewaterdropEEX (1:20)
                        left: 363*fem,
                        top: 103.9999303818*fem,
                        child: Align(
                          child: Transform.rotate(
                            angle: 232 * pi / 180,
                            child: SizedBox(
                              width: 48*fem,
                              height: 54.77*fem,
                              child: Image.asset(
                                'assets/page-1/images/blue-water-drop-i8K.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),),
                      ),
                      Positioned(
                        // bluewaterdropiQb (1:21)
                        left: 27.5105743408*fem,
                        top: 116.0812189579*fem,
                        child: Align(
                          child: Transform.rotate(
                            angle: 131 * pi / 180,
                            child: SizedBox(
                              width: 51.77*fem,
                              height: 51*fem,
                              child: Image.asset(
                                'assets/page-1/images/blue-water-drop-Ww5.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),),
                      ),
                    ],
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