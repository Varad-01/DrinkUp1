import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
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
            // loginr3D (1:48)
            padding: EdgeInsets.fromLTRB(20*fem, 110*fem, 6*fem, 81*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(35*fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // goodtoseeyouagaini5R (1:50)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 17*fem),
                  child: Text(
                    'Good to see you again',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 36*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2368751102*ffem/fem,
                      color: const Color(0xff0a0f25),
                    ),
                  ),
                ),
                Container(
                  // enteryouremailandpasswordyouwa (1:54)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 81*fem, 31*fem),
                  constraints: BoxConstraints (
                    maxWidth: 292*fem,
                  ),
                  child: Text(
                    'Enter your email and password you want to login with.',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 16*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2368750572*ffem/fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // bigshoestorsoca7 (1:61)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                  width: 404*fem,
                  height: 215*fem,
                  child: Image.asset(
                    'assets/page-1/images/big-shoes-torso-Whh.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  // e
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 305*fem, 9*fem),
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
                  // frame2aQT (1:62)
                  margin: EdgeInsets.fromLTRB(18*fem, 0*fem, 44*fem, 0*fem),
                  width: 322*fem,
                  height: 75,
                  child: SizedBox(
                    width: 322*fem,
                    height: 75,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        RegExp regExp = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (value!.length == 0) {
                          return 'Please enter a email';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15*fem),
                        ),
                        hintText: 'example@gmail.com',
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
                ),
                Container(
                  // passwordbKZ (1:55)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 275*fem, 9*fem),
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
                  // frame3t3m (1:51)
                  margin: EdgeInsets.fromLTRB(18*fem, 0*fem, 44*fem, 74*fem),
                  width: 322*fem,
                  height: 75,
                  child: SizedBox(
                    width: 322*fem,
                    height: 75,
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length == 0) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15*fem),
                        ),
                        hintText: 'Password',
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
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      if(email.length==0 && password.length==0)
                      {
                        Fluttertoast.showToast(msg: "Please enter your details");
                      }
                      else
                      createUser(email: email);
                    },
                    // style: ,
                    child: Text(
                      'Login',
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
                  // autogroupdd4oQ43 (39vbKv4yP9GHL3tey9dD4o)
                  margin: EdgeInsets.fromLTRB(66*fem, 0*fem, 71*fem, 0*fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // donthaveaaccountW75 (1:59)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22*fem, 0*fem),
                        child: Text(
                          'Don’t have a account?',
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
                        // siupher (1:95)
                        child: Text(
                          'Sign Up Here',
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
                          setState(() {
                            Navigator.pushNamed(context, '/signUp');
                          });
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
  Future createUser({required String email}) async{

    final docUser= FirebaseFirestore.instance.collection('users').doc('U');

    final json = {
      'email' : email,
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