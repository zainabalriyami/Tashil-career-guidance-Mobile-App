import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          'Support',
          style: TextStyle(color: Colors.white, fontFamily: fontFamilyRegular),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
            child: Text(
              "Please fill in the details below, our support team will contact you.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: fontFamilyRegular),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //  color: Colors.white,
            margin: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 0),
            child: TextFormField(
              controller: _nameController,
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
                  borderSide: BorderSide(color: darkGreyTextColor1, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
                hintText: "Name",

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
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //  color: Colors.white,
            margin: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontSize: 16,
                fontFamily: fontFamilyRegular,
                color: Colors.black,
              ),
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
                  borderSide: BorderSide(color: darkGreyTextColor1, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
                hintText: "Email",

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
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //  color: Colors.white,
            margin: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 0),
            height: size.height * 0.4,
            child: TextFormField(
              controller: _messageController,
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
                  borderSide: BorderSide(color: darkGreyTextColor1, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
                hintText: "Message",

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
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 5.0)
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
                    minimumSize:
                        MaterialStateProperty.all(Size(size.width, 50)),
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () async {
                    sendSupportRequest();
                  },
                  child: Text('Send', style: buttonStyle)),
            ),
          ),
        ],
      ),
    );
  }

  void sendSupportRequest() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your name.')));
    } else if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your email.')));
    } else if (_messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter some message.')));
    } else {
      FirebaseFirestore.instance.collection("Support").doc().set({
        "name": _nameController.text.toString(),
        "email": _emailController.text.toString(),
        "message": _messageController.text.toString(),
      }).then((value) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Message sent.')));
      });
    }
  }
}
