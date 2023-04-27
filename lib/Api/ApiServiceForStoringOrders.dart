import 'dart:convert';

import '../Models/SignUpModel.dart';
import '../Models/SotringOrdersModel.dart';
import '../const.dart';
import 'package:http/http.dart' as http;

class ApiServiceForStoringOrder {
  static Future<bool> storeorder(Map<String, dynamic> body) async {
    const String URL = baseUrl + "orders";
    final response = await http.post(Uri.parse(URL), headers: {"Content-Type": "application/json"}, body: json.encode(body));
    final String res = response.body;
    print(res);
    if (res != 'null') {
      print(res);
      try {
        final jsonData = json.decode(res) as Map<String, dynamic>;
        return true;
      } catch (e) {}
    }
    return false;
  }



//with the images


  // static Future<ResponseModel> storeOrder(Map<String, dynamic> body) async {
  //   const String URL = "${baseUrl}orders";
  //
  //   var headers = {
  //     "Content-Type": "application/json",
  //     // 'Authorization': 'Bearer ' + accessToken
  //   };
  //
  //   var imageUploadRequest = http.MultipartRequest('POST', Uri.parse(URL));
  //   imageUploadRequest.headers.addAll(headers);
  //
  //   // var imageUploadRequest = http.MultipartRequest('POST', Uri.parse(URL), headers ) ;
  //
  //   // imageUploadRequest.fields.addAll({
  //   //   'userId': '${body["userId"]}',
  //   //   'sellerId': '${body["sellerId"]}',
  //   //   'type': '${body["type"]}',
  //   //   'day':'${body["day"]}',
  //   //   'date':'${body["date"]}',
  //   //   'time': '${body["time"]}',
  //   //   'username':'${body["username"]}',
  //   //   'lat':'${body["lat"]}',
  //   //   'log': '${body["lon"]}',
  //   //   'amount': '${body["amount"]}',
  //   // });
  //   // print("object");
  //   imageUploadRequest.files.add(await http.MultipartFile.fromPath('image', '${body['image']}'));
  //   // imageUploadRequest.files.add(await http.MultipartFile.fromPath('emiratesIdBack', '${body['emiratesIdBack']}'));
  //   print(body);
  //   http.StreamedResponse response = await imageUploadRequest.send();
  //   final String res=await response.stream.bytesToString();
  //   print(res);
  //   if (res != 'null') {
  //     try {
  //       final jsonData = json.decode(res) as Map<String, dynamic>;
  //       print(res);
  //       // print(jsonData["status"]);
  //       // print(jsonData["message"]);
  //       return ResponseModel.fromJson(jsonData);
  //     } catch (e) {}
  //   }
  //   return ResponseModel( status: res );
  // }
}


