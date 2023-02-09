import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPriceWithLine extends StatelessWidget {
  CustomPriceWithLine(
      {required this.text,
      required this.color,
      required this.fontsize,
      required this.textAlign,
      required this.fontWeight,
      required this.textOverflow,
      required this.height,
      Key? key})
      : super(key: key);
  String text;
  Color color;
  TextAlign textAlign;
  FontWeight fontWeight;
  double fontsize;
  double height;
  TextOverflow? textOverflow = TextOverflow.ellipsis;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: color,
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        height: height,
        decoration: TextDecoration.lineThrough,
      ),
      textAlign: textAlign,
      
    );
  }
}
