import 'package:crafty_bay/Screens/Main/main_nav_bar.dart';
import 'package:crafty_bay/features/CacheStore/is_sign_in.dart';
import 'package:crafty_bay/paths/assetpaths.dart';
import 'package:crafty_bay/provider/login_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;


import '../features/home/presentation/screens/home_screen.dart';


// A stateless widget for the Sign-In screen
class SignInScreen extends StatelessWidget {
  // Instance of GoogleAuthService to handle Google Sign-In
  final LoginFunction _authService = LoginFunction();

  Future<void> saveUser(User user, BuildContext context) async {
    try {
      // 1. Save to Firestore first
      await FirebaseFirestore.instance
          .collection("userinfo")
          .doc(user.uid)
          .set({
        "uid": user.uid,
        "name": user.displayName,
        "email": user.email,
        "photo": user.photoURL,
        "phone": user.phoneNumber,
        "createdAt": FieldValue.serverTimestamp(),
      });

      // 2. Only reached if the write above succeeded — no exception thrown
      print('Firestore save successful, now calling API...');

      final response = await http.get(
        Uri.parse(
          'http://daxel.shop/user_connect.php'
              '?uid=${user.uid}'
              '&name=${user.displayName}'
              '&email=${user.email}'
              '&photo=${user.photoURL}'
              '&phone=${user.phoneNumber}',
        ),
      );

      print('API response: ${response.statusCode} - ${response.body}');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.body)),
        );
      }
    } on FirebaseException catch (e) {
      // Firestore-specific failure (e.g. permission-denied)
      print('Firestore save failed: ${e.code} - ${e.message}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save profile: ${e.message}')),
        );
      }
    } catch (e) {
      // Network error, malformed URL, etc. from the http.get step
      print('API call failed: $e');
    }
  }
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with title and styling
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      // Main body of the screen
      body: Center(
        // ElevatedButton for Google Sign-In
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
          // Asynchronous function triggered on button press
          onPressed: () async {
            // Attempt to sign in with Google
            User? user = await _authService.signInWithGoogle(context);
            // If sign-in is successful, navigate to the HomeScreen
            if (user != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MainNavBar()),
              );
              IsSignIn.saveLoginData(user.email!);
              saveUser(user, context);
            }
          },
          // Text displayed on the button
          child:
          
          Text("Login with google"),
        ),
      ),
    );
  }
}