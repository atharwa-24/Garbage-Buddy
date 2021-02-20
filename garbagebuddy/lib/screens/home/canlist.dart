import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbagebuddy/models/can.dart';
import 'package:provider/provider.dart';
import 'package:garbagebuddy/screens/home/cantile.dart';

class CanList extends StatefulWidget {
  @override
  _CanListState createState() => _CanListState();
}

class _CanListState extends State<CanList> {
  @override
  Widget build(BuildContext context) {

    final can = Provider.of<List<Can>>(context) ?? [];
    can.forEach((can) {
      print(can.co2);
      print(can.co2Level);
      print(can.space);
      print(can.availableSpace);
    });

    return ListView.builder(
      itemCount: can.length,
      itemBuilder: (context, index) {
        return CanTile(can: can[index]);
      },
    );
  }
}
