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
    );
  }
}
