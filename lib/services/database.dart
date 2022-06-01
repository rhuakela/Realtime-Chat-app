import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DatabaseMethods{

  getUserByUsername(String username) async{
    return FirebaseFirestore.instance.collection("users")
      .where("name", isEqualTo: username)
        .snapshots();
  }
  uploadUserInfo(userMap){
    FirebaseFirestore.instance.collection("users")
        .add(userMap).catchError((e){
          if (kDebugMode) {
            print(e.toString());
          }

    });
  }
}

