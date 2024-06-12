import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling/screen/company/post_job_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class JobPostsScreen extends StatefulWidget {
  final String? userType;

  const JobPostsScreen({super.key, this.userType});

  @override
  State<JobPostsScreen> createState() => _JobPostsScreenState();
}

class _JobPostsScreenState extends State<JobPostsScreen> {
  String userId = "";
  List<String> appliedJobIds = [];

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userId = prefs.getString('userId')!;
    });
    print(userId);
    getAppliedJobs();
  }

  getAppliedJobs() async {
    FirebaseFirestore.instance
        .collection("Applications")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['user_id'] == userId) {
          setState(() {
            appliedJobIds.add(doc['job_id']);
          });
          print(appliedJobIds[0]);
          print(true);
        }
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
          'Jobs',
          style: TextStyle(color: Colors.white, fontFamily: fontFamilyRegular),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Jobs").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              strokeWidth: 1,
              color: primaryColor,
            ));
          } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            // got data from snapshot but it is empty

            return Center(child: Text("No Data Found"));
          } else {
            return Center(
              child: Container(
                width: size.width * 0.95,
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   PageRouteBuilder(
                        //     pageBuilder: (c, a1, a2) => UserDetailScreen(
                        //       docId: snapshot.data!.docs[index].id.toString(),
                        //       userStatus: "Students",
                        //
                        //     ),
                        //     transitionsBuilder: (c, anim, a2, child) =>
                        //         FadeTransition(opacity: anim, child: child),
                        //     transitionDuration: Duration(milliseconds: 100),
                        //   ),
                        // );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 0, right: 0),
                        child: Container(
                          width: size.width * 0.95,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: primaryColor1),
                            borderRadius: BorderRadius.circular(0),
                            //color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   snapshot
                                    //       .data!
                                    //       .docs[index]
                                    //   ["name"]
                                    //       .toString() ,
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: TextStyle(
                                    //       color: secondaryColor1,
                                    //       fontSize: 13,
                                    //       fontWeight: FontWeight.w800,
                                    //       height: 1.3),
                                    // ),
                                    Text(
                                      snapshot.data!.docs[index]["title"]
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: secondaryColor1,
                                          fontSize: 16,
                                          fontFamily: fontFamilyMedium,
                                          height: 1.3),
                                    ),
                                    SizedBox(
                                      height: 07,
                                    ),
                                    Text(
                                      snapshot.data!.docs[index]["description"]
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: secondaryColor1,
                                          fontSize: 14,
                                          fontFamily: fontFamilyRegular,
                                          height: 1.3),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: widget.userType == "Company",
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text('Delete Job'),
                                          content: Text(
                                              'Do you want to delete this job?'),
                                          actions: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          fontFamilyBold)),
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(false),
                                              //return false when click on "NO"
                                              child: Text('No'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection("Jobs")
                                                    .doc(snapshot
                                                        .data!.docs[index].id)
                                                    .delete();
                                                setState(() {});
                                                Navigator.of(context).pop();
                                              },
                                              //return true when click on "Yes"
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: primaryColor,
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          fontFamilyBold)),
                                              child: Text('Yes'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Visibility(
                                    visible: widget.userType != "Company",
                                    child: InkWell(
                                      onTap: () {
                                        if (appliedJobIds.contains(
                                            snapshot.data!.docs[index].id)) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text('Apply'),
                                              content: Text(
                                                  'Do you want to apply to this job?'),
                                              actions: [
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors.red,
                                                      textStyle: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              fontFamilyBold)),
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(false),
                                                  //return false when click on "NO"
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection(
                                                            "Applications")
                                                        .doc()
                                                        .set({
                                                      "job_id": snapshot
                                                          .data!.docs[index].id,
                                                      "user_id": userId
                                                    });

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'Application submitted.')));
                                                    setState(() {});
                                                    Navigator.of(context).pop();
                                                  },
                                                  //return true when click on "Yes"
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: primaryColor,
                                                      textStyle: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              fontFamilyBold)),
                                                  child: Text('Yes'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: appliedJobIds.contains(
                                                      snapshot
                                                          .data!.docs[index].id)
                                                  ? Colors.green
                                                  : primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                          child: Text(
                                            appliedJobIds.contains(snapshot
                                                    .data!.docs[index].id)
                                                ? 'Applied'
                                                : "Apply",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: appliedJobIds.contains(
                                                        snapshot.data!
                                                            .docs[index].id)
                                                    ? Colors.green
                                                    : primaryColor,
                                                fontFamily: fontFamilySemiBold),
                                          ),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  //Container(child: Text('AdminHome'),),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: Visibility(
        visible: widget.userType == "Company",
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => PostJobScreen(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: Duration(milliseconds: 100),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
