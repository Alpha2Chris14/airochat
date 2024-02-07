import 'package:airochat/component/my_text_field.dart';
import 'package:airochat/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String recieverUserEmail;
  final String recieverUserID;
  const ChatPage({
    super.key,
    required this.recieverUserEmail,
    required this.recieverUserID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    // only send message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
        widget.recieverUserID,
        _messageController.text,
      );
      //clear the text controller after sending message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Center(
          child: AppBar(
            backgroundColor: Colors.grey[600],
            flexibleSpace: Center(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: kToolbarHeight / 2.5),
                child: Text(
                  widget.recieverUserEmail,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          //user input
          _buildMessageInput(),
        ],
      ),
    );
  }

  //build message list
  _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.recieverUserID, _firebaseAuth.currentUser!.uid),
        builder: (cotext, snapshot) {
          if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }
          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    //align the messages to the if the sender is the current user,otherwise align to the left
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                (data['senderId'] == _firebaseAuth.currentUser!.uid)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            mainAxisAlignment:
                (data['senderId'] == _firebaseAuth.currentUser!.uid)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [
              Text(data['senderEmail']),
              Text(data['message']),
            ],
          ),
        ));
  }

  //build message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        //textfield
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: "Enter Message",
            obsureText: false,
          ),
        ),
        //send button
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(
            Icons.arrow_upward,
            size: 40,
          ),
        )
      ],
    );
  }
}
