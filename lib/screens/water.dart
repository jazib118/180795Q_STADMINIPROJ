import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCRUDPage3 extends StatefulWidget {
  @override
  FirestoreCRUDPage3State createState() {
    return FirestoreCRUDPage3State();
  }
}

class FirestoreCRUDPage3State extends State<FirestoreCRUDPage3> {
  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String wateramount;

  Card buildItem(DocumentSnapshot doc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Amount: ${doc.data['wateramount']}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'todo: ${doc.data['todo']}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => updateData(doc),
                  child: Text('Update todo', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteData(doc),
                  child: Text('Delete'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Key In your water intake',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a water intake';
        }
      },
      onSaved: (value) => wateramount = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Track Your Water',
        style: TextStyle(
           color: Colors.black,
        ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: createData,
                child: Text('Create', style: TextStyle(color: Colors.white)),
                color: Colors.black,
              ),
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text('Read', style: TextStyle(color: Colors.white)),
                color: Colors.black,
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: db.collection('WATER').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.documents.map((doc) => buildItem(doc)).toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }

  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db.collection('WATER').add({'wateramount': '$wateramount', 'todo': randomTodo()});
      setState(() => id = ref.documentID);
      print(ref.documentID);
    }
  }

  void readData() async {
    DocumentSnapshot snapshot = await db.collection('WATER').document(id).get();
    print(snapshot.data['wateramount']);
  }

  void updateData(DocumentSnapshot doc) async {
    await db.collection('WATER').document(doc.documentID).updateData({'todo': 'please '});
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('WATER').document(doc.documentID).delete();
    setState(() => id = null);
  }

  String randomTodo() {
    final randomNumber = Random().nextInt(4);
    String todo;
    switch (randomNumber) {
      case 1:
        todo = 'Keep an aim to drink at least 2 litres of water daily';
        break;
      case 2:
        todo = 'Keep track of your water intake';
        break;
      case 3:
        todo = 'Lack of water could cause dehydration';
        break;
      default:
        todo = 'Water is essential for our body';
        break;
    }
    return todo;
  }
}