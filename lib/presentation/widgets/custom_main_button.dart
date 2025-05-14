import 'package:flutter/material.dart';
import 'package:e_commerse_zadaniye/core/utils/app_colors.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color? color;
  final Color? textColor;

  const CustomMainButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
