import 'dart:async';
import 'package:counselling/constants.dart';
import 'package:counselling/screen/auth/userType/usertype_screen.dart';
import 'package:counselling/screen/auth/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:mec/constants.dart';



class SplashScreen extends StatefulWidget {
  //final Color backgroundColor = Colors.white;
  //final NotificationAppLaunchDetails? notificationAppLaunchDetails;
  const SplashScreen({Key? key, }) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 1; // delay for 5 seconds

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => UserType()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
     // backgroundColor: primaryColor,
      backgroundColor: lightblueColor,//primaryColor,

      body: Container(
        width: size.width,
        height: size.height,
        decoration: new BoxDecoration(

          // gradient: LinearGradient(begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   stops: [
          //   0.1,
          //   0.9
          // ], colors: [
          //   lightRedColor,
          //   darkRedColor
          // ],
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('assets/images/logo.png', fit: BoxFit.scaleDown,)),

            SizedBox(
              height: 10,),
            Text('Tashil\nCareer Guidance', style: TextStyle(color: primaryColor,fontFamily: fontFamilyBold,fontSize: 32),textAlign: TextAlign.center),


          ],
        ),
      ),
    );
  }
}
