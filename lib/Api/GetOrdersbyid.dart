import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/const.dart';

import '../Models/OrdersModels.dart';
import 'package:http/http.dart' as http;

class ApiServiceForGetOrders {
  static Future<List<Order>> getOrders() async {
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("id").toString();


    final response = await http.get(Uri.parse('${baseUrl}customerOrders/${id}'));
    // print(object)
    // print('${baseUrl}customerOrders/$id');

    final String res = response.body;
    if (res != null) {
      try {
        print(res);
        final jsonData = json.decode(res) as Map<String, dynamic>?;
        final ordersJson = jsonData?['orders'] as List<dynamic>?;

        if (ordersJson != null) {
          final List<Order> orders =
          ordersJson.map((orderJson) => Order.fromJson(orderJson)).toList();
          return orders;
        }
      } catch (e) {
        print(e);
      }
    }

    return [];
  }
}