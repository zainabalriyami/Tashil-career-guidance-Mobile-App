import 'package:counselling/screen/user/educational_guidance/faqs_screen.dart';
import 'package:counselling/screen/user/educational_guidance/resourcce_libraries_screen.dart';
import 'package:counselling/screen/user/educational_guidance/tips_and_hints_screen.dart';
import 'package:counselling/screen/user/educational_guidance/video_tutorials.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EducationalGuidanceScreen extends StatefulWidget {
  const EducationalGuidanceScreen({super.key});

  @override
  State<EducationalGuidanceScreen> createState() =>
      _EducationalGuidanceScreenState();
}

class _EducationalGuidanceScreenState extends State<EducationalGuidanceScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: buttonColor,
        centerTitle: true,
        title: Text(
          'Educational Guidance',
          style: TextStyle(color: Colors.white, fontFamily: fontFamilyRegular),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          SizedBox(
              height: size.height * 0.61,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.1,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) =>
                                    FAQsScreen(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 100),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                              color: Colors.white,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  twoColor1,
                                  twoColor,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.4),
                                  spreadRadius: 1.2,
                                  blurRadius: 0.8,
                                  offset:
                                      Offset(0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Container(
                                  child: Image.asset(
                                    "assets/images/questions.png",
                                    fit: BoxFit.scaleDown,
                                    height: 60,
                                    width: 60,
                                  ),
                                )),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Center(
                                  child: Text(
                                    "Help Center and\nFAQs",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: whiteColor,
                                      fontFamily: fontFamilyBold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) =>
                                    TipsAndHintsScreen(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 100),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                              color: Colors.white,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  twoColor1,
                                  twoColor,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.4),
                                  spreadRadius: 1.2,
                                  blurRadius: 0.8,
                                  offset:
                                  Offset(0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Container(
                                      child: Image.asset(
                                        "assets/images/tips.png",
                                        fit: BoxFit.scaleDown,
                                        height: 60,
                                        width: 60,
                                      ),
                                    )),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Center(
                                  child: Text(
                                    "Tips and Hints",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: whiteColor,
                                      fontFamily: fontFamilyBold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) =>
                                    VideoTutorials(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 100),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                              color: Colors.white,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  twoColor1,
                                  twoColor,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.4),
                                  spreadRadius: 1.2,
                                  blurRadius: 0.8,
                                  offset:
                                  Offset(0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Container(
                                      child: Image.asset(
                                        "assets/images/tutorials.png",
                                        fit: BoxFit.scaleDown,
                                        height: 60,
                                        width: 60,
                                      ),
                                    )),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Center(
                                  child: Text(
                                    "Video Tutorials",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: whiteColor,
                                      fontFamily: fontFamilyBold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) =>
                                    ResourceLibrariesScreen(),
                                transitionsBuilder: (c, anim, a2, child) =>
                                    FadeTransition(opacity: anim, child: child),
                                transitionDuration: Duration(milliseconds: 100),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                              color: Colors.white,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  twoColor1,
                                  twoColor,
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.4),
                                  spreadRadius: 1.2,
                                  blurRadius: 0.8,
                                  offset:
                                  Offset(0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Container(
                                      child: Image.asset(
                                        "assets/images/online-library.png",
                                        fit: BoxFit.scaleDown,
                                        height: 60,
                                        width: 60,
                                      ),
                                    )),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Center(
                                  child: Text(
                                    "Resource Libraries",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: whiteColor,
                                      fontFamily: fontFamilyBold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]))),
        ],
      ),
    );
  }
}
