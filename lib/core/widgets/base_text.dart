import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';

class BaseText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final int? maxLines;

  const BaseText(
    this.text, {
    super.key,
    this.color = AppColors.primary,
    this.fontSize = 20,
    this.fontWeight,
    this.textOverflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        overflow: textOverflow,
      ),
    );
  }
}
