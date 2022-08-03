import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class NewMessages extends StatefulWidget {
  NewMessages({Key? key}) : super(key: key);

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final controller = TextEditingController();
  String enteredMessage = '';

  sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = await FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('Users').doc(user!.uid).get();
    FirebaseFirestore.instance
        .collection('chat')
        .add(({'text': enteredMessage, 'createdAt': Timestamp.now(),'username': user.uid ,'userId': userData['username'],}));
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
          child: TextField(
            style: TextStyle(color: ColorSelect.textColor),
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Send a message...',
              labelStyle: TextStyle(color: ColorSelect.textColor),
            ),
            onChanged: (val) {
              setState(() {
                enteredMessage = val;
              });
            },
          ),
        ),
        IconButton(
          onPressed: enteredMessage.trim().isEmpty ? null : sendMessage,
          icon: Icon(
            Icons.send,
            color: ColorSelect.textColor,
          ),
          color: ColorSelect.primarycolor,
        ),
      ]),
    );
  }
}
