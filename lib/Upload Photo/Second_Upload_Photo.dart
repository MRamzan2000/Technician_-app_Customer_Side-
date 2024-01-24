import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Cooling%20Services/Cooling_Services.dart';

import '../Api/ApiServiceForStoringOrders.dart';
import '../Bottom bar/Bottom_Bar.dart';
import '../notification_Services.dart';

class Second_Upload_Photo extends StatefulWidget {
  final File image;
  final String type;
  final String username;
  final String day;
  final String time;
  final String date;
  final String ammount;
  String id;

  Second_Upload_Photo(
      {Key? key,
      required this.image,
      required this.id,
      required this.type,
      required this.username,
      required this.day,
      required this.time,
      required this.date,
      required this.ammount})
      : super(key: key);

  @override
  State<Second_Upload_Photo> createState() => _Second_Upload_PhotoState();
}

class _Second_Upload_PhotoState extends State<Second_Upload_Photo> {
  DateTime timeStamp=DateTime.now();

  NotificationServices notificationServices = NotificationServices();
  String? firstname;
  String? lastname;
  String? fullName;
  String? senderDeviceToken;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String? phonenumber;
  Future<void> initialize() async {
    String? token = await _firebaseMessaging.getToken();
  final prefs = await SharedPreferences.getInstance();
setState(() {
  firstname = prefs.getString("firstname").toString();
  lastname = prefs.getString("lastname").toString();
  phonenumber = prefs.getString("phone").toString();
  if(token==null){
    log('No Token Get');
  }else{
    senderDeviceToken=token;

  }
  fullName="${prefs.getString("firstname")}${prefs.getString("lastname")}";
});
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 60),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xfff8cdaa),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0))
                    ]),
                height: 30,
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              "assets/Back arrow.svg",
                              fit: BoxFit.scaleDown,
                            )),
                      ),
                      const Text(
                        "Upload Photo",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // assuming that 'image' is the variable storing the selected image file
            Image(
              image: FileImage(widget.image),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.05,
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: 130,
              height: 30,
              child: ElevatedButton(
                  onPressed: () async {
                    notificationServices.storeNotification(fullName!,'Request for Order',deviceTokens.last,timeStamp);

                    notificationServices.getDeviceToken().then((value)async{

                      var data = {
                        'to' : deviceTokens.last,
                        'notification' : {
                          'title' : fullName ,
                          'body' : 'Request for Order' ,
                          "sound": "jetsons_doorbell.mp3",

                        },
                        'android': {
                          'notification': {
                            'notification_count': 23,
                          },
                        },
                        'data' : {
                          'type' : 'msj' ,
                          'id' : 'Asif taj',
                          'senderDeviceToken' : senderDeviceToken,
                        }
                      };

                      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                          body: jsonEncode(data) ,
                          headers: {
                            'Content-Type': 'application/json; charset=UTF-8',
                            'Authorization' : 'key=AAAAYiwiOvI:APA91bFauQQ6VzJ3pK1F1AGTNOQ_m3YGsQ5Mnrwptjl_DJfdoy-csfg_wGcCYns2th66tenp1LpS9rnYCF7n-lR2TQfnNbruIOfL3OxK9tIu_qDL8d9o9os5P78E1kpij2BUTGZnUlLv'
                          }
                      ).then((value){
                        if (kDebugMode) {
                          print(value.body.toString());
                        }
                      }).onError((error, stackTrace){
                        if (kDebugMode) {
                          print(error);
                        }
                      });
                    });
                    final prefs = await SharedPreferences.getInstance();

                    String id = prefs.getString("id").toString();
                    String address = prefs.getString("address").toString();
                    String lat = prefs.getString("lat").toString();
                    String long = prefs.getString("long").toString();
                    Map<String, dynamic> body = {
                      "userId": id.toString(),
                      "sellerId": widget.id.toString(),
                      "type": widget.type,
                      "date": widget.date,
                      "day": widget.day,
                      "time": widget.time,
                      "image": widget.image.path,
                      "amount": widget.ammount,
                      "address": address,
                      "latitude" :  lat,
                      "longitude" : long,
                      "username": widget.username
                    };

                    ApiServiceForStoringOrder.storeorder(body).then((value) => {
                          if (value == true)
                            {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const Bottom_Bar();
                              })),
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content:  Text(' تم إرسا ل الطلب بنجاح'),


                              )),


                    }
                          else
                            {print("error")}
                        });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff9C3587),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                  child: const Text(
                    "استمرار",
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
