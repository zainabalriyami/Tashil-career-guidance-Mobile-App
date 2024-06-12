import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counselling/screen/admin/adminCounselors/admin_counselors_screen.dart';
import 'package:counselling/screen/admin/adminFeedback/admin_feedback_screen.dart';
import 'package:flutter/material.dart';
import 'package:counselling/constants.dart';
import 'package:counselling/screen/admin/adminUsersScreen/admin_users_screen.dart';
import 'package:counselling/screen/auth/userType/usertype_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AdminHomeScreen extends StatefulWidget {

  const AdminHomeScreen({Key? key,}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  List<String> categories = [];

  int y=0;
  String name = '' , email = '',
      uid = '',
      users = '',
      counselors = '',
      products = '',
      category = '';
  String text = '';
 // final FirebaseAuth _auth = FirebaseAuth.instance;
  String subject = '';
 // MethodsHandler _methodsHandler = MethodsHandler();
  bool isloading = true;

  List<Product> _categories = [

    // Product(
    //     title: 'Appointments',
    //     sale: 'Sale',
    //     isNew: '',
    //     quantity: '330g',
    //     ruppes: 'AED3.81',
    //     addToCart: 0,
    //     id: '',
    //     favorite: false,
    //     image: 'assets/images/calendar.png'),
    Product(
      title: 'Users',
      addToCart: 0,
      sale: 'Sale',
      isNew: '',
      id: '',
      quantity: '330g',
      ruppes: 'AED3.81',
      image: 'assets/images/user.png',
      favorite: false,
    ),
    Product(
      title: 'Guidance Counselors',
      addToCart: 0,
      sale: 'Sale',
      isNew: '',
      id: '',
      quantity: '330g',
      ruppes: 'AED3.81',
      image: 'assets/images/counselor.png',
      favorite: false,
    ),
    Product(
      title: 'Feedback',
      addToCart: 0,
      sale: 'Sale',
      isNew: '',
      id: '',
      quantity: '330g',
      ruppes: 'AED3.81',
      image: 'assets/images/feedback.png',
      favorite: false,
    ),

    Product(
      title: 'Logout',
      addToCart: 0,
      sale: 'Sale',
      isNew: '',
      id: '',
      quantity: '330g',
      ruppes: 'AED3.81',
      image: 'assets/images/shutdown.png',
      favorite: false,
    ),
  ];



  getData() {

    setState(() {
      y=1;
    });
    FirebaseFirestore.instance.collection('Users').get().then((value) {

      if(value.docs.isNotEmpty) {
        setState(() {
          users = value.docs.length.toString();
        });

      }
    });

    FirebaseFirestore.instance.collection('Counselor').get().then((value) {

      if(value.docs.isNotEmpty) {
        setState(() {
          counselors = value.docs.length.toString();
        });

      }
    });

  }




  @override
  void initState() {
    setState(() {

      isloading = false;
      y=0;
      users = '0';
      counselors = '0';
      products = '0';
      category = '0';
    });
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(y==0) {
      getData();
    }
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: showExitPopup,

      child: Scaffold(
          backgroundColor: lightblueColor,
          resizeToAvoidBottomInset: false,


          body:
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: size.height*0.1,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  //  height: size.height * 0.1,
                    width: size.width,
                    decoration: BoxDecoration(
                 //     color: primaryColor,

                    ),
                    child: Image.asset('assets/images/logo.png',height: 100, width: 100,fit: BoxFit.scaleDown,)
                ),
              ),
              SizedBox(
                  height: 15,),
              Text('Welcome Admin', style: TextStyle(color: Colors.black,fontSize: 20, fontFamily: fontFamilySemiBold),),


              isloading ? Center(child: CircularProgressIndicator(color: primaryColor,)) :
              Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 40,bottom: 10,left: 10,right: 10),
                    child: GridView.builder(
                        padding: EdgeInsets.only(top: 0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            mainAxisExtent: 170,
                            mainAxisSpacing: 20),
                        itemCount: _categories
                            .length, //snapshot.data!.docs.length,//myProducts.length,
                        itemBuilder: (BuildContext ctx, index1) {
                          return GestureDetector(
                            onTap: () async {
                              if(index1 == 0) {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (c, a1, a2) => AdminUserScreen(),
                                    transitionsBuilder: (c, anim, a2, child) =>
                                        FadeTransition(
                                            opacity: anim, child: child),
                                    transitionDuration: Duration(
                                        milliseconds: 100),
                                  ),
                                ).then((value) {
                                  getData();
                                  setState(() {

                                  });

                                });
                              }
                              else if(index1 == 1) {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (c, a1, a2) => AdminCounselorsScreen(),
                                    transitionsBuilder: (c, anim, a2, child) =>
                                        FadeTransition(
                                            opacity: anim, child: child),
                                    transitionDuration: Duration(
                                        milliseconds: 100),
                                  ),
                                ).then((value) {
                                  getData();
                                  setState(() {

                                  });

                                });
                              }
                              else if(index1 == 2) {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (c, a1, a2) => AdminFeedbackScreen(),
                                    transitionsBuilder: (c, anim, a2, child) =>
                                        FadeTransition(
                                            opacity: anim, child: child),
                                    transitionDuration: Duration(
                                        milliseconds: 100),
                                  ),
                                );
                              }

                              else if(index1 == 3) {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                try {
                                  prefs.remove('userEmail');
                                  prefs.remove('userType');
                                  prefs.remove('userPassword');
                                  prefs.remove('userId');
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserType()));
                                } catch (e) {
                                  return null;
                                }
                              }

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8,top: 0),
                              child: Container(
                                //width: size.width * 0.3,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  //shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white),
                                  color: Colors.white,
                                  gradient:  LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors:
                                    index1 == 0 ? <Color>[twoColor1, twoColor,] :
                                    index1 == 1 ? <Color>[threeColor1, threeColor,] :
                                    index1 == 2 ? <Color>[fourColor1, fourColor,] :
                                    <Color>[oneColor1, oneColor],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor
                                          .withOpacity(0.4),
                                      spreadRadius: 1.2,
                                      blurRadius: 0.8,
                                      offset: Offset(0,
                                          0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                        child: Container(

                                          child: Image.asset(
                                            _categories[index1].image.toString(),
                                            // _categories[index]
                                            //     .image
                                            //     .toString(),
                                            fit: BoxFit.scaleDown,
                                            height: 60,
                                            width: 60,
                                          ),
                                        )),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    index1 == 2 || index1 == 3 ? Container() :
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: primaryColor1
                                                  .withOpacity(0.4),
                                              spreadRadius: 1.2,
                                              blurRadius: 0.8,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            index1 == 0 ? users.toString() :
                                            index1 == 1 ? counselors.toString() :

                                            category.toString(),
                                            style: TextStyle(fontSize: 16,color:
                                            index1 == 0 ? fourColor  :
                                            index1 == 1 ? threeColor  :
                                            index1 == 2 ? twoColor  :
                                            oneColor,
                                            fontFamily: fontFamilySemiBold,),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Center(
                                      child: Text(
                                        _categories[index1].title.toString(),
                                        style: TextStyle(fontSize: 15,color: whiteColor,fontFamily: fontFamilyBold,),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                ],
              ),



            ],),
          )





      ),
    );
  }

  Future<bool> showExitPopup() async {
    return await
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit the App?'),
        actions:[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                textStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: fontFamilyBold)),
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            //return true when click on "Yes"
            style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                textStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: fontFamilyBold)),
            child:Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }

}


class Product {
  final String image;
  final String id;
  final String sale;
  final String isNew;
  final String title;
  final String quantity;
  final String ruppes;
  bool favorite;
  int addToCart;

  Product(
      {required this.title,
        required this.id,
        required this.sale,
        required this.isNew,
        required this.quantity,
        required this.ruppes,
        required this.image,
        required this.favorite,
        required this.addToCart});
}
