// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:skapp/modal/user.dart';

class AuthMethods{

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  /// CONDITION ? TURE : FALSE
  User? _userFromFirebaseUser(FirebaseUser user){
    if (user !=null) {
      return User(userId: user.uid);
    } else {
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email,String password) async {
    try{
      AuthResult result = (await _auth.signInWithEmailAndPassword(email: email, password: password)) as AuthResult;
      FirebaseUser? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser!);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  Future signUpWithEmailAndPassword(String email, String password) async {

    try{
      AuthResult result = (await _auth.createUserWithEmailAndPassword(email: email, password: password)) as AuthResult;
      FirebaseUser? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser!);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  Future resetPass(String email) async{
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){}
  }
}

class AuthResult {
  FirebaseUser? get user => null;
}

mixin FirebaseUser {
  get uid => null;
}