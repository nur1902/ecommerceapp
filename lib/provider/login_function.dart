

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Screens/Main/main_nav_bar.dart';
import '../features/CacheStore/is_sign_in.dart';

class LoginFunction{
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      // Initialize Google Sign-In
      await _googleSignIn.initialize();

      // Open Google Account Picker
      final GoogleSignInAccount googleUser =
      await _googleSignIn.authenticate();

      // Get Google authentication tokens
      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      // Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Welcome ${user.displayName}",
            ),
          ),
        );

        print("UID: ${user.uid}");
        print("Name: ${user.displayName}");
        print("Email: ${user.email}");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => MainNavBar())
        );

        IsSignIn.saveLoginData('${user.email}');
        // TODO: Navigate to Home Screen

      }
      return user;
    } catch (e) {
      debugPrint("Google Sign-In Error: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Failed\n$e"),
        ),
      );
    }

  }
  Future<void> signOut() async {

    // Sign out from Google.
    await _googleSignIn.signOut();

    // Sign out from Firebase.
    await _auth.signOut();
  }
}