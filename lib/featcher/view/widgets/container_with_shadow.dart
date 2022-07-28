// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import '../../core/colors/colors.dart';

class ContainerWithShadow extends StatelessWidget {
  ContainerWithShadow(
      {Key? key,
      required this.text,
      required this.price,
      required this.pathSvg})
      : super(key: key);
  String price;
  String pathSvg;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorSelect.whiteColor),
        color: ColorSelect.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: text,
                  color: ColorSelect.textColor,
                  fontsize: 17,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  textOverflow: TextOverflow.ellipsis,
                  height: 0.0,
                ),
                CustomText(
                  text: price,
                  color: ColorSelect.TextNewArrival,
                  fontsize: 17,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  textOverflow: TextOverflow.ellipsis,
                  height: 0.0,
                ),
              ],
            ),
            SvgPicture.asset(
              pathSvg,
              height: 30,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
