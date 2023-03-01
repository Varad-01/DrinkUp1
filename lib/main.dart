import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/home-screen-02.dart';
import 'package:myapp/page-1/home-screen-03.dart';
import 'package:myapp/page-1/login.dart';
import 'package:myapp/page-1/main2.dart';
import 'package:myapp/page-1/phone_login/phone.dart';
import 'package:myapp/page-1/phone_login/verify.dart';
import 'package:myapp/page-1/sign-up.dart';
import 'package:myapp/page-1/splash-screen.dart';
import 'package:myapp/page-1/starting-page-01.dart';
import 'package:myapp/page-1/starting-page-1.dart';
import 'package:myapp/page-1/welcome-page.dart';
import 'package:myapp/snapshott.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/home-screen-01.dart';

Future main() async{
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp();
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Flutter',
		initialRoute: '/splashScreen',
		routes: {
			'/splashScreen':(context)=>Splash(),
			'/welcomePage':(context)=>WelcomePage(),
			'/login':(context)=>Login(),
			'/signUp':(context)=>SignUp(),
			'/startPage1':(context)=>StartPage1(),
			'/startPage2':(context)=>StartPage2(),
			'/homePage1':(context)=>Scene(),
			'/homePage2':(context)=>Scene2(),
			'/homePage3':(context)=>Scene3(),
			'/main2':(context)=>main2(),
			'/verify':(context)=>Verify(),
			'/phone_auth':(context)=>Phone(),
			'/snapshott':(context)=>Snapshott(),
		},

		debugShowCheckedModeBanner: false,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,

		),
		home: main2(),

	);
	}
}
