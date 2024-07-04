import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_frontend_flutter/constants/app_constants.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/exports.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: kBlack2,
        child: Column(
          children: [
            HeightSpacer(size: 40),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Image.asset(
                "assets/images/page2.png",
                width: 400.w,
                height: 400.h,
              ),
            ),
            HeightSpacer(size: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Text",
                  style: textStyles(20, kWhite, FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                HeightSpacer(size: 10),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    "Text panjang nihhh",
                    style: textStyles(12, kWhite, FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
