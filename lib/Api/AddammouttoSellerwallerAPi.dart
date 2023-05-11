import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../const.dart';

class ApiServiceForAddAmount{

  static Future<String> addAmount(Map<String, dynamic> body) async {
    String URL = "${baseUrl}wallet";
    final response = await  http.post(Uri.parse(URL),headers:{'Content-Type':'Application/json','Accept':'Application/json'},body: json.encode(body));
    final String res = response.body;
    if (res != 'null') {
      // print(res);
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        if(jsonData['message']=="Amount added to seller wallet"){
          return "Amount added to seller wallet";
        }
        else{
          return jsonData['message'];
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return "Error";
  }
}