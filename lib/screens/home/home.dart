import 'dart:math';
import 'dart:async';

import 'package:crudtest/screens/water.dart';
import 'package:crudtest/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudtest/screens/food.dart';
import 'package:crudtest/screens/about.dart';
import 'package:flutter/widgets.dart';
import 'package:crudtest/screens/strings.dart';

class FirestoreCRUDPage extends StatefulWidget {
  @override
  FirestoreCRUDPageState createState() {
    return FirestoreCRUDPageState();
  }
}

class FirestoreCRUDPageState extends State<FirestoreCRUDPage> {
  FirebaseUser currentUser;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        // call setState to rebuild the view
        this.currentUser = user;
      });
    });
  }

  String _email() {
    if (currentUser != null) {
      return currentUser.email;
    } else {
      return "No current user";
    }
  }

  final AuthService _auth = AuthService();

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'name',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: AppBar(
            title: Text('MyHealthApp'),
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.face, color: Colors.black)),
                Tab(icon: Icon(Icons.schedule, color: Colors.black)),
                Tab(icon: Icon(Icons.free_breakfast, color: Colors.black)),
                Tab(icon: Icon(Icons.book, color: Colors.black)),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(0.0),
              width: 500.0,
              height: 800.0,
              decoration:BoxDecoration(
                gradient:LinearGradient(
                colors: [Colors.lightBlueAccent,Colors.white],
                begin: Alignment.topLeft,
                end:Alignment.bottomRight
                )
                ), 
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 200,
                            padding: const EdgeInsets.fromLTRB(30, 30, 20, 5),
                            child: Text('Welcome',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Container(
                              width: 200,
                              padding: const EdgeInsets.fromLTRB(30, 0, 20, 5),
                              child: Text(_email(),
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ))),
                          Container(
                              width: 200,
                              padding: const EdgeInsets.fromLTRB(30, 5, 20, 5),
                              child: Text('Last logged in: 1/7/2020',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ))),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                        child: Image.asset('pt1_resources/male.png'),
                      )
                    ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Align(
                                alignment:Alignment.bottomCenter,
                                child:Text(  
                                  Strings.appHeadingTitle2,
                                   style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0,
                                  )
                                  )
                                  )
                                  ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:Align(
                                alignment:Alignment.center,
                                child:Text(
                                  Strings.appsubHeadingTitle2,
                                    style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  )
                                  )
                                  )
                                  ),
                              Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:Align(
                                alignment:Alignment.center,
                                child:Text(
                                  Strings.appsubHeadingTitle3,
                                    style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  )
                                  )
                                  )
                                  ),
                              Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:Align(
                                alignment:Alignment.center,
                                child:Text(
                                  Strings.appsubHeadingTitle6,
                                    style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    
                                    fontSize: 25.0,
                                  )
                                  )
                                  )
                                  ),
                              Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:Align(
                                alignment:Alignment.center,
                                child:Text(
                                  Strings.appsubHeadingTitle4,
                                    style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  )
                                  )
                                  )
                                  ),
                              Padding(
                              padding: const EdgeInsets.all(20.0),
                              child:Align(
                                alignment:Alignment.bottomCenter,
                                child:Text(
                                  Strings.appsubHeadingTitle5,
                                    style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  )
                                  )
                                  )
                                  )
                        ]),
                  ]),
            ),
            Container(
              child: FirestoreCRUDPage2(),
            ),
            Container(
              child: FirestoreCRUDPage3(),
            ),
            Container(
              child: About(),
            )
          ]),
        ));
  }
}
