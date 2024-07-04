import 'package:flutter/material.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/reusable_text.dart';
import 'package:starter_frontend_flutter/views/widgets/text_styles.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
    this.text,
    this.onTap,
    this.isAgent,
  });

  final String? text;
  final Function? onTap;
  final bool? isAgent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(
          text: text!,
          style: textStyles(18, kWhite2, FontWeight.w600),
        ),
        InkWell(
          onTap: onTap! as void Function()?,
          child: ReusableText(
            text: isAgent == null ? "Lihat Semua" : "Lihat Lowongan Saya",
            style:
                textStyles(isAgent == null ? 18 : 14, kGreen, FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
