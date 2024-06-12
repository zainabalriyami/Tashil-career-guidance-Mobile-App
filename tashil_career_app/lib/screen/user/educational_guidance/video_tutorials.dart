

import 'package:counselling/constants.dart';
import 'package:counselling/screen/user/educational_guidance/youtube_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoTutorials extends StatefulWidget {
  const VideoTutorials({super.key});

  @override
  State<VideoTutorials> createState() => _VideoTutorialsState();
}

class _VideoTutorialsState extends State<VideoTutorials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Video Tutorials',
          style:
          TextStyle(color: Colors.white, fontFamily: fontFamilyRegular),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GridView.count(crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.black
                          ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) =>
                            YoutubeVideoScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 100),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/youtube.png",
                          height: 50,
                          width: 50,),
                      )
                    ],
                  ),
                ),


              ],
            ),
          ),)
        ],
      ),
    );
  }
}
