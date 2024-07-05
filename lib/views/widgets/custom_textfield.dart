import 'package:flutter/material.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
    this.validator,
    this.isAgent,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final bool? isAgent;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      maxLines: isAgent != null ? 3 : 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(kLightGrey.value),
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: textStyles(14, Color(kDarkGrey.value), FontWeight.w500),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(kDarkGrey.value), width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent, width: 0.5),
        ),
        border: InputBorder.none,
      ),
      controller: controller,
      cursorHeight: 25,
      style: textStyles(14, Color(kWhite2.value), FontWeight.w500),
      validator: validator,
    );
  }
}
