import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import '../Services/notifi_service.dart';
import 'package:notification_permissions/notification_permissions.dart';

class Scene3 extends StatefulWidget {
  @override
  State<Scene3> createState() => _Scene3State();
}

class _Scene3State extends State<Scene3> {

  void initState() {
    super.initState();
    getData();
  }

  bool switchValue=false;
  int dailyConsumption = 0;
  String notificationText="off";
  Future getData() async{
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString()).get().then((value) async{
      setState(() {
        switchValue=value['notification'];
        dailyConsumption=value['consumptionTarget'];
      });
      if(switchValue==true){
        notificationText="on";
      }
      else{
        notificationText="off";
      }
    });
    print("Fetched Data Successfully");
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
    TextEditingController();
    NotificationsServices notificationsServices = NotificationsServices();
    final consumption = TextEditingController();

    print(notificationText);

    TextEditingController _consumptionLimitController = TextEditingController();
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    void requestNotificationPermission(BuildContext context) async {
      PermissionStatus permissionStatus = await NotificationPermissions.requestNotificationPermissions();
      if (permissionStatus == PermissionStatus.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please allow notification permission'),
            duration: Duration(seconds: 4),
          ),
        );

      }
    }

    void _showDialogBox() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Daily consumption'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _textEditingController,
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a daily consumption limit';
                    } else {
                      int intValue = int.parse(value);
                      if (intValue == null) {
                        return 'Please enter a valid number';
                      }
                      else if (intValue < 2000) {
                        return 'Please enter value greater than 1999 ml';
                      }
                      else if (intValue >= 10000) {
                        return 'Please enter value less than 10000 ml';
                      }
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter drinking target',
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  getData();
                },
                child: Text('CANCEL'),
              ),
              TextButton(
                onPressed: ()  {
                  // Perform action with the text entered in the text field
                  String enteredText = _textEditingController.text;
                  dailyConsumption = int.parse(enteredText);
                  print('Entered Value: $enteredText');

                  updateUser(switchValue: switchValue,dailyConsumption: dailyConsumption);

                  if(dailyConsumption>=2000 && dailyConsumption<10000) {
                    getData();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Container(
              // homescreen03d8f (1:167)
              padding: EdgeInsets.fromLTRB(28*fem, 88*fem, 28*fem, 65*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(35*fem),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // settingsHU7 (1:175)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 57*fem),
                    child: Text(
                      'Settings',
                      style: SafeGoogleFont (
                        'Satoshi',
                        fontSize: 34*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2575*ffem/fem,
                        color: const Color(0xff179bff),
                      ),
                    ),
                  ),


                  Container(
                    // autogroupfadzxKM (39vfwsCqHNRM4BrjpZfADZ)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 53.58*fem),
                    width: double.infinity,
                    // height: 30*fem,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // remindersSkK (1:177)
                          // margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 145*fem, 2*fem),
                          child: Text(
                            'Reminders',
                            style: SafeGoogleFont (
                              'Satoshi',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2575*ffem/fem,
                              color: const Color(0xff0a0f25),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 90.0,
                          height: 40.0,
                          // LiteRollingSwitch(
                          //   value: switchValue,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       switchValue = value;
                          //       updateUser(switchValue: switchValue, dailyConsumption: dailyConsumption);
                          //       print(value);
                          //     });
                          //     if (value) {
                          //       print(value);
                          //       // Switch is turned on
                          //       requestNotificationPermission(context);
                          //       notificationsServices.initialiseNotificationS();
                          //       notificationsServices.scheduleNotification("Drink Water","Have you had any water yet?");
                          //     } else {
                          //       print(value);
                          //       // Switch is turned off
                          //       notificationsServices.initialiseNotificationS();
                          //       notificationsServices.stopNotification();
                          //     }
                          //   },
                          //   onTap: () {},
                          //   onDoubleTap: () {},
                          //   onSwipe: () {},
                          //   width: 90.0,
                          //   textOn: "On",
                          //   textOff: 'Off',
                          //   colorOn: Colors.green,
                          //   colorOff: Colors.red,
                          //   iconOn: Icons.alarm,
                          //   iconOff: Icons.alarm_off,
                          //   textSize: 16.0,
                          // )
                          child: AnimatedToggleSwitch<bool>.dual(
                            current: switchValue,
                            first: false,
                            second: true,
                            dif: 25.0,
                            borderColor: Colors.transparent,
                            borderWidth: 5.0,
                            height: 60,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 2.5),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                switchValue = value;
                                updateUser(
                                    switchValue: switchValue,
                                    dailyConsumption: dailyConsumption);
                                print(value);
                              });
                              if (value) {
                                print(value);
                                // Switch is turned on
                                requestNotificationPermission(context);
                                notificationsServices.initialiseNotificationS();
                                notificationsServices.scheduleNotification(
                                    "Drink Water",
                                    "Have you had any water yet?");
                              } else {
                                print(value);
                                // Switch is turned off
                                notificationsServices.initialiseNotificationS();
                                notificationsServices.stopNotification();
                              }
                            },
                            colorBuilder: (b) => b ? Colors.green : Colors.red,
                            iconBuilder: (value) => value
                                ? Icon(Icons.alarm)
                                : Icon(Icons.alarm_off),
                            textBuilder: (value) => value
                                ? Center(child: Text('On',style: TextStyle(fontSize: 16)))
                                : Center(child: Text('Off',style: TextStyle(fontSize: 16))),
                          ),
                        ),

                      ],
                    ),
                  ),

                  //next
                  Container(
                    // autogroup1rcbyXH (39vg7cRbV4QDUVTQqE1rcB)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 53.58*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          // dailyconsumptionGmH (1:178)
                          // margin: EdgeInsets.fromLTRB(0*fem, 4.42*fem, 151*fem, 0*fem),
                          child: Text(
                            'Daily consumption',
                            style: SafeGoogleFont (
                              'Satoshi',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w400,
                              // height: 1.2575*ffem/fem,
                              color: const Color(0xff0a0f25),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 50,
                          height: 35,
                          child:  Expanded(
                            child: InkWell(
                              child: Text(
                                '${dailyConsumption}ml',
                                style: SafeGoogleFont (
                                  'Satoshi',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w400,
                                  // height: 1.2575*ffem/fem,
                                  color: const Color(0xff179bff),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {
                                _showDialogBox();
                              },
                            ),
                          ),
                        ),
                        // IconButton(
                        //     onPressed: () {
                        //       final limit = consumption.text;
                        //       // updateUser(limit: limit);
                        //     },
                        //     icon: const Icon(Icons.add)),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                            },
                            child: const Text("Sign Out",
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                              ),
                            )),
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

  Future<void> updateUser({bool? switchValue,int? dailyConsumption}) {
    CollectionReference docUser = FirebaseFirestore.instance.collection('users');

    return docUser
        .doc(FirebaseAuth.instance.currentUser!.phoneNumber.toString())
        .update({'notification': switchValue,'consumptionTarget': dailyConsumption})
        .then((value) {
      print("User Updated");
    })
        .catchError((error) => print("Failed to update user: $error"));
  }

}

// Don't delete this commented code
/*
Switch(
value: switchValue,
onChanged: (value) {
setState(() {
switchValue = value;
updateUser(
switchValue: switchValue, dailyConsumption: dailyConsumption);
print(value);
});
if (value) {
print(value);
// Switch is turned on
requestNotificationPermission(context);
notificationsServices.initialiseNotificationS();
notificationsServices.scheduleNotification(
"Drink Water", "Have you had any water yet?");
} else {
print(value);
// Switch is turned off
notificationsServices.initialiseNotificationS();
notificationsServices.stopNotification();
}
})
 */
