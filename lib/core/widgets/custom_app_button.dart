import 'package:busapp/constants.dart';
import 'package:busapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key, required this.onPressed, required this.buttonText, this.bgColor, this.iconData, this.textColor});

  final void Function() onPressed;
  final String buttonText;
  final Color? bgColor;
  final Widget? iconData;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height:   48,
      child: ElevatedButton.icon(

        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor??primaryColor,
         shape: RoundedRectangleBorder(
           side: BorderSide(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),

        )
        ),
          onPressed: onPressed,
          label: Text(buttonText,
          style: Styles.textStyle14.copyWith(color: textColor??Colors.white),),
        icon: iconData,
          ),

    );

  }
}
