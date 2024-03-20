import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
    Future<UserCredential> siginuser(String emails, String passwords, BuildContext context) async {
        UserCredential authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emails, password: passwords);
    return authResult;
  }

  static signinUser(
      String emails, String passwords, BuildContext context) async {
    if (emails == "" && passwords == "") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Enter Credential")));
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: emails, password: passwords);

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("You are logged in")));
      } on FirebaseAuthException catch (e) {
        if (e.code.toString() == 'user-not-found') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("No user Found with this email")));
        } else if (e.code == 'wrong-password') {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Password Didnot match")));
        }
      }
    }
  }
}
