import 'package:flutter/material.dart';
import 'package:counselling/constants.dart';
import 'package:counselling/screen/auth/login/login_screen.dart';
import 'package:counselling/screen/auth/welcome/welcome_screen.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColorLight,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   stops: [0.0, 1.0],
            //   colors: [
            //     darkRedColor,
            //     lightRedColor,
            //
            //   ],
            // ),

            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: 170,
                  ),
                ),

                Container(
                  color: buttonColor,
                  height: 160,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Center(
                      child: Text('WELCOME TO\nTashil Career Guidance'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: fontFamilyBold,
                              fontSize: 22),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.scaleDown,
                  height: size.height * 0.15,
                  width: size.width * 0.7,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(width: 0.5,color: Colors.black),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    darkRedColor,
                    lightRedColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(size.width * 0.8, 50)),
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen(
                                  userType: 'Admin',
                                )));

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginScreen()),
                    // );
                  },
                  child: Text('Admin', style: buttonStyle)),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                // ],
                border: Border.all(color: Colors.white, width: 0.2),
                // color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    darkRedColor,
                    lightRedColor,
                  ],
                ),
                // color: Colors.deepPurple.shade300,
                borderRadius: BorderRadius.circular(0),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(size.width * 0.8, 50)),
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen(
                                  userType: 'Users',
                                )));

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignUpScreen()),
                    // );
                  },
                  child: Text('User',
                      style: buttonStyle.copyWith(color: Colors.white))),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(width: 0.5,color: Colors.black),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    darkRedColor,
                    lightRedColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(size.width * 0.8, 50)),
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen(
                                  userType: 'Counselor',
                                )));

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginScreen()),
                    // );
                  },
                  child: Text('Guidance Counselor', style: buttonStyle)),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(width: 0.5,color: Colors.black),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    darkRedColor,
                    lightRedColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    minimumSize:
                    MaterialStateProperty.all(Size(size.width * 0.8, 50)),
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen(
                              userType: 'Company',
                            )));

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginScreen()),
                    // );
                  },
                  child: Text('Company', style: buttonStyle)),
            ),
          ],
        ),
      ),
    );
  }
}
