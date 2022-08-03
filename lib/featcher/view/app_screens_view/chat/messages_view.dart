// ignore_for_file: unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:runstore/featcher/view/app_screens_view/chat/widget/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapShot.hasData && snapShot.data!.docs.isNotEmpty) {
          final docs = snapShot.data!.docs;
          return ListView.builder(
            reverse: true,
            itemCount: docs.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: MessageBubble(docs[index]['text'], docs[index]['username'], docs[index]['userId'] , ValueKey( docs[index])),
            ),
          );
        }
        return Text('error');
      },
    );
  }
}
