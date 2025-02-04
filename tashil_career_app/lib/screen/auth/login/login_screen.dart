

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling/model/firebase_auth.dart';
import 'package:counselling/model/input_validator.dart';
import 'package:counselling/screen/admin/adminHomeScreen/admin_home_screen.dart';
//import 'package:counselling/screen/admin/adminHomeScreen/admin_home_screen.dart';
import 'package:counselling/screen/auth/signUp/sign_up_screen.dart';
import 'package:counselling/screen/company/company_home_screen.dart';
// import 'package:counselling/screen/bottomNavBar/app_bottom_nav_bar_screen.dart';
// import 'package:counselling/screen/doctor/doctorHome/doctor_home_screen.dart';
import 'package:counselling/screen/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:counselling/screen/counselor/counselorHome/approval_screen.dart';
import 'package:counselling/screen/counselor/counselorHome/counselor_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:counselling/constants.dart';


class LoginScreen extends StatefulWidget {
  final String userType;
  const LoginScreen({Key? key, required this.userType}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isVisible = false;
  MethodsHandler _methodsHandler = MethodsHandler();
  InputValidator _inputValidator = InputValidator();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String isCreated = '',status = '';
  String isCreatedStudent = '';

  @override
  void initState() {
    print('Admin ${widget.userType}');
    setState(() {



      isCreated = '';
      isCreatedStudent = '';
      _isVisible = false;
      _isLoading = false;
    });
    print('userType');
    print(widget.userType.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
     backgroundColor: lightblueColor,
      //resizeToAvoidBottomInset: false,
      body:   SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child:Stack(children: <Widget>[ //stack overlaps widgets
                  Opacity( //semi red clippath with more height and with 0.5 opacity
                    opacity: 0.5,
                    child: ClipPath(
                      clipper:WaveClipper(), //set our custom wave clipper
                      child:Container(
                        color:primaryColor,
                        height:200,
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Container(
                        width: size.width,
                      //  color: primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 16,top: 50),
                            child: Container(
                              width: size.width*0.55,
                              child: Row(
                                children: [
                                  IconButton(onPressed: (){
                                    Navigator.of(context).pop();

                                  }, icon: Icon(Icons.arrow_back_ios, size: 18,color: whiteColor,)),
                                  widget.userType == "Admin" ? Container() :         Container(
                                    width: size.width*0.4,
                                    child: Text(


                                      'Already Have an Account?',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,

                                          fontWeight: FontWeight.w700),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),



                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 16,top: 50),
                            child: Image.asset('assets/images/user.png',height: 80,),
                          ),


                        ],),
                      ),
                      // ClipPath(  //upper clippath with less height
                      //   clipper:WaveClipper(), //set our custom wave clipper.
                      //   child:Container(
                      //     padding: EdgeInsets.only(bottom: 80),
                      //     color:primaryColor,
                      //     height:140,
                      //     alignment: Alignment.center,
                      //     child:            Text('Sign in', style: TextStyle(color: Colors.white,fontFamily: fontFamilyBold,fontSize: 22),textAlign: TextAlign.center),
                      //
                      //   ),
                      // ),
                    ],
                  ),
                ],)
            ),



            SizedBox(
              height: size.height*0.03,
            ),

            Container(
              decoration: BoxDecoration(
                  // color: primaryColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)
                  )
              ),
              child: Column(
                children: [





                  SizedBox(
                    height: size.height*0.05,
                  ),

                  Container(
                    decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                  //  color: Colors.white,
                    margin: EdgeInsets.only(left: 16,right: 16,bottom: 0),
                    child: TextFormField(
                      controller: _emailAddressController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,

                      ),
                      onChanged: (value) {
                        // setState(() {
                        //   userInput.text = value.toString();
                        // });
                      },
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(top: 15,bottom: 15),
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        focusColor: Colors.white,
                        //add prefix icon

                        // errorText: "Error",

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: darkGreyTextColor1, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        fillColor: Colors.white,
                        hintText: "Email",

                        //make hint text
                        hintStyle: TextStyle(
                          color: buttonColor,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    margin: EdgeInsets.only(left: 16,right: 16,top: 0),
                    child: TextFormField(
                      autofocus: true,
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        // setState(() {
                        //   userInput.text = value.toString();
                        // });
                      },
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(top: 15,bottom: 15),
                        focusColor: Colors.white,
                        //add prefix icon
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                        // errorText: "Error",

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: darkGreyTextColor1, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        fillColor: Colors.grey,
                        hintText: "Password",


                        //make hint text
                        hintStyle: TextStyle(
                          color: buttonColor,
                          fontSize: 16,
                          fontFamily: "verdana_regular",
                          fontWeight: FontWeight.w400,
                        ),

                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height*0.05,
                  ),

                  _isLoading
                      ? CircularProgressIndicator(
                    color: buttonColor,
                    strokeWidth: 2,
                  )
                      :

                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    child: Container(

                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                        ],
                        border: Border.all(color: Colors.white.withOpacity(0.5)),
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
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(Size(size.width, 50)),
                            backgroundColor:
                            MaterialStateProperty.all(buttonColor),
                            // elevation: MaterialStateProperty.all(3),
                            shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                          ),

                          onPressed: () async {

                            // if(widget.userType == 'Counselor') {
                            //   Navigator.pushReplacement(
                            //     context,
                            //     PageRouteBuilder(
                            //       pageBuilder: (c, a1, a2) =>
                            //           CounselorHomeScreen(),
                            //       transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                            //       transitionDuration: Duration(milliseconds: 100),
                            //     ),
                            //   );
                            // } else {
                            //   Navigator.pushReplacement(
                            //     context,
                            //     PageRouteBuilder(
                            //       pageBuilder: (c, a1, a2) =>
                            //           HomeScreen(),
                            //       transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                            //       transitionDuration: Duration(milliseconds: 100),
                            //     ),
                            //   );
                            // }



                            print(_emailAddressController.text);
                            print(_passwordController.text);
                            print(widget.userType.toString());
                            if (_inputValidator
                                .validateEmail(_emailAddressController.text) !=
                                'success' &&
                                _emailAddressController.text.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const  SnackBar(
                                      content:  Text('Wrong email, please use a correct email')
                                  )
                              );
                            }

                            else {
                              if (_emailAddressController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const  SnackBar(
                                        content:  Text('Enter Email Address')
                                    )
                                );
                              }
                              else if (_passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const  SnackBar(
                                        content:  Text('Enter Password')
                                    )
                                );
                              }
                              else {
                                setState(() {
                                  _isLoading = true;
                                });
                                SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                                try {
                                  if (widget.userType == 'Users') {
                                    final snapshot = await FirebaseFirestore.instance.collection('Users').get();
                                    snapshot.docs.forEach((element) {
                                      print('user data');
                                      if(element['email'] == _emailAddressController.text.toString().trim()) {
                                        print('user age in if of current user ');
                                        //   print(element['age']);
                                        setState(() {
                                          isCreated = 'yes';
                                        });
                                      }
                                    });

                                    if(isCreated == 'yes') {
                                      final result =
                                      await _auth.signInWithEmailAndPassword(
                                          email: _emailAddressController.text
                                              .trim()
                                              .toString(),
                                          password: _passwordController.text);
                                      final user = result.user;

                                      prefs.setString(
                                          'userEmail', _emailAddressController.text);
                                      prefs.setString(
                                          'userPassword', _passwordController.text);
                                      prefs.setString('userId', user!.uid);
                                      prefs.setString('userType', widget.userType.toString());
                                      print('Account creation successful');
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (c, a1, a2) =>
                                              HomeScreen(),
                                          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                          transitionDuration: Duration(milliseconds: 100),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const  SnackBar(
                                              content:  Text('Successfully Login')
                                          )
                                      );
                                    }
                                    else {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      _methodsHandler.showAlertDialog(
                                          context, 'Sorry', 'User Not Found');
                                    }
                                  }
                                  else  if (widget.userType == 'Counselor') {
                                    final snapshot = await FirebaseFirestore.instance.collection('Counselor').get();
                                    snapshot.docs.forEach((element) {
                                      print('user data');
                                      if(element['email'] == _emailAddressController.text.toString().trim()) {
                                        setState(() {
                                          isCreated = 'yes';
                                          status = element['status'];
                                        });
                                      }
                                    });

                                    if(isCreated == 'yes') {
                                      final result =
                                      await _auth.signInWithEmailAndPassword(
                                          email: _emailAddressController.text
                                              .trim()
                                              .toString(),
                                          password: _passwordController.text);
                                      final user = result.user;

                                      prefs.setString(
                                          'userEmail', _emailAddressController.text);
                                      prefs.setString(
                                          'userPassword', _passwordController.text);
                                      prefs.setString('userId', user!.uid);
                                      prefs.setString('userType', widget.userType.toString());
                                      setState(() {
                                        _isLoading = false;
                                      });

                                      if(status == 'Confirmed' ) {

                                        Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (c, a1, a2) =>
                                                CounselorHomeScreen(),
                                            transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                            transitionDuration: Duration(milliseconds: 100),
                                          ),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            const  SnackBar(
                                                content:  Text('Successfully Login')
                                            )
                                        );

                                      } else {
                                        Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (c, a1, a2) =>
                                                ApprovalScreen(),
                                            transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                            transitionDuration: Duration(milliseconds: 100),
                                          ),
                                        );

                                        ScaffoldMessenger.of(context).showSnackBar(
                                            const  SnackBar(
                                                content:  Text('Sorry, your approval is pending')
                                            )
                                        );

                                      }



                                    }
                                    else {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      _methodsHandler.showAlertDialog(
                                          context, 'Sorry', 'User Not Found');
                                    }
                                  }

