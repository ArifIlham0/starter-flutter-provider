import 'package:flutter/material.dart';
import 'package:starter_frontend_flutter/constants/app_constants.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/loading_indicator.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    this.color,
    this.onTap,
    this.isButton,
  });

  final Color? color;
  final void Function()? onTap;
  final bool? isButton;

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
      child: LoadingIndicator(isButton: isButton),
    );
  }
}
