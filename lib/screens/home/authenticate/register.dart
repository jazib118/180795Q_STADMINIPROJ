import 'package:crudtest/services/auth.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
   final Function toggleView;
   Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final  AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
     



     return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        elevation: 0.0,
        title:Text('Register to MyHealthApp'),
          actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label:Text('Login'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ]
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        children:<Widget>[ 
          Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
             SizedBox(
               height:200.0,
               child: Image.asset("pt1_resources/fit.png"),
             ),
             SizedBox(
               height:30.0,
               child:Text(
                 "Welcome To MyHealth",
                 style:TextStyle(
                   fontSize: 20.0,
                 ),
               )
             ),
             TextFormField(
                decoration:InputDecoration(
                 hintText: 'Email',
                 fillColor:Colors.white,
                 filled:true,
                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                 color: Colors.white,
                     width:2.0,
                     )
                 ),
                 focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color:Colors.pink,width:2.0)
                 ),
               ),
               validator: (val) => val.isEmpty ? 'Please enter your email':null,
               onChanged:(val){
                 setState(() {
                   email = val;
                 });
               }
             ),
             SizedBox(height:20.0),
             TextFormField(
                decoration:InputDecoration(
                 hintText: 'Password',
                 fillColor:Colors.white,
                 filled:true,
                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                 color: Colors.white,
                     width:2.0,
                     )
                 ),
                 focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color:Colors.pink,width:2.0)
                 ),
               ),
               obscureText:true,
               validator: (val) => val.length < 6 ? 'Enter a password which is more than 6 characters':null,
               onChanged:(val){
                  setState(() {
                   password = val;
                 });
               }
             ),
             SizedBox(height:20.0),
             RaisedButton(
               color:Colors.black12,
               child:Text(
                   'Register',
                   style:TextStyle(color:Colors.white)
                   
               ),
               onPressed: ()async{
               if(_formkey.currentState.validate()){
                  dynamic result = await _auth.registerwithEmailandPassword(email, password);
                  if(result == null){
                    setState(() {
                      error = 'Please key in a valid email address';
                    });
                  }
               }
               },

             ),
             SizedBox(height:12.0),
             Text(
               error,
               style:TextStyle(color:Colors.red,fontSize:14.0),
               )
            ]
          )
        )],
         
        
        )
      );
  }
}