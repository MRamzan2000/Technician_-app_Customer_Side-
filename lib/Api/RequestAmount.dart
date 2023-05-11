import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/ForgotPassModel.dart';
import '../const.dart';


class ApiServiceForAmount {

  static Future<ForgotPasswordModel> updateamount(String orderId , String amount) async {
    final String URL = "${baseUrl}updateOrderAmount/${orderId}/${amount}";
    // print(URL);
    final response = await http.put(Uri.parse(URL), headers: {"Content-Type": "application/json"},);
    final String res = response.body;
    // print(res);
    if (res != 'null') {
      final jsonData = json.decode(res) as Map<String, dynamic>;
      return ForgotPasswordModel.fromJson(jsonData);
    }
    return ForgotPasswordModel(message: 'An error occurred');
  }

}