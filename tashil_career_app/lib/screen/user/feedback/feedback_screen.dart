

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  var _topicController = TextEditingController();
  var _feedbackController = TextEditingController();
  String userId = "";


  List<String> topicDropDownItems = [
    "Educational Guidance",
    "Registration Guidance",
    "Universities",
    "Colleges"
  ];

  getUserDetails() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();

    userId = prefs.getString("userId") ?? "";
  }


  @override
  void initState() {
      getUserDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: buttonColor,
        centerTitle: true,
        title: Text('Feedback',
        style: TextStyle(
          color: Colors.white,
          fontFamily: fontFamilyRegular
        ),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height*0.05,
          ),

          Container(
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            //  color: Colors.white,
            margin: EdgeInsets.only(left: 16,right: 16,bottom: 0),
            child: Stack(
              children: [
                TextFormField(
                  controller: _topicController,
                  keyboardType: TextInputType.name,
                  enabled: false,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: fontFamilyRegular,
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
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: darkGreyTextColor1, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.white,
                    hintText: "Select Topic",

                    //make hint text
                    hintStyle: TextStyle(
                      color: buttonColor,
                      fontSize: 16,
                      fontFamily: fontFamilyRegular,
                      fontWeight: FontWeight.w400,
                    ),

                  ),
                ),
                SizedBox(
                  width: size.width * 0.7,
                  child: DropdownButton<
                      String>(
                    icon: Container(),
                    underline:
                    Container(),
                    items: topicDropDownItems.map<
                        DropdownMenuItem<
                            String>>((String
                    value) {
                      return DropdownMenuItem<
                          String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              color: Colors
                                  .black,
                              fontSize:
                              16.0,
                              fontFamily:
                              fontFamilyRegular),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _topicController
                            .text =
                            value ??
                                "";
                      });
                    },
                  ),
                ),

              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            //  color: Colors.white,
            margin: EdgeInsets.only(left: 16,right: 16,top: 20, bottom: 20),
            height: size.height * 0.4,
            child: TextFormField(
              controller: _feedbackController,
              keyboardType: TextInputType.name,
              maxLines: 10,
              style: TextStyle(
                fontSize: 16,
                fontFamily: fontFamilyRegular,
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
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: darkGreyTextColor1, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
                hintText: "Give your feedback here..",

                //make hint text
                hintStyle: TextStyle(
                  color: buttonColor,
                  fontSize: 14,
                  fontFamily: fontFamilyRegular,
                  fontWeight: FontWeight.w400,
                ),

              ),
            ),
          ),
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
                    sendFeedback();
                  }, child: Text('Send', style: buttonStyle)),
            ),
          ),

        ],
      ),
    );
  }

  void sendFeedback() {

    if(_topicController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const  SnackBar(
              content:  Text('Please select topic of feedback.')));
    }
    else if(_feedbackController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const  SnackBar(
              content:  Text('Please select enter some feedback.')));
    }
    else {
      FirebaseFirestore.instance
          .collection("Feedback")
          .doc()
          .set({
        "topic": _topicController.text.toString(),
        "feedback": _feedbackController.text.toString(),
        "userId": userId

      }).then((value) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const  SnackBar(
                content:  Text('Feedback sent.')));
      });
    }
  }
}
