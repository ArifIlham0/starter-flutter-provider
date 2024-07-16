import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_frontend_flutter/models/request/auth/login_model.dart';
import 'package:starter_frontend_flutter/models/request/auth/register_model.dart';
import 'package:starter_frontend_flutter/models/response/auth/login_res_model.dart';
import 'package:starter_frontend_flutter/models/response/auth/profile_res_model.dart';
import 'package:starter_frontend_flutter/services/config.dart';

class AuthHelper {
  static var client = https.Client();

  static Future<bool> login(LoginModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.loginUrl);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = loginResponseModelFromJson(response.body).userToken;
      String? userId = loginResponseModelFromJson(response.body).id;
      String? profile = loginResponseModelFromJson(response.body).profile;

      DateTime now = DateTime.now();
      await prefs.setString("token", token!);
      await prefs.setString("tokenTime", now.toIso8601String());

      await prefs.setString("userId", userId!);
      await prefs.setString("profile", profile!);
      await prefs.setBool("loggedIn", true);

      print("Berhasil login ${jsonDecode(response.body)}");
      return true;
    } else {
      print("Gagal login ${jsonDecode(response.body)}");
      return false;
    }
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String? tokenTime = prefs.getString("tokenTime");

    if (token != null && tokenTime != null) {
      DateTime storedTime = DateTime.parse(tokenTime);
      DateTime now = DateTime.now();

      if (now.difference(storedTime).inDays > 19) {
        await prefs.remove("token");
        await prefs.remove("tokenTime");
        token = null;
      }
    }

    return token;
  }

  static Future<bool> register(RegisterModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.signupUrl);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  static Future<ProfileRes> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print("Token: $token");
    if (token == null) {
      throw Exception("Token is null");
    }

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': '$token'
    };

    var url = Uri.https(Config.apiUrl, Config.profileUrl);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var profile = profileResFromJson(response.body);
      print("Berhasil ambil profile ${response.body}");
      return profile;
    } else {
      throw Exception("Gagal ambil profil ${jsonDecode(response.body)}");
    }
  }
}
