import 'package:counselling/constants.dart';
import 'package:counselling/screen/auth/userType/usertype_screen.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling/screen/company/job_posts_list_screen.dart';
import 'package:counselling/screen/user/ChatBotScreen.dart';
import 'package:counselling/screen/user/educational_guidance/educational_guidance_screen.dart';
import 'package:counselling/screen/user/feedback/feedback_screen.dart';
import 'package:counselling/screen/user/support/support_screen.dart';
import 'package:counselling/screen/user/universities/colleges_screen.dart';
import 'package:counselling/screen/user/universities/univerisities_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> pages = [
    'assets/images/casetoService.jpg',
    'assets/images/casetoService.jpg',
    'assets/images/casetoService.jpg',
  ];

  String name = '', email = '', uid = '', userType = '';
  String text = '';
  int current = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      //userType = prefs.getString('userType')!;
      email = prefs.getString('userEmail')!;
      uid = prefs.getString('userId')!;
    });

    FirebaseFirestore.instance
        .collection('Users')
        .where('uid', isEqualTo: _auth.currentUser!.uid.toString())
        .get()
        .then((value) {
      setState(() {
        name = value.docs[0]['name'];
        email = value.docs[0]['email'];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  List<Categories> items = [
    Categories(
      image: 'assets/images/loneliness.png',
      title: 'Anxiety',
      description: 'Single burger with beef',
    ),
    Categories(
      image: 'assets/images/depression.png',
      title: 'Depression',
      description: 'Single burger with beef',
    ),
    Categories(
      image: 'assets/images/anxiety.png',
      title: 'Dementia',
      description: 'Single burger with beef',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primaryColorLight,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: size.width*0.12,
              // ),
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
                    // Text(
                    //   'THERAPY & COUNSELING',
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 10,
                    //       fontWeight: FontWeight.w700),
                    // ),
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
              DrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  // gradient: LinearGradient(begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   stops: [
                  //     0.1,
                  //     0.9
                  //   ], colors: [
                  //     darkRedColor,
                  //     lightRedColor,
                  //   ],
                  // ),
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
        body: ListView(children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          CarouselSlider(
              items: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/slider_2.jpeg',
                      fit: BoxFit.cover,
                      width: size.width * 0.9,
                      height: size.height * 0.2,
                    )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/slider_3.jpeg',
                      fit: BoxFit.cover,
                      width: size.width * 0.9,
                      height: size.height * 0.2,
                    )),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/slider_1.jpeg',
                      fit: BoxFit.cover,
                      width: size.width * 0.9,
                      height: size.height * 0.2,
                    )),
              ],
              options: CarouselOptions(
                height: size.height * 0.2,
                aspectRatio: 16 / 9,
                viewportFraction: 0.99,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              )),
          // AnimatedSmoothIndicator(
          //   activeIndex: current,
          //   count: 3, //pages.length,
          //   effect: const JumpingDotEffect(
          //       dotHeight: 10,
          //       dotWidth: 10,
          //       jumpScale: .7,
          //       verticalOffset: 20,
          //       activeDotColor: darkPeachColor,
          //       dotColor: Colors.grey),
          // ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
            height: size.height * 0.9,
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
                              EducationalGuidanceScreen(),
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
                            offset: Offset(0, 0), // changes position of shadow
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
                              "assets/images/education_guidance.png",
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
                              "Educational\nGuidance",
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
                  Container(
                    //width: size.width * 0.3,
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
                          offset: Offset(0, 0), // changes position of shadow
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
                            "assets/images/registraion_guidance.png",
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
                            "Registration\nGuidance",
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => ChatBotScreen(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 100),
                        ),
                      );
                    },
                    child: Container(
                      //width: size.width * 0.3,
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
                            offset: Offset(0, 0), // changes position of shadow
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
                                  "assets/images/ai_bot.png",
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
                              "Chatbot",
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
                          pageBuilder: (c, a1, a2) => SupportScreen(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 100),
                        ),
                      );
                    },
                    child: Container(
                      //width: size.width * 0.3,
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
                            offset: Offset(0, 0), // changes position of shadow
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
                              "assets/images/support.png",
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
                              "Support",
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
                          pageBuilder: (c, a1, a2) => FeedbackScreen(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 100),
                        ),
                      );
                    },
                    child: Container(
                      //width: size.width * 0.3,
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
                            offset: Offset(0, 0), // changes position of shadow
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
                              "assets/images/feedback.png",
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
                              "Feedback",
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
                          pageBuilder: (c, a1, a2) => JobPostsScreen(
                            userType: "Users",
                          ),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 100),
                        ),
                      );
                    },
                    child: Container(
                      //width: size.width * 0.3,
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
                            offset: Offset(0, 0), // changes position of shadow
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
                              "assets/images/job.png",
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
                              "Job Posts",
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
                          pageBuilder: (c, a1, a2) => UniversitiesScreen(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 100),
                        ),
                      );
                    },
                    child: Container(
                      //width: size.width * 0.3,
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
                            offset: Offset(0, 0), // changes position of shadow
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
                              "assets/images/university.png",
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
                              "Universities",
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
                          pageBuilder: (c, a1, a2) => CollegesScreen(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 100),
                        ),
                      );
                    },
                    child: Container(
                      //width: size.width * 0.3,
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
                            offset: Offset(0, 0), // changes position of shadow
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
                              "assets/images/college.png",
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
                              "Colleges",
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
                ],
              ),
            ),
          ),
        ]));
  }
}

class Categories {
  final String image;
  final String title;
  final String description;

  Categories({
    required this.image,
    required this.title,
    required this.description,
  });
}
