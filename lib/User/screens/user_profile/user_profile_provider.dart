import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfo {
  final String? userName;
  final String? userPassword;

  UserInfo({
    this.userName,
    this.userPassword,
  });
}

class UserProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? _userName;
  String? get userName => _userName;

  String? _userPassword;
  String? get userPassword => _userPassword;

  UserProvider() {
    checkIfUserExist();
  }

  Future<UserInfo> checkIfUserExist() async {
    await firestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot doc) {
      _userName = doc.data().toString().contains('name') ? doc.get('name') : '';

      _userPassword =
          doc.data().toString().contains('password') ? doc.get('password') : '';

      notifyListeners();
    });

    return UserInfo(
      userName: userName,
      userPassword: userPassword,
    );
  }

  Future updateUserData({
    required String userName,
    required String newUserPassword,
  }) async {
    await firestore.collection('users').doc(firebaseAuth.currentUser!.uid).set(
      {
        "name": userName,
        "password": newUserPassword,
      },
      SetOptions(merge: true),
    );

    _userName = userName;
    _userPassword = newUserPassword;

    notifyListeners();
  }
}
