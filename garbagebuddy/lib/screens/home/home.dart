import 'package:flutter/material.dart';
import 'package:garbagebuddy/services/auth.dart';
import 'package:garbagebuddy/services/database.dart';
import 'package:provider/provider.dart';
import 'package:garbagebuddy/screens/home/canlist.dart';
import 'package:garbagebuddy/models/can.dart';


class Home extends StatelessWidget {

  final Can can;
  Home({this.can});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {



    return StreamProvider<List<Can>>.value(
      value: DatabaseService().can,
      child: Scaffold(
        backgroundColor: Colors.green[850],
        appBar: AppBar(
          title: Text('Garbage Buddy'),
          backgroundColor: Colors.green[900],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Container(
          child: CanList(),
        ),
      ),
    );
  }
}
