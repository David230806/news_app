import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';

class BaseTextfield extends TextField {
  final String? label;
  final String? hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final double borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;

  const BaseTextfield({
    super.key,
    this.width,
    this.height,
    this.label,
    this.hintText,
    this.validator,
    this.suffixIcon,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    this.borderRadius = 35,
    super.autocorrect,
    super.controller,
    super.keyboardType,
    super.maxLines,
    super.maxLength,
    super.readOnly,
    super.obscureText,
    super.onSubmitted,
    super.onChanged,
    super.onTap,
    super.minLines,
  });

  @override
  State<BaseTextfield> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<BaseTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: widget.minLines,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      controller: widget.controller,
      autocorrect: widget.autocorrect,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      style: TextStyle(
        color: AppColors.inversedPrimary,
      ),
      cursorColor: AppColors.inversedPrimary,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        fillColor: AppColors.interactive,
        labelText: widget.label,
        labelStyle: TextStyle(
          color: AppColors.inversedPrimary,
        ),
        hintStyle: TextStyle(
          color: AppColors.inversedPrimary,
        ),
        hintText: widget.hintText,
        border: InputBorder.none,
        contentPadding: widget.contentPadding,
      ),
    );
  }
}
