import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Scene2 extends StatefulWidget {
  @override
  State<Scene2> createState() => _Scene2State();
}

class _Scene2State extends State<Scene2> {

  int updateValue = 0;
  void initState() {
    super.initState();
    getData();
  }

  int consumed=0;
  double progressBarValue=0;

  String progressBarText="";
  int remainWater=0;

  Future getData() async{
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString()).get().then((value) async{
      setState(() {
        consumed=value['consumed'];
        remainWater=value['consumptionTarget'];
        //consumed=300, consumptionTarget=200,
        //Then progressBarValue=0.15% => 15%
        progressBarValue=consumed/remainWater;
        if(progressBarValue>1.0){
          progressBarValue=1.0;
        }
        //converting 0.15 to 15%
        progressBarText=(progressBarValue*100).round().toString()+"%";
        print(progressBarText);
      });
    });
    // int currentValue=consumed;
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Container(
              // homescreen02QVR (1:181)
              padding: EdgeInsets.fromLTRB(
                  1.89 * fem, 88 * fem, 1.89 * fem, 63 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(35 * fem),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroup8q1rrcK (39vgXw4QM43Yj3UgQ78Q1R)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 17.89 * fem),
                    width: double.infinity,
                    height: 466.11 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // currenthydrationM3H (1:189)
                          left: 92.1055908203 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 241 * fem,
                              height: 41 * fem,
                              child: Text(
                                'Current Hydration',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Satoshi',
                                  fontSize: 32 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2575 * ffem / fem,
                                  color: const Color(0xff179bff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // chartdonutzc3 (1:190)
                          left: 0 * fem,
                          top: 39.8944091797 * fem,
                          child: Container(
                            width: 426.21 * fem,
                            height: 426.21 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // ellipse1strokesvj (1:191)
                                  left: 39.1055908203 * fem,
                                  top: 39.1055908203 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 348 * fem,
                                      height: 348 * fem,
                                      child: CircularPercentIndicator(
                                        animation: true,
                                        animationDuration: 2000,
                                        radius: 140,
                                        lineWidth: 20,
                                        percent: progressBarValue,
                                        // progressColor: Colors.deepPurple,
                                        // backgroundColor: Colors.deepPurple.shade100,
                                        backgroundColor: Colors.blue.shade100,
                                        progressColor: const Color.fromRGBO(
                                            23, 155, 255, 1),
                                        circularStrokeCap: CircularStrokeCap
                                            .round,
                                        center: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text("$progressBarText",
                                                style: TextStyle(fontSize: 56)),
                                            const SizedBox(height: 10),
                                            Text('${consumed}ml',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                )
                                            ),
                                            const SizedBox(height: 2),
                                            Text('$remainWater'+" ml")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Container(
                    // addwaterbuttonsXhm (1:196)
                    margin: EdgeInsets.fromLTRB(
                        39.11 * fem, 0 * fem, 38.11 * fem, 89 * fem),
                    width: double.infinity,
                    height: 149 * fem,
                    child: Stack(
                      children: [
                        //colors 1st box;
                        Positioned(
                          // rectangle3cz7 (1:197)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: InkWell(
                              onTap: () {
                                //add value to the progress bar,
                                setState(() {
                                  // getData();
                                  consumed += 180;
                                });
                                updateUser(updateValue: consumed);
                              },
                              child: SizedBox(
                                width: 164 * fem,
                                height: 65 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10 * fem),
                                    color: const Color(0xffbfe3ff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //colors 2nd box
                        Positioned(
                          // rectangle6uCX (1:198)
                          left: 0 * fem,
                          top: 84 * fem,
                          child: Align(
                            child: InkWell(
                              onTap: () {
                                //add value
                                setState(() {
                                  // getData();
                                  consumed += 500;
                                });
                                updateUser(updateValue: consumed);
                                getData();
                              },
                              child: SizedBox(
                                width: 164 * fem,
                                height: 65 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10 * fem),
                                    color: const Color(0xfffce9e3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // rectangle4zDy (1:199)
                          left: 184 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: InkWell(
                              onTap: () {
                                //add value
                                setState(() {
                                  // getData();
                                  consumed += 250;
                                });
                                updateUser(updateValue: consumed);
                                getData();
                              },
                              child: SizedBox(
                                width: 165 * fem,
                                height: 65 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10 * fem),
                                    color: const Color(0xfff1eeff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // rectangle5soZ (1:200)
                          left: 184 * fem,
                          top: 84 * fem,
                          child: Align(
                            child: InkWell(
                              onTap: () {
                                //add value
                                setState(() {
                                  // getData();
                                  consumed += 750;
                                });
                                updateUser(updateValue: consumed);
                                getData();
                              },
                              child: SizedBox(
                                width: 165 * fem,
                                height: 65 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10 * fem),
                                    color: const Color(0xfffffaec),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //have to work here
                        Positioned(
                          // group1Mij (1:201)
                          left: 28 * fem,
                          top: 18 * fem,
                          child: Container(
                            width: 284 * fem,
                            height: 123.09 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupq4vhEnX (39vh5apLBRpxBvgfCsQ4VH)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 1 * fem, 98 * fem, 0 * fem),
                                  width: 95 * fem,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            // getData();
                                            consumed += 180;
                                          });
                                          updateUser(updateValue: consumed);
                                          getData();
                                        },
                                        splashColor: Colors.blue,
                                        child: Container(
                                          // autogroupep1mwS3 (39vhDAS31Bp5BVhrDPEP1m)
                                          margin: EdgeInsets.fromLTRB(
                                              12 * fem, 0 * fem, 0.57 * fem,
                                              46.21 * fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .end,
                                            children: [
                                              Container(
                                                // teapairSNo (1:202)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem, 0 * fem,
                                                    9.64 * fem, 0 * fem),
                                                width: 26.79 * fem,
                                                height: 26.79 * fem,
                                                child: Image.asset(
                                                  'assets/page-1/images/tea-pair.png',
                                                  fit: BoxFit.contain,

                                                ),
                                              ),
                                              Container(
                                                // ml8Fd (1:203)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem, 0 * fem, 0 * fem,
                                                    1.33 * fem),
                                                child: Text(
                                                  '180 ml',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Balsamiq Sans',
                                                    fontSize: 15.7065210342 *
                                                        ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2 * ffem / fem,
                                                    color: const Color(
                                                        0xff0a0f25),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        child: Container(
                                          // autogroupd6gsPxF (39vhLpsw7QQsmUfs9Sd6gs)
                                          width: double.infinity,
                                          height: 49.09 * fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // bottleofwaterKL7 (1:208)
                                                left: 0 * fem,
                                                top: 0 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 35.09 * fem,
                                                    height: 49.09 * fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/bottle-of-water.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // mlzx3 (1:209)
                                                left: 46 * fem,
                                                top: 18.0002441406 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 49 * fem,
                                                    height: 19 * fem,
                                                    child: Text(
                                                      '500 ml',
                                                      textAlign: TextAlign
                                                          .center,
                                                      style: SafeGoogleFont(
                                                        'Balsamiq Sans',
                                                        fontSize: 15.7065210342 *
                                                            ffem,
                                                        fontWeight: FontWeight
                                                            .w400,
                                                        height: 1.2 * ffem /
                                                            fem,
                                                        color: const Color(
                                                            0xff0a0f25),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            // getData();
                                            consumed += 500;
                                          });
                                          updateUser(updateValue: consumed);
                                          getData();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // autogroup2ykfTaj (39vhY54CRMU2sDHQmu2ykf)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 6 * fem, 8.09 * fem),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            // getData();
                                            consumed += 250;
                                          });
                                          updateUser(updateValue: consumed);
                                          getData();
                                        },
                                        splashColor: Colors.blue.shade900,
                                        child: Container(
                                          // waterglassa9Z (1:204)
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem, 1 * fem,
                                              53 * fem),
                                          width: 26 * fem,
                                          height: 29 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/water-glass.png',
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        child: Container(
                                          // milkGo5 (1:206)
                                          width: 33 * fem,
                                          height: 33 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/milk.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            // getData();
                                            consumed += 750;
                                          });
                                          updateUser(updateValue: consumed);
                                          getData();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // autogrouprhrmCRq (39vhfjW6Xa4qTCFRhxRhRm)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 7 * fem, 0 * fem, 12.09 * fem),
                                  width: 52 * fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        child: Container(
                                          // mlhNb (1:205)
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem, 0 * fem,
                                              66 * fem),
                                          width: double.infinity,
                                          child: Text(
                                            '250 ml',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Balsamiq Sans',
                                              fontSize: 15.7065210342 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2 * ffem / fem,
                                              color: const Color(0xff0a0f25),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            // getData();
                                            consumed += 250;
                                          });
                                          updateUser(updateValue: consumed);
                                          getData();
                                        },
                                      ),
                                      InkWell(
                                        child: Container(
                                          // mlyqu (1:207)
                                          width: double.infinity,
                                          child: Text(
                                            '750 ml',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Balsamiq Sans',
                                              fontSize: 15.7065210342 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2 * ffem / fem,
                                              color: const Color(0xff0a0f25),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            // getData();
                                            consumed += 750;
                                          });
                                          updateUser(updateValue: consumed);
                                          getData();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  Future<void> updateUser({required int updateValue}) {
    CollectionReference docUser = FirebaseFirestore.instance.collection('users');

    return docUser
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString())
        .update({'consumed': updateValue,'Time' : DateTime.now()})
        .then((value) {
    }).catchError((error) => print(" Failed to update user: $error"));
  }
}