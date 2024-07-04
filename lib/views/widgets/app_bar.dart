import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/reusable_text.dart';
import 'package:starter_frontend_flutter/views/widgets/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.text,
    this.child,
    this.actions,
  });

  final String? text;
  final Widget? child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(),
      backgroundColor: kBlack2,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: child,
      actions: actions,
      centerTitle: true,
      title: ReusableText(
        text: text ?? "",
        style: textStyles(16, kWhite2, FontWeight.w600),
      ),
    );
  }
}
