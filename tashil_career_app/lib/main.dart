import 'package:counselling/screen/company/company_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:counselling/screen/admin/adminHomeScreen/admin_home_screen.dart';
import 'package:counselling/screen/home/home_screen.dart';
import 'package:counselling/screen/counselor/counselorHome/counselor_home_screen.dart';
import 'package:counselling/splash/splash_screen.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.length == 0) {


    if (Platform.isIOS) {
      // await Firebase.initializeApp(
      //     options: FirebaseOptions(apiKey: 'AIzaSyAFFk4hXMpio9X_Gz0wVCQvk4a5QAzllXM',
      //         appId: '1:97089701565:android:02972d723ec132a52119d4',
      //         messagingSenderId: '97089701565',
      //         storageBucket:  "agriculture-store-flutter.appspot.android",
      //         projectId: 'agriculture-store-flutter')
      // );
    }
    else {
      await Firebase.initializeApp(
        name: "Tashil Career Guidance Android App",
          options: FirebaseOptions(apiKey: 'AIzaSyCq5HUe7uIeFCcTmbd1fMTmF-RPWz5Hc1o',
            appId: '1:269551174100:android:b8c7d07e099ea300925641',
            messagingSenderId: '269551174100',
            projectId: 'tashil-counselling',
            storageBucket:  "tashil-counselling.appspot.android",
          )
      );
    }

  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  String userType = '',email = '', uid = '';



  getData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Starting usertype ' + prefs.getString('userType').toString());
    if(prefs.getString('userType') != null) {
      setState(() {
        userType = prefs.getString('userType')!;
        email = prefs.getString('userEmail')!;
        // uid = prefs.getString('userId')!;
      });
      print(userType.toString() + ' This is user type');
    } else {
      print('Starting usertype');
    }


  }
  @override
  void initState() {
    print('Starting usertype');

    // TODO: implement initState
    // setState(() {
    //   userType = '';
    //   email = '';
    //   uid = '';
    // });

    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tashil Career Guidance",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:    userType == 'Users' ? HomeScreen() :
      userType == 'Admin' ? AdminHomeScreen() :
      userType == 'Counselor' ? CounselorHomeScreen() :
      userType == 'Company' ? CompanyHomeScreen() :

      SplashScreen(),
    );
  }
}

