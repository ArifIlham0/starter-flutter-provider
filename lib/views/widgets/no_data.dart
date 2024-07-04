import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/reusable_text.dart';
import 'package:starter_frontend_flutter/views/widgets/text_styles.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/optimized_search.png"),
          ReusableText(
            text: title!,
            style: textStyles(24, kWhite2, FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
