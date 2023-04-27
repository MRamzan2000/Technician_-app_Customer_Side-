import 'dart:convert';

import 'package:technician_customer_side/const.dart';

import '../Models/GetSellersbyType.dart';
import 'package:http/http.dart' as http;


class ApiServiceForGetSellers {
  static Future<SellersResponse> getSellers(type) async {
    final response = await http.get(Uri.parse('${baseUrl}sellers/${type}'));

    // print('${base64Url}sellers/Cooling');
    final String res = response.body;
    // print(res);
    if (res != 'null') {
      try {
        // print(res);
        final jsonData = json.decode(res) as Map<String, dynamic>;
        final SellersResponse sellers = SellersResponse.fromJson(jsonData);
        return sellers;
      } catch (e) {
        print(e);
      }
    }
    return SellersResponse();
  }
}