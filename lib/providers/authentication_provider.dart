import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _hasError = false;
  bool get hasError => _hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  bool _emailVerified = false;
  bool get emailVerified => _emailVerified;

  String? _uid;
  String? get uid => _uid;
  String? _password;
  String? get password => _password;

  String? _name;
  String? get name => _name;

  String? _shopName;
  String? get shopName => _shopName;

  String? _role;
  String? get role => _role;
  String? _email;
  String? get email => _email;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;

  bool _isApproved = false;
  bool get isApproved => _isApproved;

  AuthenticationProvider() {
    checkSignInUser();
  }

  Future checkSignInUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _isSignedIn = sharedPreferences.getBool('signed_in') ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool('signed_in', true);
    _isSignedIn = true;
    notifyListeners();
  }

  void resetError() async {
    _hasError = false;
    _errorCode = null;
    notifyListeners();
  }

  Future userSignOut() async {
    await firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    clearStoredData();
  }

  Future clearStoredData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  Future registerWithEmail(name, email, password, role, shopName) async {
    try {
      final User userDetails = (await firebaseAuth
              .createUserWithEmailAndPassword(email: email, password: password))
          .user!;
      _role = role;
      _shopName = shopName;
      _name = name;
      _password = password;
      _email = userDetails.email;
      _imageUrl = userDetails.photoURL ?? '';
      _uid = userDetails.uid;
      _phoneNumber = '';
      _emailVerified = false;
      _isApproved = true;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'account-exists-with-different-credential':
          _errorCode =
              'You already have an account with us. Use the correct provider';
          _hasError = true;
          notifyListeners();
          break;

        case 'email-already-in-use':
          _errorCode = 'This email is already registered. Please sign in.';
          _hasError = true;
          notifyListeners();
          break;

        case 'null':
          _errorCode = 'Some unexpected error while trying to sign in';
          _hasError = true;
          notifyListeners();
          break;

        default:
          _errorCode = 'Failed with error code: ${e.code}';
          _hasError = true;
          notifyListeners();
          break;
      }
    }
  }

  Future sendEmailVerification() async {
    firebaseAuth.currentUser!.sendEmailVerification();
    //     return result.user;
  }

  Future saveEmailVerified({uid, required String roleChosen}) async {
    final DocumentReference ref = (roleChosen == "تاجر")
        ? firestore.collection('sellers').doc(uid)
        : firestore.collection('users').doc(uid);
    await ref.update(
      {
        "emailVerified": true,
      },
    );
    _emailVerified = true;
    notifyListeners();
  }

  Future saveUserDataToFirestore({required String roleChosen}) async {
    final DocumentReference ref = (roleChosen == "تاجر")
        ? firestore.collection('sellers').doc(_uid)
        : firestore.collection('users').doc(_uid);
    await ref.set(
      {
        "name": _name,
        "password": _password,
        "shopName": _shopName,
        "email": _email,
        "uid": _uid,
        "role": roleChosen,
        "image_url": _imageUrl,
        "phoneNumber": _phoneNumber,
        "emailVerified": _emailVerified,
        "isApproved": true,
      },
    );
    notifyListeners();
  }

  Future saveDataToSharedPreferences({required String roleChosen}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('name', _name!);
    await sharedPreferences.setString('password', _password!);

    await sharedPreferences.setString('shopName', _shopName ?? "");
    await sharedPreferences.setString('role', roleChosen);

    await sharedPreferences.setString('email', _email!);
    await sharedPreferences.setString('uid', _uid!);
    await sharedPreferences.setString('image_url', _imageUrl!);
    await sharedPreferences.setString('phoneNumber', _phoneNumber!);
    await sharedPreferences.setBool('emailVerified', _emailVerified);
    await sharedPreferences.setBool('isApproved', _isApproved);
    notifyListeners();
  }

  Future getUserDataFromSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _name = sharedPreferences.getString('name');
    _password = sharedPreferences.getString('password');
    _shopName = sharedPreferences.getString('shopName');

    _role = sharedPreferences.getString('role');

    _email = sharedPreferences.getString('email');
    _uid = sharedPreferences.getString('uid');
    _imageUrl = sharedPreferences.getString('image_url');
    _phoneNumber = sharedPreferences.getString('phoneNumber');
    _emailVerified = sharedPreferences.getBool('emailVerified')!;
    _isApproved = sharedPreferences.getBool('isApproved')!;
    notifyListeners();
  }

  Future getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection('sellers')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              _uid = snapshot['uid'],
              _role = snapshot['role'],
              _name = snapshot['name'],
              _password = snapshot['password'],
              _shopName = snapshot['shopName'],
              _email = snapshot['email'],
              _imageUrl = snapshot['image_url'],
              _phoneNumber = snapshot['phoneNumber'],
              _emailVerified = snapshot['emailVerified'],
              _isApproved = snapshot['isApproved'],
            });

    notifyListeners();
  }

  Future getUserUSERDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) => {
              _uid = snapshot['uid'],
              _role = snapshot['role'],
              _name = snapshot['name'],
              _password = snapshot['password'],
              _email = snapshot['email'],
              _imageUrl = snapshot['image_url'],
              _phoneNumber = snapshot['phoneNumber'],
              _emailVerified = snapshot['emailVerified'],
              _isApproved = snapshot['isApproved'],
            });

    notifyListeners();
  }

  Future signInWithEmailAndPassword(
    email,
    password,
  ) async {
    try {
      final userDetails = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      _name = userDetails.displayName;
      _email = userDetails.email;
      _imageUrl = userDetails.photoURL;
      _emailVerified = userDetails.emailVerified;
      _uid = userDetails.uid;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'account-exists-with-different-credential':
          _errorCode =
              'You already have an account with us. Use the correct provider';
          _hasError = true;
          notifyListeners();

          break;

        case 'wrong-password':
          _errorCode = 'Username or password is incorrect';
          _hasError = true;
          notifyListeners();

          break;

        case 'null':
          _errorCode = 'Some unexpected error while trying to sign in';
          _hasError = true;
          notifyListeners();
          break;

        default:
          _errorCode = 'Failed with error code: ${e.code}';
          _hasError = true;
          notifyListeners();
          break;
      }
    }
  }
}
