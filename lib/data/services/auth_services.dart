import 'package:auth_learn/screens/auth_state_builder.dart';
import 'package:auth_learn/utils/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get getCurrentuser => _auth.currentUser;

  Stream<User?> authChanges() => _auth.authStateChanges();

  Future<User> signUp({
    required String email,
    required String password,
    required String nama,
    required String npm,
    required String prodi,
    required String dosenPa,
  }) async {
    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (_userCredential != null) {
        return _userCredential.user!;
      }

      throw CustomException('User was null');
    } on FirebaseException catch (err) {
      throw CustomException(err.message!);
    }
  }

  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (_userCredential != null) return _userCredential.user!;

      throw CustomException('Login Gagal!');
    } on FirebaseException catch (err) {
      throw CustomException(err.message!);
    }
  }

  signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (err) {
      throw CustomException("Error in logging out : ${err.message!}");
    }
  }
}
