

import 'dart:convert';

import '../Models/ForgotPassModel.dart';
import '../const.dart';
import 'package:http/http.dart' as http;

class ApiServiceForCancellingOrder {

  static Future<ForgotPasswordModel> cancelorder(String id) async {
    String URL = "${baseUrl}orders/${id}/cancel";
    final response = await http.put(Uri.parse(URL), headers: {"Content-Type": "application/json"});
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }
}

class ApiServiceForCompletingOrder {

  static Future<ForgotPasswordModel> completeorder(String id) async {
    String URL = "${baseUrl}orders/${id}/complete";
    final response = await http.put(Uri.parse(URL), headers: {"Content-Type": "application/json"});
    final String res = response.body;
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }
}