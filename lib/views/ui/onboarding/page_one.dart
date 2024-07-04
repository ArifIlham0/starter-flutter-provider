import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_frontend_flutter/constants/app_constants.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/exports.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: kBlack2,
        child: Column(
          children: [
            HeightSpacer(size: 50),
            Image.asset(
              "assets/images/page1.png",
              width: 400.w,
              height: 400.h,
            ),
            HeightSpacer(size: 40),
            Column(
              children: [
                ReusableText(
                  text: "Text",
                  style: textStyles(20, kWhite, FontWeight.w500),
                ),
                HeightSpacer(size: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    "Text panjang nihhh",
                    style: textStyles(11, kWhite, FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
