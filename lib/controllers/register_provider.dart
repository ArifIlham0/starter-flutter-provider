import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter_frontend_flutter/models/request/auth/register_model.dart';
import 'package:starter_frontend_flutter/services/helpers/auth_helper.dart';
import 'package:starter_frontend_flutter/theme.dart';

class RegisterProvider extends ChangeNotifier {
  final signupFormKey = GlobalKey<FormState>();
  final agentFormKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _processing = false;
  bool _firstTime = false;

  bool get obscureText => _obscureText;
  bool get processing => _processing;
  bool get firstTime => _firstTime;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  set processing(bool newValue) {
    _processing = newValue;
    notifyListeners();
  }

  set firstTime(bool newValue) {
    _firstTime = newValue;
    notifyListeners();
  }

  bool passwordValidator(String password) {
    if (password.isEmpty) return false;
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  bool validateAndSave() {
    final form = signupFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool validateAndSaveAgent() {
    final form = agentFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  register(RegisterModel model) {
    AuthHelper.register(model).then((response) {
      if (response) {
        // Get.off(() => LoginPage(),
        //     transition: Transition.fade, duration: Duration(seconds: 2));
      } else {
        Get.snackbar(
          "Register failed",
          "Please check your email or password",
          colorText: kBlack2,
          backgroundColor: Colors.red,
          icon: Icon(Icons.add_alert),
        );
      }
    });
  }
}
