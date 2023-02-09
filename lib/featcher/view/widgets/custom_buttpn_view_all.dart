// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class CustomBottonViewAll extends StatelessWidget {
  const CustomBottonViewAll ({required this.text,required this.width,required this.height,required this.fontWeight,required this.function,required this.color,required this.backgroundcolor,required this.textAlign, required this.fontsize ,Key? key}) : super(key: key);
  final String text;
  final Color color;
  final Color backgroundcolor;
  final double fontsize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double width;
  final double height;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: backgroundcolor),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)), 
        color: backgroundcolor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: ElevatedButton(
          onPressed: function,
          child: CustomText(
            height: 1,
            color: color,
            fontWeight: fontWeight,
            text: text,
            textOverflow: TextOverflow.clip,
            fontsize: fontsize,
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}
