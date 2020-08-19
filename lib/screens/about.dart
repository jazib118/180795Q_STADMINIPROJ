import 'package:flutter/material.dart';
import 'package:crudtest/screens/strings.dart';

class About extends StatelessWidget {

  Widget titleSection = Container(
     width:900,
     height: 540,
   decoration:BoxDecoration(
                gradient:LinearGradient(
                colors: [Colors.lightBlueAccent,Colors.white],
                begin: Alignment.topLeft,
                end:Alignment.bottomRight
                )
                ), 
    child:Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children:<Widget>[
         Padding(
          padding:const EdgeInsets.all(8.0),
          child:Text(
          Strings.appHeadingTitle,
          style:TextStyle(
            color:Colors.black,
            fontWeight:FontWeight.bold,
            fontSize:30.0,
          )
          )
         ),
        Padding(
          padding:const EdgeInsets.all(8.0),
          child:Text(
          Strings.appsubHeadingTitle,
          style:TextStyle(
            color:Colors.indigo,
            fontWeight:FontWeight.bold,
            fontSize:20.0,
          )
          )
         ),
             Padding(
          padding:const EdgeInsets.all(8.0),
          child:Text(
          Strings.appTitle36,
          style:TextStyle(
            color:Colors.black,
            fontWeight:FontWeight.bold,
            fontSize:30.0,
          )
          )
         ),
             Padding(
          padding:const EdgeInsets.all(8.0),
          child:Text(
          Strings.appsubHeadingTitle7,
          style:TextStyle(
            color:Colors.indigo,
            fontWeight:FontWeight.bold,
            fontSize:30.0,
          )
          )
         ),
            
      ]
    )
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title:Strings.appBarTitle,
       theme:ThemeData(
         primarySwatch: Colors.cyan,
       ),
       home:Scaffold(
       backgroundColor: Colors.lightBlueAccent,
         body: ListView(
           children: <Widget>[
               titleSection
           ]
         )
       ),
     

      );
   
          
  }
}