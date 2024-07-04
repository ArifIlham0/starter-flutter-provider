import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_frontend_flutter/constants/app_constants.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/reusable_text.dart';
import 'package:starter_frontend_flutter/views/widgets/text_styles.dart';
import 'package:starter_frontend_flutter/views/widgets/width_spacer.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key, this.color, this.onTap});

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: CircularProgressIndicator(color: kWhite),
          ),
          WidthSpacer(width: 10),
          ReusableText(
            text: "Loading..",
            style: textStyles(16, color ?? kWhite, FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
