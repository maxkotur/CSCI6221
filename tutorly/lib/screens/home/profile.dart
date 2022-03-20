import 'package:flutter/material.dart';
import 'package:tutorly/models/user.dart';
import 'package:tutorly/screens/authent/authenticate.dart';
import 'package:tutorly/services/auth.dart';
import 'package:tutorly/shared_code/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String sid = '';
  String fname = '';
  String lname = '';
  String lstudy = '';
  String clss = '';
  String profile = '';
  String hintfname = '                     First Name';

  String major = '';

  final ncontroller = TextEditingController();

  final firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue,
        appBar: new AppBar(
          centerTitle: true,
          title: Text('My Profile'),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
            child: Form(
                child: Column(
              children: <Widget>[
                SizedBox(height: 0.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                     Student ID'),
                  onChanged: (value) {
                    sid = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    controller: ncontroller,
                    decoration:
                        textInputDecoration.copyWith(hintText: hintfname),
                    onChanged: (value) {
                      fname = value;
                      //hintfname=ncontroller.toString();
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                     Last Name'),
                  onChanged: (value) {
                    lname = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                   Level of Study'),
                  onChanged: (value) {
                    lstudy = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                    Classification'),
                  onChanged: (value) {
                    clss = value;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: '                          Major'),
                  onChanged: (value) {
                    major = value;
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.yellow[300],
                    child: Text('Done', style: TextStyle(color: Colors.black)),
                    onPressed: () async {
                      firestore.collection('users').document(sid).setData({
                        'first name': fname,
                        'last name': lname,
                        'level of study': lstudy,
                        'classification': clss,
                        'major': major,
                      });
                    }),
              ],
            ))));
  }
}
