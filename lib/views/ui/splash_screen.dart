import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_frontend_flutter/views/ui/auth/login_screen.dart';
import 'package:starter_frontend_flutter/views/ui/home_screen.dart';
import 'package:starter_frontend_flutter/views/ui/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  void navigateUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final entrypoint = prefs.getBool('entrypoint') ?? false;
    final loggedIn = prefs.getBool('loggedIn') ?? false;

    await Future.delayed(Duration(seconds: 1), () {
      if (entrypoint & !loggedIn) {
        Get.offAll(() => LoginScreen());
      } else if (entrypoint && loggedIn) {
        Get.offAll(() => HomeScreen());
      } else {
        Get.offAll(() => OnBoardingScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 120.w,
          height: 120.h,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
