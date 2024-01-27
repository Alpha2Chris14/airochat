import 'package:airochat/pages/home_page.dart';
import 'package:airochat/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //check data
          if (snapshot.hasData) {
            return HomePage();
          }
          return LoginPage();
        });
  }
}
