import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_customer_side/Payment%20Details/Payment_Method.dart';

import '../Api/AddammouttoSellerwallerAPi.dart';

class Order_Detail extends StatefulWidget {
  String id;
  Order_Detail({Key? key,required this.id}) : super(key: key);

  @override
  State<Order_Detail> createState() => _Order_DetailState();
}

class _Order_DetailState extends State<Order_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        "Order Detail",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff8cdaa),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0))
                    ]),
                height: 130,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: SvgPicture.asset(
                    "assets/minisplit-svgrepo-com.svg",
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              height: 200,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "Split Unit Cleaning",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetu elit, sed do eiusmod tempor Lore\nm ipsum dolor sit amet, consectetu elit, sed do eiusmod tempor Lorem ip\nsum dolor sit ame, consectetu elit, sed do",
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cleaning Price",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          "110 SR",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xffFBBB8A)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: Color(0xffB4B5B5),
                      height: 0.5,
                      width: MediaQuery.of(context).size.width / 1.2,
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Set Price",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(1.0, 2.0))
                              ]),
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: Row(
                            children:[
                              Expanded(child: Center(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,

                                  decoration: InputDecoration(

                                    border: InputBorder.none
                                  ),
                                ),
                              )
                              ),
                              Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "SR",
                                  style:
                                      TextStyle(fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ),
                ]
                          ),

                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 130,
              height: 30,
              child: ElevatedButton(
                  onPressed: () async{
                    Map<String ,dynamic> body = {
                      "seller" : widget.id.toString(),
                      "amount" : "100"
                    };
                   await ApiServiceForAddAmount.addAmount(body);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff9C3587),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                  child: Text(
                    "Pay Now",
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
