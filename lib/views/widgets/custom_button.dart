import 'package:flutter/material.dart';
import 'package:starter_frontend_flutter/constants/app_constants.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/reusable_text.dart';
import 'package:starter_frontend_flutter/views/widgets/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.text, this.color, this.onTap});

  final String? text;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kGreen),
        minimumSize: MaterialStateProperty.all(Size(width, height * 0.065)),
        overlayColor: MaterialStateProperty.all(kBlack2.withOpacity(0.2)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
      child: Center(
        child: ReusableText(
          text: text!,
          style: textStyles(16, color ?? kWhite, FontWeight.w600),
        ),
      ),
    );
  }
}
