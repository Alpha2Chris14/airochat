import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Center(
          child: AppBar(
            backgroundColor: Colors.grey[600],
            actions: [
              IconButton(
                color: Colors.white,
                onPressed: signUserOut,
                icon: const Icon(Icons.logout),
              ),
            ],
            flexibleSpace: Center(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: kToolbarHeight / 2.5),
                child: const Text(
                  "ChatRoom",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Center(
        child: Text("Hello ${user!.email}"),
      ),
    );
  }
}
