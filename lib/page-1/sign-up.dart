import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}
TextEditingController _emailController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _SignUpState extends State<SignUp> {
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
            // signup59V (1:82)
            padding: EdgeInsets.fromLTRB(0*fem, 100*fem, 0*fem, 81*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(35*fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupitdmWEo (39vbtjTdBwfF6iLChXiTdM)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 53*fem, 47*fem),
                  width: 393*fem,
                  height: 241*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // frame6CNX (1:83)
                        left: 128*fem,
                        top: 11*fem,
                        child: SizedBox(
                          width: 255*fem,
                          height: 45*fem,
                          child: Center(
                            child: Text(
                              'Welcome Aboard',
                              style: TextStyle(
                                fontFamily: 'Satoshi',
                                fontSize: 33*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2368751102*ffem/fem,
                                color: const Color(0xff0a0f25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // bigshoestorso38F (1:85)
                        left: 0*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 327*fem,
                            height: 241*fem,
                            child: Image.asset(
                              'assets/page-1/images/big-shoes-torso.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // nameuRM (1:90)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 287*fem, 9*fem),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 18*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2368751102*ffem/fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // frame2CfM (1:86)
                  margin: EdgeInsets.fromLTRB(49*fem, 0*fem, 49*fem, 26*fem),
                  padding: EdgeInsets.fromLTRB(10*fem, 13*fem, 10*fem, 12*fem),
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration (
                    border: Border.all(color: const Color(0xff0a0f25)),
                    borderRadius: BorderRadius.circular(15*fem),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      RegExp regExp = new RegExp('[a-zA-Z]');
                      if (value!.length == 0) {
                        return 'Please enter a name';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full Name',
                        contentPadding: EdgeInsets.symmetric(vertical: 7.5),
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
                Container(
                  // emailavo (1:98)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 289*fem, 9*fem),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 18*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2368751102*ffem/fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // frame9gU3 (1:96)
                  margin: EdgeInsets.fromLTRB(49*fem, 0*fem, 49*fem, 26*fem),
                  padding: EdgeInsets.fromLTRB(10*fem, 13*fem, 10*fem, 12*fem),
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration (
                    border: Border.all(color: const Color(0xff0a0f25)),
                    borderRadius: BorderRadius.circular(15*fem),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      RegExp regExp = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (value!.length == 0) {
                        return 'Please enter a name';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'example@gmail.com',
                      contentPadding: EdgeInsets.symmetric(vertical: 7.5),
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
                Container(
                  // passwordKmu (1:91)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 259*fem, 9*fem),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 18*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2368751102*ffem/fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // frame8d1u (1:88)
                  margin: EdgeInsets.fromLTRB(49*fem, 0*fem, 49*fem, 81*fem),
                  padding: EdgeInsets.fromLTRB(10*fem, 13*fem, 10*fem, 12*fem),
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration (
                    border: Border.all(color: const Color(0xff0a0f25)),
                    borderRadius: BorderRadius.circular(15*fem),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      contentPadding: EdgeInsets.symmetric(vertical: 7.5),
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
                Container(
                  // signupbutton4su (1:92)
                  margin: EdgeInsets.fromLTRB(45*fem, 0*fem, 45*fem, 20*fem),
                  width: double.infinity,
                  height: 50*fem,
                  decoration: BoxDecoration (
                    color: const Color(0xff179bff),
                    borderRadius: BorderRadius.circular(50*fem),
                  ),
                  child: TextButton(
                    onPressed: (){
                      final name = _nameController.text;
                      final email = _emailController.text;

                      createUser(name: name, email: email);
                      // Navigator.pushNamed(context, '/startPage1');
                    },
                    // style: ,
                    child: Text(
                      'Sign Up',
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
                Container(
                  // autogroup1ylovQK (39vc2yitHNZpqav16Q1yLo)
                  margin: EdgeInsets.fromLTRB(111*fem, 0*fem, 102*fem, 0*fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // haveanaccountpkb (1:94)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18*fem, 0*fem),
                        child: Text(
                          'Have an account?',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2368750572*ffem/fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      GestureDetector(
                        // loginhereu (1:95)
                        child: Text(
                          'Login Here',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 15*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2368750572*ffem/fem,
                            decoration: TextDecoration.underline,
                            color: const Color(0xff179bff),
                            decorationColor: const Color(0xff179bff),
                          ),
                        ),
                        onTap: (){
                            Navigator.pushNamed(context, '/login');

                        },
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

  Future createUser({required String name, required String email}) async{
    final docUser= FirebaseFirestore.instance.collection('users').doc();

    final json = {
      'name' : name,
      'email' : email,
      'Time' : DateTime.now(),
    };
    try {
      await docUser.set(json);
    }on FirebaseException catch(e)
    {
      print(e);
    }
  }
}