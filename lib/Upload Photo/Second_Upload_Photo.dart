import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Order%20Detail/Order_Detail.dart';

import '../Api/ApiServiceForStoringOrders.dart';
import '../Bottom bar/Bottom_Bar.dart';
import 'Upload_Photo.dart';

class Second_Upload_Photo extends StatefulWidget {
  final File image;
  String id;
  Second_Upload_Photo({Key? key,required this.image,required this.id}) : super(key: key);

  @override
  State<Second_Upload_Photo> createState() => _Second_Upload_PhotoState();
}

class _Second_Upload_PhotoState extends State<Second_Upload_Photo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
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
                    Text(
                      "Upload Photo",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            "assets/Image 28.png",
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1.05,
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 130,
            height: 30,
            child: ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  String id = prefs.getString("id").toString();
                  print(id);
                  print(widget.id);
                  Map<String , dynamic>  body=  {

                      "userId": id.toString(),
                      "sellerId": widget.id.toString(),
                      "type": "Heater",
                      "date": "2023-04-15T09:00:00Z",
                      "day": "Friday",
                      "time": "09:00 AM",
                      "image": widget.image.path,
                      "amount": "50.00",
                       "lat" : "10",
                       "lon" : "10",
                       "username" : "hello"
                  };
                  ApiServiceForStoringOrder.storeorder(body).then((value) => {
                    if(value == true)
                  {
                    print("Asd"),
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                      return Bottom_Bar();
                    }))

                  }else{
                      print("error")
                    }
                  });
                  // Map<String ,dynamic> body = {
                  //   "userId": "6439f15ae98af0dc09c16bcf",
                  //   "sellerId": "643944727c89ea515877c546",
                  //   "type": "Heater",
                  //   "date": "2023-04-15T09:00:00Z",
                  //   "day": "Friday",
                  //   "time": "09:00 AM",
                  //   "image": widget.image.path,
                  //   "amount": "50.00",
                  //   "lat" : "10",
                  //   "lon" : "10",
                  //   "username" : "hello"
                  // };
                  // ApiServiceForStoringOrder.storeOrder(body).then((value) => {
                  //   // print(value.status),
                  //   if(value.status == "Success"){
                  //     Navigator.of(context)
                  //         .push(MaterialPageRoute(builder: (BuildContext context) {
                  //       return Bottom_Bar();
                  //     }))
                  //   }else{
                  //     showCupertinoDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return CupertinoAlertDialog(
                  //           title: value.status == null ?  Text(value.message.toString()) : Text(value.status.toString()),
                  //           content: Text(value.message.toString()),
                  //           actions: [
                  //             CupertinoDialogAction(
                  //               child: Text('Cancel'),
                  //               onPressed: () {
                  //                 Navigator.of(context).pop();
                  //               },
                  //             ),
                  //             CupertinoDialogAction(
                  //               child: Text('OK'),
                  //               onPressed: () {
                  //                 // Perform some action
                  //                 Navigator.of(context).pop();
                  //               },
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     )
                  //   }
                  // });

                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff9C3587),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
                child: Text(
                  "Proceed",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
