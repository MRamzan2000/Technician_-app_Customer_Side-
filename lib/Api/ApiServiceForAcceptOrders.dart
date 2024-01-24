import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../const.dart';

class ApiServiceForAcceptOrders {
  static Future<bool> accept(String orderid) async {
    final prefs = await SharedPreferences.getInstance();
    String token=prefs.getString('token').toString();
    String URL = "${baseUrl}orders/$orderid/accept";
    final response = await http.put(Uri.parse(URL),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final String res = response.body;
    print(res);
    if (res != 'null') {
      print(res);
      try {
        final jsonData = json.decode(res);
        if(jsonData['message']=='Order successfully accepted'){
          return true;
        }
      } catch (e) {
        print(e.toString());
      }
    }
    return false;
  }
}