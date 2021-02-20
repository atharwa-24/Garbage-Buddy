import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garbagebuddy/models/can.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection ref
  final CollectionReference canData = FirebaseFirestore.instance.collection('can');

  Future updateUserData(String co2, int co2Level, String space, int availableSpace) async {
    return await canData.doc(uid).set({
      'co2': co2,
      'co2Level': co2Level,
      'space': space,
      'availableSpace': availableSpace
    });
  }

  //brew list from snapshot
  List<Can> _canfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Can(
        co2: doc.data()['co2'] ?? '',
        co2Level: doc.data()['co2Level'] ?? 0,
        space: doc.data()['space'] ?? '',
        availableSpace: doc.data()['availableSpace'] ?? 0,
      );
    }).toList();
  }

  //get brews stream
  Stream<List<Can>> get can {
    return canData.snapshots()
        .map(_canfromSnapshot);
  }

}
