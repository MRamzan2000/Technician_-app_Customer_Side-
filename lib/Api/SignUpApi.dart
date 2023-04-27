import 'dart:convert';

import '../Models/SignUpModel.dart';
import '../const.dart';
import 'package:http/http.dart' as http;

class ApiServiceForSignup {
  static Future<SignupResponse> signup(Map<String, dynamic> body) async {
    const String URL = baseUrl + "costumersignup";
    final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode(body));
    final String res = response.body;
    print(res);
    if (res != 'null') {
      print(res);
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        return SignupResponse.fromJson(jsonData);
      } catch (e) {}
    }
    return SignupResponse(message: 'An error occurred', id: null);
  }
}