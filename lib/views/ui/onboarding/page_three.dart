import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_frontend_flutter/constants/app_constants.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/ui/auth/login_screen.dart';
import 'package:starter_frontend_flutter/views/ui/auth/register_screen.dart';
import 'package:starter_frontend_flutter/views/ui/home_screen.dart';
import 'package:starter_frontend_flutter/views/widgets/exports.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: kGreen2,
        child: Column(
          children: [
            HeightSpacer(size: 30),
            Image.asset(
              "assets/images/page3.png",
              width: 400.w,
              height: 400.h,
            ),
            HeightSpacer(size: 30),
            ReusableText(
              text: "Selamat Datang!",
              style: textStyles(20, kBlack2, FontWeight.w600),
            ),
            HeightSpacer(size: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text("Temukan pekerjaan impianmu dengan mudah dan cepat!",
                  style: textStyles(10, kBlack2, FontWeight.normal),
                  textAlign: TextAlign.center),
            ),
            HeightSpacer(size: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('entrypoint', true);
                    Get.to(() => LoginScreen());
                  },
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: kGreen2,
                      borderRadius: BorderRadius.circular(7),
                      border:
                          Border.all(color: Color(kBlack2.value), width: 2.w),
                    ),
                    child: Center(
                      child: ReusableText(
                        text: "Login",
                        style: textStyles(16, kBlack2, FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('entrypoint', true);
                    Get.to(() => RegisterScreen());
                  },
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: kBlack2,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: ReusableText(
                        text: "Sign Up",
                        style: textStyles(16, kGreen2, FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            HeightSpacer(size: 10),
            TextButton(
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(kBlack2.withOpacity(0.1)),
              ),
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setBool('entrypoint', true);
                Get.to(() => HomeScreen());
              },
              child: ReusableText(
                text: "Lanjut tanpa login",
                style: textStyles(12, kBlack2, FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
