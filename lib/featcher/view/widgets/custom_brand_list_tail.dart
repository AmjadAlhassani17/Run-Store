// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runstore/featcher/view/widgets/custom_text.dart';
import '../../core/colors/colors.dart';

class CustomListTail extends StatelessWidget {
  const CustomListTail(
      {Key? key, required this.name, required this.svg, required this.trailing,required this.listTile})
      : super(key: key);

  final String name;
  final String svg;
  final Function()? trailing;
  final Function()? listTile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: listTile,
      leading: Container(
        padding: EdgeInsets.all(12),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: ColorSelect.iconPerson,
        ),
        child: SvgPicture.asset(
          svg,
          color: ColorSelect.primarycolor,
        ),
      ),
      title: CustomText(
        text: name,
        color: ColorSelect.textColor,
        fontsize: 17,
        textAlign: TextAlign.left,
        fontWeight: FontWeight.w600,
        textOverflow: TextOverflow.clip,
        height: 0.0,
      ),
      trailing: InkWell(
        onTap: trailing,
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            border: Border.all(color: ColorSelect.primarycolor),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: ColorSelect.whiteColor,
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: ColorSelect.primarycolor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
