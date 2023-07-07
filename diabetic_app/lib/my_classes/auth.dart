import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult _loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(_loginResult.accessToken!.token);
    return _firebaseAuth.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await _firebaseAuth.signInWithCredential(credential);
  }

}

class UserModel {
  final String? id;
  final String names = '';
  final String lastNameF = '';
  final String lastNameM = '';
  final String email;
  final String phoneNo = '';
  final DateTime birthday = DateTime.now();
  final String gender = '';
  final String postalCode = '';

  UserModel({required this.id, required this.email});

  toJson() {
    return {
      "names": names,
      "lastNameF": lastNameF,
      "lastNameM": lastNameM,
      "email": email,
      "phoneNo": phoneNo,
      "birthday": birthday,
      "gender": gender,
      "postalCode": postalCode
    };
  }

}