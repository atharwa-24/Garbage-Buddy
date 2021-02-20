import 'package:flutter/material.dart';
import 'package:garbagebuddy/screens/authenticate/authenticate.dart';
import 'package:garbagebuddy/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:garbagebuddy/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FireUser>(context);

    //return either home or authenticate
    if(user == null) {
      return Authenticate();
    }
    else {
      return Home();
    }
  }
}
