import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/user.dart';
import 'package:evently_app/utiles/firebase_utils.dart';
import 'package:flutter/material.dart';

class Userprovider extends ChangeNotifier{
  MyUser? myUser;

 Future<void> readUser(String uid)async {
    DocumentSnapshot<MyUser> querySnapshot=await FirebaseUtils.usersCollectionRef().doc(uid).get();
    myUser = querySnapshot.data();
    notifyListeners();
  }

  void updateUser(MyUser? newUser){
    myUser = newUser;
    notifyListeners();
  }
}