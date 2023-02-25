import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StartPage2 extends StatefulWidget {
  @override
  State<StartPage2> createState() => _StartPage2State();
}

class _StartPage2State extends State<StartPage2> {
  TextEditingController _weightController = TextEditingController();
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  TimeOfDay _timeOfDay=const TimeOfDay(hour: 12, minute: 00);
  void _showTimePicker()
  {
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    ).then((value) => {
      setState((){
        _timeOfDay=value!;
      })
    });
  }

  
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    bool _isTextFieldEmpty = true;
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    void ToastMsg(String str)
    {
      Fluttertoast.showToast(
          msg: str,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            // startingpage01KKH (1:99)
            padding: EdgeInsets.fromLTRB(41*fem, 70*fem, 31*fem, 83*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(35*fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // enteryourdetailsN2f (1:134)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 87*fem, 40*fem),
                  child: Text(
                    'Enter your details',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 35.7*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2368751102*ffem/fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // whatisyourgender2d1 (1:100)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 150*fem, 0*fem),
                  child: Text(
                    'What  is your gender ?\n',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2368750572*ffem/fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // rectangle878f (1:103)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 52*fem),
                  width: 322*fem,
                  height: 48*fem,
                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.circular(18*fem),

                  ),
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),

                      ),

                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Your Gender',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff179bff),
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: genderItems
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                    },
                    onSaved: (value) {
                      var selectedValue = value.toString();
                    },
                  ),
                ),
                Container(
                  // whatisyourcurrentweightJsM (1:101)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 100*fem, 26*fem),
                  child: Text(
                    'What is your current weight ?',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 23*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2368750572*ffem/fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 322*fem,
                      height: 100*fem,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _weightController,
                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          RegExp regExp = RegExp('[1-9][0-9]?|1[0-4][0-9]|150');
                          if (value!.length == 0) {
                            return 'Please enter weight';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter a valid weight';
                          }
                          return null;
                        },
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15*fem),
                          ),
                          hintText: 'weight',
                          contentPadding: EdgeInsets.symmetric(vertical: 7.5,horizontal: 9.5),
                        ),
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 22*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2368751102*ffem/fem,
                          color: const Color(0xff6e7180),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // whatisyouactivetimegd1 (1:102)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 138*fem, 19*fem),
                  child: Text(
                    'What is you active time ?',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 20*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.2368750572*ffem/fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  // autogrouptmu5NEw (39vd2T58614rETA85qTMu5)
                  margin: EdgeInsets.fromLTRB(9*fem, 0*fem, 0*fem, 30*fem),
                  width: double.infinity,
                  height: 35*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // wakeuptimeU35 (1:108)
                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 110*fem, 0*fem),
                        child: Text(
                          'Wake Up Time ',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2368750572*ffem/fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          //dialog box code
                          _showTimePicker();
                        },
                        child: SizedBox(
                          // timeinputZKR (1:110)
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // timeinputHWK (1:111)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6.5*fem, 0*fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupcnubzJF (39vdK2RqZKVhJcGYo7cnUb)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                      width: 48*fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        color: const Color(0xfff2f2f2),
                                        borderRadius: BorderRadius.circular(2*fem),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '7',  //dynamic has to be done
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 24.0000019073*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1666665739*ffem/fem,
                                            color: const Color(0xff1a1a1a),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // vectorzxT (1:115)
                                      margin: EdgeInsets.fromLTRB(0*fem, 5.5*fem, 3.5*fem, 0*fem),
                                      width: 4*fem,
                                      height: 13.5*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-DMm.png',
                                        width: 4*fem,
                                        height: 13.5*fem,
                                      ),
                                    ),
                                    Container(
                                      // autogroupv8hzgaP (39vdQXGgHc6kTrf5j2V8HZ)
                                      width: 48*fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        color: const Color(0xfff2f2f2),
                                        borderRadius: BorderRadius.circular(2*fem),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '00',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 24.0000019073*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1666665739*ffem/fem,
                                            color: const Color(0xff1a1a1a),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // ampmselectorLew (1:117)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                width: 26*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  border: Border.all(color: const Color(0xffb3b3b3)),
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(2*fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupybwjPNK (39vde6iPYQP2B9jmCiYBWj)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                      width: double.infinity,
                                      height: 17.5*fem,
                                      decoration: BoxDecoration (
                                        border: Border.all(color: const Color(0xffb3b3b3)),
                                        color: const Color(0xfff2f2f2),
                                        borderRadius: BorderRadius.only (
                                          topLeft: Radius.circular(2*fem),
                                          topRight: Radius.circular(2*fem),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'AM',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 8*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5000001192*ffem/fem,
                                            color: const Color(0xff1a1a1a),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // pmzN7 (1:121)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.5*fem, 0*fem),
                                      child: Text(
                                        'PM',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: 8*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5000001192*ffem/fem,
                                          color: const Color(0xff1a1a1a),
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
                    ],
                  ),
                ),
                Container(
                  // autogroupnw3dfz3 (39vdmgL6NAN9AikxDENW3D)
                  margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 0*fem, 139*fem),
                  width: double.infinity,
                  height: 35*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // sleeptimeBBh (1:109)
                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 132*fem, 0*fem),
                        child: Text(
                          'Sleep Time ',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2368750572*ffem/fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          _showTimePicker();
                        },
                        child: SizedBox(
                          // timeinputTuu (1:122)
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // timeinput1Aj (1:123)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6.5*fem, 0*fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupmwekJvX (39ve2b4vAJVLNcxrTdMweK)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                      width: 48*fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        color: const Color(0xfff2f2f2),
                                        borderRadius: BorderRadius.circular(2*fem),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '10',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 24.0000019073*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1666665739*ffem/fem,
                                            color: const Color(0xff1a1a1a),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // vectork1q (1:127)
                                      margin: EdgeInsets.fromLTRB(0*fem, 5.5*fem, 3.5*fem, 0*fem),
                                      width: 4*fem,
                                      height: 13.5*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector.png',
                                        width: 4*fem,
                                        height: 13.5*fem,
                                      ),
                                    ),
                                    Container(
                                      // autogroupzgrocZq (39ve7kaykkdfADa5hMzgro)
                                      width: 48*fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        color: const Color(0xfff2f2f2),
                                        borderRadius: BorderRadius.circular(2*fem),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '00',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 24.0000019073*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1666665739*ffem/fem,
                                            color: const Color(0xff1a1a1a),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // ampmselectorrUB (1:129)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                width: 26*fem,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  border: Border.all(color: const Color(0xffb3b3b3)),
                                  color: const Color(0xfff2f2f2),
                                  borderRadius: BorderRadius.circular(2*fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogrouptkbmuBZ (39veLVikAxm6wPCVwcTkbm)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                      width: double.infinity,
                                      height: 17.5*fem,
                                      decoration: BoxDecoration (
                                        border: Border.all(color: const Color(0xffb3b3b3)),
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.only (
                                          topLeft: Radius.circular(2*fem),
                                          topRight: Radius.circular(2*fem),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'AM',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 8*ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5000001192*ffem/fem,
                                            color: const Color(0xff1a1a1a),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // pmJjV (1:133)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.5*fem, 0*fem),
                                      child: Text(
                                        'PM',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: 8*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5000001192*ffem/fem,
                                          color: const Color(0xff1a1a1a),
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
                    ],
                  ),
                ),
                Container(
                  // autogroupxfijC4B (39veUQfE8ZCxJbzzeJXfij)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                  width: 340*fem,
                  height: 50*fem,
                  child: Stack(
                    children: [
                      // Positioned(
                      //   // uparrowtxb (1:135)
                      //   left: 234*fem,
                      //   top: 20*fem,
                      //   child: Align(
                      //     child: SizedBox(
                      //       width: 38*fem,
                      //       height: 20*fem,
                      //       child: Image.asset(
                      //         'assets/page-1/images/up-arrow.png',
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Container(
                        // signupbutton4su (1:92)
                        // margin: EdgeInsets.fromLTRB(45*fem, 0*fem, 45*fem, 0*fem),
                        width: double.infinity,
                        height: 50*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xff179bff),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: TextButton(
                          onPressed: (){
                            final weight = _weightController.text;
                            if(weight.length==0)
                            {
                              Fluttertoast.showToast(msg: "Please enter your details");
                            }
                            else
                            createUser(weight: weight);
                          },
                          // style: ,
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 24*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2368750572*ffem/fem,
                              color: const Color(0xffffffff),
                            ),
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
      ),
    );
  }
  Future createUser({required String weight}) async{

    final docUser= FirebaseFirestore.instance.collection('users').doc();

    final json = {
      'weight' : weight,
    };
    try {
      await docUser.set(json);
      Navigator.pushNamed(context, '/main2');
    }on FirebaseException catch(e)
    {
      print(e);
    }
  }
}