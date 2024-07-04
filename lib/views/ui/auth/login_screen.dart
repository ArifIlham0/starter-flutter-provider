import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:starter_frontend_flutter/controllers/login_provider.dart';
import 'package:starter_frontend_flutter/models/request/auth/login_model.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/ui/auth/register_screen.dart';
import 'package:starter_frontend_flutter/views/ui/home_screen.dart';
import 'package:starter_frontend_flutter/views/widgets/exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        loginProvider.getPrefs();
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: "Masuk",
              child: loginProvider.entrypoint && loginProvider.loggedIn
                  ? GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(CupertinoIcons.arrow_left),
                    )
                  : SizedBox.shrink(),
              actions: [
                TextButton(
                  onPressed: () => Get.offAll(
                    () => HomeScreen(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 100),
                  ),
                  child: ReusableText(
                    text: "Login nanti",
                    style: textStyles(12, kWhite2, FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: loginProvider.loginFormKey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  HeightSpacer(size: 50),
                  ReusableText(
                    text: "Selamat Datang!",
                    style: textStyles(30, kWhite2, FontWeight.w600),
                  ),
                  ReusableText(
                    text: "Isi kolom dibawah ini untuk login",
                    style: textStyles(16, kDarkGrey, FontWeight.w600),
                  ),
                  HeightSpacer(size: 50),
                  CustomTextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    validator: (email) {
                      if (email!.isEmpty || !email.contains('@')) {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  HeightSpacer(size: 20),
                  CustomTextField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    hintText: "Password",
                    obscureText: loginProvider.obscureText,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 7) {
                        return "Please enter a valid password";
                      } else {
                        return null;
                      }
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        loginProvider.obscureText = !loginProvider.obscureText;
                      },
                      icon: Icon(
                        loginProvider.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: kWhite2,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(kWhite2.withOpacity(0.1)),
                      ),
                      onPressed: () {
                        Get.offAll(() => RegisterScreen());
                      },
                      child: ReusableText(
                        text: "Daftar",
                        style: textStyles(14, kWhite2, FontWeight.w500),
                      ),
                    ),
                  ),
                  HeightSpacer(size: 50),
                  loginProvider.isLoading
                      ? LoadingButton(onTap: () {})
                      : CustomButton(
                          onTap: () {
                            print("Berhasil");
                            if (loginProvider.validateAndSave()) {
                              LoginModel model = LoginModel(
                                email: email.text,
                                password: password.text,
                              );
                              loginProvider.userLogin(model);
                            } else {
                              print("Gagal");
                              Get.snackbar(
                                "Login Failed",
                                "Please check your credentials",
                                colorText: kBlack2,
                                backgroundColor: Colors.red,
                                icon: Icon(Icons.add_alert),
                              );
                            }
                          },
                          text: "Masuk",
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
