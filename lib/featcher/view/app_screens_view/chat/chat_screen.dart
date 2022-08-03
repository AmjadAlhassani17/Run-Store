import 'package:flutter/material.dart';
import 'package:runstore/featcher/view/app_screens_view/chat/messages_view.dart';
import 'package:runstore/featcher/view/app_screens_view/chat/new_message_view.dart';

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Column(
        children: [
          Expanded(child: Messages()),
          NewMessages(),
        ],
      ),),
    );
  }

}