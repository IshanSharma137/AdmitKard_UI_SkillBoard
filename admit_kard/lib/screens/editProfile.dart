import 'package:flutter/material.dart';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admit_kard/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';
  String _whatsapp = '';
  String _country = '';
  String _dob = '';
  String _gender = '';
  String? _maritalStatus = '';
 User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Study Preferences'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
              onChanged: (value) {
                setState(() {
                  _firstName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
              onChanged: (value) {
                setState(() {
                  _lastName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'E-mail'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone'),
              onChanged: (value) {
                setState(() {
                  _phone = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'WhatsApp'),
              onChanged: (value) {
                setState(() {
                  _whatsapp = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Country'),
              onChanged: (value) {
                setState(() {
                  _country = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'DOB'),
              onChanged: (value) {
                setState(() {
                  _dob = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Gender'),
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
            ),
            Row(
              children: [
                Radio(
                  value: 'Married',
                  groupValue: _maritalStatus,
                  onChanged: (value) {
                    setState(() {
                      _maritalStatus = value;
                    });
                  },
                ),
                Text('Married'),
                SizedBox(width: 20.0),
                Radio(
                  value: 'Unmarried',
                  groupValue: _maritalStatus,
                  onChanged: (value) {
                    setState(() {
                      _maritalStatus = value;
                    });
                  },
                ),
                Text('Unmarried'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState?.save();
                    final docUser = FirebaseFirestore.instance
                    .collection('users')
                    .doc("${loggedInUser.uid}");
              docUser.update(
                    {
                    'firstName': '$_firstName',
                    'lastName': '$_lastName',
                    'email': '$_email',
                    'phone': '$_phone',
                    'whatsapp': '$_whatsapp',
                    'country': '$_country',
                    'dob': '$_dob',
                    'gender': '$_gender',
                    'status': '$_maritalStatus'


 
                    }
                  );
              },
              child: Text('Go to another page'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page'),
      ),
    );
  }
}
