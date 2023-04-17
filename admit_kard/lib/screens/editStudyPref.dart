import 'package:flutter/material.dart';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admit_kard/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});
  @override
  State <PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  String? _courseLevel;
  String? _countryPreference;
  String? _preferredCourse;
  String? _specialization;
  String? _intake;
  String? _budget;
  String? _objective;
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Course Level'),
                validator: (value) {
                  
                    return 'Please enter your course level.';
                 
                  
                },
                onSaved: (value) {
                  _courseLevel = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Country Preference'),
                validator: (value) {
                  
                    return 'Please enter your country preference.';
               
                },
                onSaved: (value) {
                  _countryPreference = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preferred Course'),
                validator: (value) {
                
                    return 'Please enter your preferred course.';
                  
                },
                onSaved: (value) {
                  _preferredCourse = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Specialization'),
                validator: (value) {
                 
                    return 'Please enter your specialization.';
                 
                },
                onSaved: (value) {
                  _specialization = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Intake'),
                validator: (value) {
             
                    return 'Please enter your intake.';
                  
                },
                onSaved: (value) {
                  _intake = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Budget'),
                validator: (value) {
                
                    return 'Please enter your budget.';
                
                },
                onSaved: (value) {
                  _budget = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Objective'),
                validator: (value) {
           
                    return 'Please enter your objective.';
             
                },
                onSaved: (value) {
                  _objective = value;
                },
              ),
              SizedBox(height: 16.0),
              MaterialButton(
                child: Text('Save'),
                onPressed: () {
                  _formKey.currentState?.save();
                    final docUser = FirebaseFirestore.instance
                    .collection('users')
                    .doc("${loggedInUser.uid}");
                  docUser.update(
                    {
                    'course': '$_courseLevel',
                    'pref_count': '$_countryPreference',
                    'pref_cour': '$_preferredCourse',
                    'spec': '$_specialization',
                    'intake': '$_intake',
                    'budget': '$_budget',
                    'object': '$_objective',

 
                    }
                  );
                },),
            ],),),),);}}