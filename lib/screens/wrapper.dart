import 'package:crudtest/models/user.dart';
import 'package:crudtest/screens/home/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:crudtest/screens/home/home.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      
      final user = Provider.of<User>(context);
      if(user == null){
        return Authenticate();
      }else{
        return FirestoreCRUDPage();
      }
      
  }
}