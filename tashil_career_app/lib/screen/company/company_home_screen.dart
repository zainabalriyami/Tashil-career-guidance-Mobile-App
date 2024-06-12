

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling/constants.dart';
import 'package:counselling/screen/auth/userType/usertype_screen.dart';
import 'package:counselling/screen/company/applications_list_screen.dart';
import 'package:counselling/screen/company/job_posts_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  String name = '', email = '', uid = '', userType = '', status = '';
  String text = '';
  int current = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseFirestore.instance
        .collection('Company')
        .where('uid', isEqualTo: _auth.currentUser!.uid.toString())
        .get()
        .then((value) {
      setState(() {
        status = value.docs[0]['status'];
        name = value.docs[0]['name'];
        email = value.docs[0]['email'];
      });
    });

    setState(() {
      //userType = prefs.getString('userType')!;
      email = prefs.getString('userEmail')!;
      uid = prefs.getString('userId')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      status = '';
    });
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightblueColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    'Tashil Career Guidance',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: fontFamilySemiBold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: lightButtonGreyColor, //Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
              ),
              margin: EdgeInsets.zero,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 70,
                      width: 70,
                      fit: BoxFit.scaleDown,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontFamilyBold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 4, bottom: 4, left: 10, right: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  //<-- SEE HERE
                  side: BorderSide(width: 1, color: whiteColor),
                  borderRadius: BorderRadius.circular(0),
                ),
                tileColor: whiteColor,
                leading: Container(
                  // decoration: BoxDecoration(
                  //   gradient: LinearGradient(begin: Alignment.topRight,
                  //     end: Alignment.bottomLeft,
                  //     stops: [
                  //       0.1,
                  //       0.9
                  //     ], colors: [
                  //       lightRedColor,
                  //       darkRedColor
                  //     ],
                  //   ),
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                    width: 30,
                    height: 30,
                    //devSize.height*0.05,
                    child: Image.asset(
                      'assets/images/shutdown.png',
                      fit: BoxFit.scaleDown,
                      width: 30,
                      height: 30,
                    )

                  // Icon(
                  //   Icons.local_fire_department,
                  //   color: Colors.white,
                  //   size: 20,
                  // )

                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
                title: Text(
                  'Logout',
                ),
                onTap: () async {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  try {
                    return await _auth.signOut().whenComplete(() {
                      prefs.remove('userEmail');
                      prefs.remove('userType');
                      prefs.remove('userPassword');
                      prefs.remove('userId');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserType()));
                    });
                  } catch (e) {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            //color: primaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30))),
          child: Column(
            children: [
              Container(
                  child: Stack(
                    children: <Widget>[
                      //stack overlaps widgets
                      Opacity(
                        //semi red clippath with more height and with 0.5 opacity
                        opacity: 0.5,
                        child: Container(
                          color: primaryColor,
                          height: 130,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        color: primaryColor,
                        height: 110,
                        alignment: Alignment.center,
                        child: Text('Welcome Back Company',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: fontFamilyBold,
                                fontSize: 20),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  )),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ],
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [
                        buttonColor,
                        buttonColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                            Size(size.width, 50)),
                        backgroundColor:
                        MaterialStateProperty.all(buttonColor),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor: MaterialStateProperty.all(
                            Colors.transparent),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) =>
                                JobPostsScreen(userType: "Company"),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 100),
                          ),
                        );
                      },
                      child:
                      Text('Job Posts', style: buttonStyle)),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 4),
                          blurRadius: 5.0)
                    ],
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [
                        buttonColor,
                        buttonColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                            Size(size.width, 50)),
                        backgroundColor:
                        MaterialStateProperty.all(buttonColor),
                        // elevation: MaterialStateProperty.all(3),
                        shadowColor: MaterialStateProperty.all(
                            Colors.transparent),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (c, a1, a2) =>
                                ApplicationsScreen(userType: "Company"),
                            transitionsBuilder: (c, anim, a2, child) =>
                                FadeTransition(opacity: anim, child: child),
                            transitionDuration: Duration(milliseconds: 100),
                          ),
                        );
                      },
                      child:
                      Text('View Applications', style: buttonStyle)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
