// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class CustomNewest extends StatelessWidget {
  const CustomNewest ({required this.text,required this.width,required this.height,required this.fontWeight,required this.color,required this.backgroundcolor,required this.textAlign, required this.fontsize ,Key? key}) : super(key: key);
  final String text;
  final Color color;
  final Color backgroundcolor;
  final double fontsize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: ColorSelect.transparent),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)), 
          color: backgroundcolor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Center(
            child: CustomText(
              height: 0.0,
              color: color,
              fontWeight: fontWeight,
              text: text,
              textOverflow: TextOverflow.clip,
              fontsize: fontsize,
              textAlign: textAlign,
            ),
          ),
        ),
      ),
    );
  }
}
