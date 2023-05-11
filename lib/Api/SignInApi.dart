import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Api/GetUserInfoAPi.dart';

import '../Models/SignInModel.dart';
import '../const.dart';
import 'package:http/http.dart' as http ;

class ApiServiceForSignIn {
  static Future<SignInResponse> signin(Map<String, dynamic> body) async {


    const String URL = baseUrl + "costumersignin";
    final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode(body));
    final String res = response.body;

    // print(res);
    if (res != '') {
      // print(res);
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        print(jsonData);
        final prefs = await SharedPreferences.getInstance();
         prefs.setString("id", jsonData["id"]).toString();
         prefs.setString("token", jsonData["token"]).toString();
        ApiServiceForGetUserInfo.getinfo();
        return SignInResponse.fromJson(jsonData);
      } catch (e) {

      }
    }
    return SignInResponse(message: res, userId: '', );
  }
}