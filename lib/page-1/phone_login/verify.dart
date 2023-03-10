import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/home-screen-01.dart';
import 'package:myapp/page-1/phone_login/phone.dart';
import 'package:pinput/pinput.dart';

class Verify extends StatefulWidget {

  // const Verify({Key? key}) : super(key: key);
  String phoneNumber="";
  Verify({required this.phoneNumber});

  @override
  State<Verify> createState() => _VerifyState(phoneNumber: phoneNumber);
}

class _VerifyState extends State<Verify> {
  String phoneNumber="";
  _VerifyState({required this.phoneNumber});

  // Verify({required phoneNumber});
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  var code="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                showCursor: true,
                onCompleted: (pin) => print(pin),
                onChanged: (value)
                {
                  code=value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),

                    onPressed: () async{
                      try{
                        // showDialog(
                        //     context: context,
                        //     builder: (context){
                        //       return Center(
                        //         child: CircularProgressIndicator(),
                        //       );
                        //     }
                        // );
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Phone.verify, smsCode: code);
                        await auth.signInWithCredential(credential);
                        print("working");
                        await createUser(phone: phoneNumber);
                        // Navigator.of(context).pop();
                        Navigator.pushNamedAndRemoveUntil(context, "/main2", (route) => false);

                      }
                      catch(e)
                      {
                        final snackbar = SnackBar(content: Text("Invalid OTP"));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }

                    },
                    child: Text("Verify Phone Number")),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/phone_auth',
                              (route) => false,
                        );
                      },
                      child: Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future createUser({required String phone}) async{

    final docUser= FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString());

    final json = {
      'phone': FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
      'consumed':0,
      'notification': false,
      'consumptionTarget':2000,
      'Time' : DateTime.now(),
    };
    try {
      await docUser.set(json);
      Navigator.pushNamed(context, '/startPage1');
    }on FirebaseException catch(e)
    {
      print(e);
    }
  }

}
