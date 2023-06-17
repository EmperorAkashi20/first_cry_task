import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_first_cry/Utils/first_cry_prefs.dart';
import 'package:my_first_cry/Views/home/home_view.dart';
import 'package:my_first_cry/Views/register_view.dart';

import '../main.dart';

final loginProvider =
    ChangeNotifierProvider.autoDispose((ref) => LoginProvider());

class LoginProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
  }

  login() async {
    if (emailController.text.isNotEmpty || passwordController.text.isNotEmpty) {
      var signInMethods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(emailController.text);
      if (signInMethods.isNotEmpty) {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
          navigatorKey.currentState?.pushNamed(Home.ROUTE_NAME);
          myFirstPref.setString('email', emailController.text);
        } on FirebaseAuthException catch (e) {
          final SnackBar snackBar = SnackBar(
            content: Text(
              e.message.toString(),
            ),
          );
          snackbarKey.currentState?.showSnackBar(snackBar);
        }
      } else {
        navigatorKey.currentState?.pushNamed(RegisterView.ROUTE_NAME);
        const SnackBar snackBar = SnackBar(
          content: Text(
            "Please register to continue",
          ),
        );
        snackbarKey.currentState?.showSnackBar(snackBar);
      }
    } else {
      const SnackBar snackBar = SnackBar(
        content: Text(
          "Fields cannot be empty",
        ),
      );
      snackbarKey.currentState?.showSnackBar(snackBar);
    }
  }
}
