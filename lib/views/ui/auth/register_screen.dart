import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_frontend_flutter/controllers/login_provider.dart';
import 'package:starter_frontend_flutter/controllers/register_provider.dart';
import 'package:starter_frontend_flutter/models/request/auth/register_model.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/ui/auth/login_screen.dart';
import 'package:starter_frontend_flutter/views/widgets/exports.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);

    return Consumer<RegisterProvider>(
      builder: (context, signUpProvider, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: "Daftar",
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: signUpProvider.signupFormKey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  HeightSpacer(size: 50),
                  ReusableText(
                    text: "Halo, Selamat datang!",
                    style: textStyles(27, kWhite2, FontWeight.w600),
                  ),
                  ReusableText(
                    text: "Isi di bawah ini untuk daftar",
                    style: textStyles(16, kDarkGrey, FontWeight.w600),
                  ),
                  HeightSpacer(size: 40),
                  CustomTextField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    hintText: "Nama",
                    validator: (name) {
                      if (name!.isEmpty) {
                        return "Tolong masukkan nama anda";
                      } else {
                        return null;
                      }
                    },
                  ),
                  HeightSpacer(size: 20),
                  CustomTextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    validator: (email) {
                      if (email!.isEmpty || !email.contains('@')) {
                        return "Tolong masukkan email yang valid";
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
                    obscureText: signUpProvider.obscureText,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 8) {
                        return "Password minimal ada huruf besar, angka, simbol, dan panjang huruf 8";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        signUpProvider.obscureText =
                            !signUpProvider.obscureText;
                      },
                      icon: Icon(
                        signUpProvider.obscureText
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
                        Get.offAll(() => LoginScreen());
                      },
                      child: ReusableText(
                        text: "Masuk",
                        style: textStyles(14, kWhite2, FontWeight.w500),
                      ),
                    ),
                  ),
                  HeightSpacer(size: 10),
                  CustomButton(
                    onTap: () async {
                      loginProvider.firstTime = !loginProvider.firstTime;

                      if (signUpProvider.validateAndSave()) {
                        RegisterModel model = RegisterModel(
                          username: name.text,
                          email: email.text,
                          password: password.text,
                        );
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('firstTime', true);
                        signUpProvider.register(model);
                      } else {
                        Get.snackbar(
                          "Register failed",
                          "Please check your email or password",
                          colorText: kBlack2,
                          backgroundColor: Colors.red,
                          icon: Icon(Icons.add_alert),
                        );
                      }
                    },
                    text: "Daftar",
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
