import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/TransactionsModel.dart';
import '../const.dart';

class ApiService {
  static Future<TransactionsList> getTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id").toString();
    // print(id);
    final response = await http.get(Uri.parse('$baseUrl'+'transactions/${id}'));
    // print(response.body);
    // print('$baseUrl'+'transactions/${id}');
        if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)['transactions'];
      return TransactionsList.fromJson(json);
    } else {
      throw Exception('Failed to load transactions');
    }
  }

}
