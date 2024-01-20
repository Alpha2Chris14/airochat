import 'package:airochat/component/my_button.dart';
import 'package:airochat/component/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                // logo
                Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.grey[800],
                ),

                const SizedBox(height: 50),

                // welcome back message
                const Text(
                  "Welcome back you\'ve been missed",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'email',
                  obsureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'password',
                  obsureText: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(onTap: () {}, text: "Sign In")

                // not a member? register
              ],
            ),
          ),
        ),
      ),
    );
  }
}
