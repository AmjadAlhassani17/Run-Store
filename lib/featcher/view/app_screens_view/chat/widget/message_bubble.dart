import 'package:flutter/material.dart';
import 'package:runstore/featcher/core/colors/colors.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';

class MessageBubble extends StatelessWidget{
  MessageBubble(this.message, this.userName, this.isMe,this.key);

  final String message;
  final String userName;
  final bool isMe;
  final Key key;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start ,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[200] : ColorSelect.primarycolor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14),bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(14) , bottomRight: isMe ? Radius.circular(0) : Radius.circular(14)),

          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal:16),
          margin: EdgeInsets.symmetric(vertical: 4,horizontal: 8 ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              CustomText(text: userName, color: isMe ? ColorSelect.blackColor : ColorSelect.whiteColor, fontsize: 14, textAlign: TextAlign.start, fontWeight: FontWeight.bold, textOverflow: TextOverflow.ellipsis, height: 0.0,),
              CustomText(text: message, color: isMe ? ColorSelect.blackColor : ColorSelect.whiteColor, fontsize: 14, textAlign: TextAlign.start, fontWeight: FontWeight.normal, textOverflow: TextOverflow.ellipsis, height: 0.0,),
            ],
          ),
        ),
      ],
    );
  }

}