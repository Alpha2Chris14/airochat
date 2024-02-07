import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  // get instance of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Send Message
  Future<void> sendMessage(String recieverId, String message) async {
    //get current user info

    //create a new message

    //construct chat room id from current user id and reciever id(sorted to ensure uniqueness)

    //add new message to database
  }

  //GET MESSAGES
}
