import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_frontend_flutter/models/request/auth/login_model.dart';
import 'package:starter_frontend_flutter/services/helpers/auth_helper.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/ui/home_screen.dart';

class LoginProvider extends ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();
  final profileFormKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _firstTime = true;
  bool? _entrypoint;
  bool? _loggedIn;
  bool _isLoading = false;

  bool get obscureText => _obscureText;
  bool get firstTime => _firstTime;
  bool get entrypoint => _entrypoint ?? false;
  bool get loggedIn => _loggedIn ?? false;
  bool get isLoading => _isLoading;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  set firstTime(bool value) {
    _firstTime = value;
    notifyListeners();
  }

  set entrypoint(bool value) {
    _entrypoint = value;
    notifyListeners();
  }

  set loggedIn(bool value) {
    _loggedIn = value;
    notifyListeners();
  }

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    entrypoint = prefs.getBool('entrypoint') ?? false;
    loggedIn = prefs.getBool('loggedIn') ?? false;
    firstTime = prefs.getBool('firstTime') ?? true;
  }

  bool validateAndSave() {
    final form = loginFormKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  bool validateProfile() {
    final form = profileFormKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  userLogin(LoginModel model) async {
    setIsLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? firstTimes = await prefs.getBool('firstTime');
    bool? agent = await prefs.getBool('agent');
    AuthHelper.login(model).then((response) {
      setIsLoading = false;
      if (response && firstTimes == true && agent != true) {
        Get.off(() => HomeScreen());
      } else if (response && !firstTime) {
        Get.off(() => HomeScreen());
      } else if (response && agent == true) {
        Get.off(() => HomeScreen());
      } else if (!response) {
        Get.snackbar(
          "Login Failed",
          "Please check your credentials",
          colorText: kBlack,
          backgroundColor: Colors.red,
          icon: Icon(Icons.add_alert),
        );
      }
    });
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    await prefs.setBool('firstTime', false);
    await prefs.remove('token');
    await prefs.remove("tokenTime");
    _firstTime = false;
  }
}
