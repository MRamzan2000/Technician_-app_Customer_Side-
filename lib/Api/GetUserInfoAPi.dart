import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Models/SignOutModel.dart';
import '../Models/UserinfoModel.dart';
import '../const.dart';
import 'package:http/http.dart' as http;

class ApiServiceForGetUserInfo {
  static Future<User> getinfo() async {


    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id").toString();
    String URL = "${baseUrl}customer/${id}";
    // String id = prefs.getString("id").toString();
    // print(id);
    String token = prefs.getString("token").toString();
    final response = await http.get(Uri.parse(URL));
    print("this is the body: " + response.body);
    // final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode(
    //     {
    //       "customerId": id
    //     }));
    final String res = response.body;
    // print(res);
    if (res != 'null') {
      // print(res);
      try {

        final jsonData = json.decode(res) as Map<String, dynamic>;
        print(jsonData["phonenumber"]);

         prefs.setString("firstname", jsonData["firstname"]).toString();
         prefs.setString("lastname", jsonData["lastname"]).toString();
         prefs.setString("phone", jsonData["phonenumber"]).toString();
         prefs.setString("city", jsonData["city"]).toString();
        prefs.setString("dateofbirth", jsonData["dateofbirth"]).toString();
        prefs.setString("createdAt", jsonData["createdAt"]).toString();

       String dateob =prefs.getString("dateofbirth")!;
       print(dateob);


        return User.fromJson(jsonData);
      } catch (e) {
        print(e);
      }
    }
    return User();
  }
}