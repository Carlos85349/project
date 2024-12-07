import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthStatus { notAuthentication, chaeking, authenticated }

class LoginProvider extends ChangeNotifier {
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthStatus authStatus = AuthStatus.notAuthentication;

  // ignore: non_constant_identifier_names
  Future<void> LoginUser({
    required String usernameOrEmail,
    required String password,
    required Function onSuccess,
    required Function(String) onError,
  }) async {
    try {
      authStatus = AuthStatus.chaeking;
      notifyListeners();
      // ignore: unused_local_variable
      final String userNameOrEmailLowerCase = usernameOrEmail.toLowerCase();
      final QuerySnapshot result = await _firestore
          .collection('user')
          .where('username_lowercase', isEqualTo: userNameOrEmailLowerCase)
          .limit(1)
          .get();

      if (result.docs.isNotEmpty) {
        final String email = result.docs.first.get('email');
        final UserCredential userCredential = await _auth
            .signInWithEmailAndPassword(email: email, password: password);
        onSuccess();
      }
    } catch (e) {
      onError(e.toString());
    }
  }
}
