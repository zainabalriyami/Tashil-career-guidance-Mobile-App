

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling/constants.dart';
import 'package:flutter/material.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  var jobTitleController = TextEditingController();
  var jobDescriptionController = TextEditingController();

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
        title: Text('Post Job',
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
            child: TextFormField(
              controller: jobTitleController,
              keyboardType: TextInputType.name,
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
                hintText: "Job Title",

                //make hint text
                hintStyle: TextStyle(
                  color: buttonColor,
                  fontSize: 16,
                  fontFamily: fontFamilyRegular,
                  fontWeight: FontWeight.w400,
                ),

              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            //  color: Colors.white,
            margin: EdgeInsets.only(left: 16,right: 16,top: 20, bottom: 0),
            height: size.height * 0.4,
            child: TextFormField(
              controller: jobDescriptionController,
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
                hintText: "Job Description",

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
                    postJob();
                  }, child: Text('Post', style: buttonStyle)),
            ),
          ),

        ],
      ),
    );
  }

  void postJob() {

    if(jobTitleController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const  SnackBar(
              content:  Text('Please enter job title.')));
    }
    else if(jobDescriptionController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const  SnackBar(
              content:  Text('Please enter job description.')));
    }
    else {
      FirebaseFirestore.instance
          .collection("Jobs")
          .doc()
          .set({
        "title": jobTitleController.text.toString(),
        "description": jobDescriptionController.text.toString(),

      }).then((value) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const  SnackBar(
                content:  Text('Job posted.')));
      });
    }
  }

}
