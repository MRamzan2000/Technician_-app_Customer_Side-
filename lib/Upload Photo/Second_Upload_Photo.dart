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
          // assuming that 'image' is the variable storing the selected image file
          Image(
            image: FileImage(widget.image),
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
                  String address = prefs.getString("address").toString();
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
                    "username": widget.username
                  };
                  ApiServiceForStoringOrder.storeorder(body).then((value) => {
                        if (value == true)
                          {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Bottom_Bar();
                            })),
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Order Request Sent Successfully!'),

                            ))
                          }
                        else
                          {print("error")}
                      });
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
