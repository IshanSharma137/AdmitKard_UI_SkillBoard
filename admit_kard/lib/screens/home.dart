import 'package:firebase_core/firebase_core.dart';

import 'editProfile.dart';
import 'editStudyPref.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admit_kard/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admit_kard/icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb;
import 'dart:html';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
     InputElement uploadInput;

  }
  String imageUrl='';
  @override
  Widget build(BuildContext context) {
   

       final screenHeight = MediaQuery.of(context).size.height;
    return Container(
    
     child: Scaffold(
        backgroundColor: Color.fromARGB(255, 218, 216, 216),
        appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.white,  ),
        ),
        title: Image.asset(
              'assets/admitlogo.jpg', 
              height: 70,
            ),

        
actions: [
  Image.asset(
              'assets/gm.jpg', 
              height: 20,
            ),
            Text("\n${loggedInUser.firstName} ${loggedInUser.lastName} ", 
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
          DropdownButton<String>(
            icon: Icon(Icons.menu),
            alignment: AlignmentDirectional.centerStart,
            onChanged: (value) {},
            items: [
              DropdownMenuItem<String>(
                value: 'dashboard',
                child: Text('Dashboard'),
              ),
              DropdownMenuItem<String>(
                value: 'refer',
                child: Text('Refer and Earn'),
              ),
              DropdownMenuItem<String>(
                value: 'security',
                child: Text('Security'),
              ),
              DropdownMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.dashboard, color: Colors.pinkAccent),
                    title: Text('Dashboard'),
                  ),
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.blue),
                    title: Text('Profile'),
                  ),
                  ListTile(
                    leading: Icon(Icons.report, color: Colors.red),
                    title: Text('Report'),
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment, color: Colors.orange),
                    title: Text('Apply'),
                  ),
                  ListTile(
                    leading: Icon(Icons.people, color: Colors.black),
                    title: Text('Mentor'),
                  ),
                  ListTile(
                    leading: Icon(Icons.chat, color: Colors.green),
                    title: Text('WhatsApp Chat'),
                  ),
                  ListTile(
                    leading: Icon(Icons.card_giftcard, color: Colors.amber),
                    title: Text('Refer and Earn'),
                  ),
                  ListTile(
                    leading: Icon(Icons.help, color: Color.fromARGB(255, 229, 67, 121)),
                    title: Text('Help'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Color.fromARGB(255, 218, 215, 215),
              child: Center(
                child:  CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[

          _buildHeader(screenHeight),
          _buildCount(context, screenHeight),
          _buildStudy(context, screenHeight),
        
          
        ], 
        ),
              ),
            ),
          ),
        ],
      ),
     
      
        
    ), );
  }

   SliverToBoxAdapter _buildHeader(double screenHeight)
{
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        
      borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(40.0),
      bottomRight: Radius.circular(40.0),
      ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          SizedBox(height: screenHeight*0.03),
          
        ],
      ),
      ),
      
  );
}

 SliverToBoxAdapter _buildCount(BuildContext context, screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        
        margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.26,
         decoration: BoxDecoration(
         color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                


              



IconButton(onPressed: () async{
                 uploadToStorage();


                      },
                      icon: Icon(Icons.camera_alt),
                     
                      
                      ),








                SizedBox(
            height: 90,
            
            child: Image.asset("assets/gm.jpg", fit: BoxFit.contain), 
          ),
          
                
               
                
              ],
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${loggedInUser.firstName} ${loggedInUser.lastName} ", 
                style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                Text("Profile Status", 
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),
                SizedBox(height: 7),
 Row(
  children: [
    LinearPercentIndicator(
      lineHeight: 10,
      width: 400,
      percent: 0.4,
      progressColor: Color.fromARGB(255, 9, 3, 89),
    ),]),
SizedBox(height: 10), 
                Row(
  children: [
    
    Icon(MyFlutterApp.mail, color: Colors.yellow,),
    SizedBox(width: 5), 
    Text("${loggedInUser.email}"),
    SizedBox(width: 15), 
    Icon(MyFlutterApp.call, color: Colors.blue,),
    SizedBox(width: 5), 
    Text("${loggedInUser.phone}"),
    SizedBox(width: 15), 
    Icon(MyFlutterApp.whatsapp, color: Colors.green,),
    SizedBox(width: 5), 
    Text("${loggedInUser.whatsapp}"),
  ],
),
SizedBox(height: 15),
 Row(
  children: [
    Icon(MyFlutterApp.location, color: Colors.red,),
    SizedBox(width: 5), 
    Text("${loggedInUser.country}"),
    SizedBox(width: 15), 
    Icon(MyFlutterApp.calendar, color: Colors.red,),
    SizedBox(width: 5), 
    Text("${loggedInUser.dob}"),
    SizedBox(width: 15), 
    Icon(MyFlutterApp.transgender, color: Colors.pinkAccent,),
    SizedBox(width: 5), 
    Text("${loggedInUser.gender}"),
    SizedBox(width: 15), 
    Icon(MyFlutterApp.diamond, color: Colors.blueAccent,),
    SizedBox(width: 5), 
    Text("${loggedInUser.status}"),
  ],
)
              ]),
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                 height: 20,
                  child: MaterialButton(
                    padding: EdgeInsets.all(0.0), 
                    onPressed: (() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage() ));
                    
                  }),

                  child: Image.asset("assets/bpen.png",fit: BoxFit.contain),
                )
                
                )
                
              ])
          ],
          
        ),
        
      ),
    );


  }

  SliverToBoxAdapter _buildStudy(BuildContext context, screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        
        margin: const EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: screenHeight * 0.44,
         decoration: BoxDecoration(
         color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                           Text(" Your Study Preferences\n", 
                style: TextStyle(color: Color.fromARGB(255, 113, 113, 113), fontSize: 27, fontWeight: FontWeight.bold),),
                Row(
                    children: [
                      Icon(MyFlutterApp.graduation_cap, color: Color.fromARGB(255, 4, 58, 103)),
                      SizedBox(width: 10), // add some spacing between the icon and text
                      Text("Course Level",  
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                
          Text("         ${loggedInUser.course}\n", 
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),
          Row(
                    children: [
                      Icon(MyFlutterApp.flag, color: Colors.red),
                      SizedBox(width: 10), 
                      Text("Country Preferences",  
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
          Text("         ${loggedInUser.pref_count}\n", 
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),
            Row(
                    children: [
                      Icon(MyFlutterApp.book_open, color: Colors.green),
                      SizedBox(width: 10), // add some spacing between the icon and text
                      Text("Preferred Course",  
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
          Text("         ${loggedInUser.pref_cour}\n", 
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),  
               Row(
                    children: [
                      Icon(MyFlutterApp.gear, color: Color.fromARGB(255, 122, 110, 4)),
                      SizedBox(width: 10), // add some spacing between the icon and text
                      Text("Specialization",  
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
          Text("         ${loggedInUser.spec}", 
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),
                
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("\n", 
                style: TextStyle(color: Color.fromARGB(255, 113, 113, 113), fontSize: 27, fontWeight: FontWeight.bold),),
                Row(
                    children: [
                      Text("            "),
                      Icon(MyFlutterApp.calendar, color: Colors.red,),
                      SizedBox(width: 10), // add some spacing between the icon and text
                      Text("Intake",  
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                
                    Text("                   ${loggedInUser.intake}\n", 
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Text("            "),
                      Icon(MyFlutterApp.money_bill_alt, color: Color.fromARGB(255, 32, 120, 35)),
                      SizedBox(width: 10), 
                      Text("Budget",  
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                    Text("                   ${loggedInUser.budget}\n", 
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Text("            "),
                      Icon(MyFlutterApp.crosshairs),
                      SizedBox(width: 10),
                      Text("Objective",  
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                    Text("                   ${loggedInUser.object}", 
                style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),),

              ]
              ),
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                 height: 20,
                  child: MaterialButton(
                    padding: EdgeInsets.all(0.0), 
                    onPressed: (() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PreferencesPage() ));
                    
                  }),

                  child: Image.asset("assets/bpen.png",fit: BoxFit.contain),
                )
                
                )
                
              ])
          ],
        ),
      ),
    );
  }
  
  
}

void uploadImage({required Function(File file) onSelected}) {

  final uploadInput = FileUploadInputElement()..accept = 'image/png';
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final file = uploadInput.files!.first;
    final reader = FileReader();
    reader.readAsDataUrl(file);
    reader.onLoadEnd.listen((event) {
      onSelected(file);
     }); });
}

void uploadToStorage(){ 
  final dateTime = DateTime.now();

  final path = '$dateTime';
  uploadImage(
    onSelected: (file){
      fb.FirebaseStorage.instance
          .refFromURL('gs://admitkard-850b6.appspot.com/')
          .child(path)
          .putBlob(file);
  });

}