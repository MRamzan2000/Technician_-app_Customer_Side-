import 'dart:convert';

import '../Models/ForgotPassModel.dart';
import '../const.dart';
import 'package:http/http.dart' as http;
class ApiServiceForForgotPassword {
  static Future<ForgotPasswordModel> sendCodeToEmail(String email) async {
    const String URL = "${baseUrl}forgot-password/email";
    final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode({"email": email}));
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }

  static Future<ForgotPasswordModel> verifyCode(Map<String, dynamic> body) async {
    const String URL = "${baseUrl}forgot-password/code";
    final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode(body));
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }

  static Future<ForgotPasswordModel> changePassword(Map<String, dynamic> body) async {
    const String URL = "${baseUrl}forgot-password/password";
    final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode(body));
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }
}