import 'package:flutter/material.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/widgets/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableText(
          text: "Ini home screen",
          style: textStyles(20, kWhite, FontWeight.normal),
        ),
      ),
    );
  }
}
