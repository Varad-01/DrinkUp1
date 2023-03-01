import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/home-screen-01.dart';
import 'package:myapp/page-1/starting-page-01.dart';
import 'package:myapp/page-1/starting-page-1.dart';
import 'package:myapp/page-1/welcome-page.dart';

import 'page-1/phone_login/phone.dart';


class Snapshott extends StatefulWidget {
  const Snapshott({Key? key}) : super(key: key);

  @override
  State<Snapshott> createState() => _SnapshottState();
}

class _SnapshottState extends State<Snapshott> {
  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot)
          {
            if(snapshot.hasData)
          {
            return Scene();
          }
              else{
                return const Phone();
              }

            }

      );

  }
}

