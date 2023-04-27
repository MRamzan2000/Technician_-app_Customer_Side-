import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Api/GetUserInfoAPi.dart';

import '../Models/SignOutModel.dart';
import '../Models/UserinfoModel.dart';
import '../const.dart';
import 'package:http/http.dart' as http;

class ApiServiceForUpdateUserInfo {
  static Future<User> updateinfo(Map<String, dynamic> body) async {


    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id").toString();
    String URL = "${baseUrl}updateCustomer/${id}";
    print("${baseUrl}updateCustomer/${id}");
    final response = await http.put(Uri.parse(URL) ,body: json.encode(body),headers:{'Content-Type':'Application/json','Accept':'Application/json'} );
    final String res = response.body;
    if (res != 'null') {
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        print(jsonData);
        return User.fromJson(jsonData);
      } catch (e) {
        print(e);
      }
    }
    return User();
  }
}