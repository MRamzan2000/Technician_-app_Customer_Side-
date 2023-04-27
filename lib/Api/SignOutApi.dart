import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Models/SignOutModel.dart';
import '../const.dart';
import 'package:http/http.dart' as http;

class ApiServiceForSignOut {
  static Future<LogOutModel> signOut() async {
    const String URL = "${baseUrl}customer/logout";
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id").toString();
    print(id);
    String token = prefs.getString("token").toString();
    final response = await http.put(Uri.parse(URL) ,  headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: json.encode(
        {
          "userId": id
        }) );
    // final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode(
    //     {
    //       "customerId": id
    //     }));
    final String res = response.body;
    print(res);
    if (res != 'null') {
      print(res);
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        prefs.remove("id");
        prefs.remove("token");
        return LogOutModel.fromJson(jsonData);
      } catch (e) {
        print(e);
      }
    }
    return LogOutModel(message: 'An error occurred', );
  }
}