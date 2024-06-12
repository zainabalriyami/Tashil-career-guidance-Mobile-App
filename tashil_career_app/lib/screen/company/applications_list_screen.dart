import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling/screen/company/post_job_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class ApplicationsScreen extends StatefulWidget {
  final String? userType;

  const ApplicationsScreen({super.key, this.userType});

  @override
  State<ApplicationsScreen> createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {
  String userId = "";
  List<String> appliedJobIds = [];
  Map<String, String> jobDetails = {};
  List<ModelApplication> jobApplications = [];
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userId = prefs.getString('userId')!;
    });
    print(userId);
    getApplicants();
  }

  getApplicants() async {
    FirebaseFirestore.instance
        .collection("Jobs")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((jobDocument) {

        FirebaseFirestore.instance
            .collection("Applications")
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((applicationDocument) {
            if(jobDocument.id == applicationDocument["job_id"]) {
              ModelApplication modelApplication = ModelApplication();
              modelApplication.jobTitle = jobDocument["title"];
              modelApplication.jobDescription = jobDocument["description"];
              modelApplication.applicants = [];
              FirebaseFirestore.instance
                  .collection("Users")
                  .get()
                  .then((QuerySnapshot querySnapshot) {
                querySnapshot.docs.forEach((userDoc) {
                  if(applicationDocument["user_id"] == userDoc["uid"]){
                    ModelUsers modelUsers = ModelUsers();
                    modelUsers.name = userDoc["name"];
                    modelUsers.email = userDoc["email"];
                    modelUsers.phone = userDoc["phone"];

                    modelApplication.applicants?.add(modelUsers);
                    setState(() {
                      jobApplications.add(modelApplication);
                    });
                  }
                });
              });
            }
          });
        });

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
          'Applications',
          style: TextStyle(color: Colors.white, fontFamily: fontFamilyRegular),
        ),
      ),
      body:
     Center(
              child: Container(
                width: size.width * 0.95,
                child: ListView.builder(
                  itemCount: jobApplications.length,
                  itemBuilder: (context, index) {

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
                        child: Column(
                          children: [
                            Container(
                              width: size.width * 0.95,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: primaryColor1),
                                borderRadius: BorderRadius.circular(0),
                                //color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Job Details",
                                          style: TextStyle(
                                              color: primaryColor, fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(
                                          height: 1,
                                          color: primaryColor.withOpacity(0.1),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Job Title: " +
                                              (jobApplications[index].jobTitle ?? ""),                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 16,
                                              fontFamily: fontFamilyMedium,
                                              height: 1.3),
                                        ),
                                        SizedBox(
                                          height: 07,
                                        ),
                                        Text(
                                          "Job Description: " +
                                              (jobApplications[index].jobDescription ?? ""),                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 14,
                                              fontFamily: fontFamilyRegular,
                                              height: 1.3),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: size.width * 0.95,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.5, color: primaryColor),
                                borderRadius: BorderRadius.circular(0),
                                //color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Applicants",
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      height: 0.4,
                                      color: primaryColor.withOpacity(0.1),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 65,
                                      child: ListView.builder(
                                          itemCount: jobApplications[index].applicants?.length,
                                          itemBuilder: (context, i) {

                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Name: " +
                                                    (jobApplications[index].applicants?[i].name ?? ""),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontFamily: fontFamilyMedium,
                                                    height: 1.3),
                                              ),
                                              SizedBox(
                                                height: 05,
                                              ),
                                              Text(
                                                "Email: " +
                                                    (jobApplications[index].applicants?[i].email ?? ""),                                      overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontFamily: fontFamilyMedium,
                                                    height: 1.3),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Phone: " +
                                                    (jobApplications[index].applicants?[i].phone ?? ""),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontFamily: fontFamilyMedium,
                                                    height: 1.3),
                                              ),
                                              SizedBox(
                                                height: 05,
                                              ),
                                              Divider(height: 1,
                                              color: primaryColor.withOpacity(0.3),),
                                              SizedBox(
                                                height: 05,
                                              ),
                                            ],
                                          );
                                        }
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  //Container(child: Text('AdminHome'),),
                ),
              ),
            )
    );
  }

  Map<String, String> getJobDetails(document) {
    Map<String, String> data = {};
    FirebaseFirestore.instance
        .collection("Jobs")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc.id == document) {
          data = {
            "title": doc["title"].toString(),
            "description": doc["description"].toString()
          };
        }
      });
      setState(() {});
      return data;
    });
    return {"title": "abc", "description": "abc"};
  }

  Map<String, String> getApplicantDetails(String userId) {
    Map<String, String> data = {};

    FirebaseFirestore.instance
        .collection("Users")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if (doc['uid'] == userId) {
          data = {
            "name": doc["name"].toString(),
            "email": doc["email"].toString(),
            "phone": doc["phone"].toString(),
          };
        }
      });
    });
    return data;
  }
}

class ModelApplication {
  String? jobTitle;
  String? jobDescription;
  List<ModelUsers>? applicants;
}

class ModelUsers {
  String? name;
  String? email;
  String? phone;
}
