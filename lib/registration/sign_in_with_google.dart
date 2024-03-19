import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigning extends StatefulWidget {
  const GoogleSigning({super.key});

  @override
  State<GoogleSigning> createState() => _GoogleSigningState();
}

class _GoogleSigningState extends State<GoogleSigning> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return null;
      }
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (err) {
      print(err);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