                                 else if (widget.userType == 'Company') {
                                    final snapshot = await FirebaseFirestore.instance.collection('Company').get();
                                    snapshot.docs.forEach((element) {
                                      print('user data');
                                      if(element['email'] == _emailAddressController.text.toString().trim()) {
                                        print('user age in if of current user ');
                                        //   print(element['age']);
                                        setState(() {
                                          isCreated = 'yes';
                                        });
                                      }
                                    });

                                    if(isCreated == 'yes') {
                                      final result =
                                      await _auth.signInWithEmailAndPassword(
                                          email: _emailAddressController.text
                                              .trim()
                                              .toString(),
                                          password: _passwordController.text);
                                      final user = result.user;

                                      prefs.setString(
                                          'userEmail', _emailAddressController.text);
                                      prefs.setString(
                                          'userPassword', _passwordController.text);
                                      prefs.setString('userId', user!.uid);
                                      prefs.setString('userType', widget.userType.toString());
                                      print('Account creation successful');
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (c, a1, a2) =>
                                              CompanyHomeScreen(),
                                          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                          transitionDuration: Duration(milliseconds: 100),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          const  SnackBar(
                                              content:  Text('Successfully Login')
                                          )
                                      );
                                    }
                                    else {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      _methodsHandler.showAlertDialog(
                                          context, 'Sorry', 'User Not Found');
                                    }
                                  }

                                  else {
                                    if (widget.userType == 'Admin' && _emailAddressController.text == 'admin@gmail.com' && _passwordController.text == '12345678') {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      prefs.setString(
                                          'userEmail', _emailAddressController.text);
                                      prefs.setString(
                                          'userPassword', _passwordController.text);
                                      print(widget.userType.toString());
                                      prefs.setString('userType', 'Admin');

                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (c, a1, a2) => AdminHomeScreen(),
                                          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                          transitionDuration: Duration(milliseconds: 100),
                                        ),
                                      );


                                    } else {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      _methodsHandler.showAlertDialog(
                                          context, 'Sorry', 'User Not Found');
                                    }


                                  }


                                }
                                on FirebaseAuthException catch (e)
                                {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  print(e.code);
                                  switch (e.code) {
                                    case 'invalid-email':
                                      _methodsHandler.showAlertDialog(context,
                                          'Sorry', 'Invalid Email Address');

                                      setState(() {
                                        _isLoading = false;
                                      });
                                      break;
                                    case 'wrong-password':
                                      _methodsHandler.showAlertDialog(
                                          context, 'Sorry', 'Wrong Password');
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      break;
                                    case 'user-not-found':
                                      _methodsHandler.showAlertDialog(
                                          context, 'Sorry', 'User Not Found');
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      break;
                                    case 'user-disabled':
                                      _methodsHandler.showAlertDialog(
                                          context, 'Sorry', 'User Disabled');
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      break;
                                  }
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }

                              }
                            }


                          }, child: Text('Login', style: buttonStyle)),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  widget.userType == "Admin" ? Container() :
                  Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen(userType: widget.userType,)),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("FORGET PASSWORD? ", style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w500),),
                          ],),
                      )
                  ),

                  SizedBox(
                    height: size.height*0.05,
                  ),
                  widget.userType == "Admin" ? Container() :
                  Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen(userType: widget.userType,)),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("OR ", style: TextStyle(color: primaryColor, fontSize: 15,fontWeight: FontWeight.w500),),
                          ],),
                      )
                  ),

                  SizedBox(
                    height: size.height*0.05,
                  ),

                  widget.userType == "Admin" ? Container() :
                  Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen(userType: widget.userType,)),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New Here? ", style: TextStyle(color: primaryColor, fontSize: 15,fontWeight: FontWeight.w500),),
                          ],),
                      )
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                  widget.userType == "Admin" ? Container() :
                  Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen(userType: widget.userType,)),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Register Now ", style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w500),),
                          ],),
                      )
                  ),

                ],
              ),

            ),


          ],),
      ),
    );
  }
}


class MyWaveClipper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Container(
            child:Stack(children: <Widget>[ //stack overlaps widgets
              Opacity( //semi red clippath with more height and with 0.5 opacity
                opacity: 0.5,
                child: ClipPath(
                  clipper:WaveClipper(), //set our custom wave clipper
                  child:Container(
                    color:Colors.lightBlue,
                    height:200,
                  ),
                ),
              ),

              ClipPath(  //upper clippath with less height
                clipper:WaveClipper(), //set our custom wave clipper.
                child:Container(
                    padding: EdgeInsets.only(bottom: 50),
                    color:Colors.lightBlueAccent,
                    height:180,
                    alignment: Alignment.center,
                    child: Text("Wave clipper", style: TextStyle(
                      fontSize:18, color:Colors.white,
                    ),)
                ),
              ),
            ],)
        )
    );
  }
}

class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = new Path();
    path.lineTo(0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}