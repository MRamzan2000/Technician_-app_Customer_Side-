import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Api/GetSellerBytypeApi.dart';
import '../Models/GetSellersbyType.dart';
import '../Select Schedule/Select_Schedule.dart';
import 'Cooling_Page.dart';

class Cooling_Services extends StatefulWidget {
  String type;

  Cooling_Services({Key? key, required this.type}) : super(key: key);

  @override
  State<Cooling_Services> createState() => _Cooling_ServicesState();
}

class _Cooling_ServicesState extends State<Cooling_Services> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1,
                              offset: Offset(1.0, 2.0))
                        ]),
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      "assets/Back arrow.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 20),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SvgPicture.asset(
                          "assets/purple search box.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      hintText: "Search any type of services",
                      hintStyle:
                          TextStyle(fontSize: 10, color: Color(0xffBAC0C0)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1,
                                offset: Offset(1.0, 2.0))
                          ]),
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "assets/HS Ntofication.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1,
                                offset: Offset(1.0, 2.0))
                          ]),
                      height: 25,
                      width: 25,
                      child: Builder(builder: (context) {
                        return InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: SvgPicture.asset(
                            "assets/Call Svg.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        );
                      }),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  "${widget.type} Services",
                  style: TextStyle(fontSize: 16, color: Color(0xff8A8A8A)),
                ),
                SizedBox(width: 8),
                Container(
                  height: 2,
                  width: 10,
                  color: Color(0xff8A8A8A),
                ),
                SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff8A8A8A),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  height: 15,
                  width: 15,
                ),
                SizedBox(width: 5),
                Container(
                  height: 2,
                  width: 10,
                  color: Color(0xff8A8A8A),
                ),
                SizedBox(width: 8),
                Text(
                  "${widget.type} Services",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff8ccaa),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32),
                          bottomRight: Radius.circular(32)),
                    ),
                    height: 30,
                    width: 130,
                    child: Center(
                        child: Text(
                      "Installation",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
                  ),
                ),
                Container(
                  height: 0.5,
                  width: 200,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<SellersResponse>(
              stream:
                  ApiServiceForGetSellers.getSellers(widget.type).asStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  final sellers = snapshot.data!.sellers;
                  return ListView.builder(
                    itemCount: sellers!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final seller = sellers[index];
                      print(sellers.length);
                      if (sellers.length == 0) {
                        return Center(
                          child: Text("No Seller Found"),
                        );
                      } else {
                        return  Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xfffbceac),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          offset: Offset(0.0, 1.0))
                                    ]),
                                height: 110,
                                width:
                                MediaQuery.of(context).size.width / 3,
                                child: SvgPicture.asset(
                                  "assets/jfbgljkv.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFFFFFF),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(0.0, 1.0))
                                    ]),
                                height: 110,
                                width: 200,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              '${seller.firstname} ${seller.lastname}',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(32),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 2,
                                                      offset: Offset(
                                                          1.0, 2.0),
                                                    )
                                                  ]),
                                              height: 15,
                                              width: 30,
                                              child: Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 6),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/Star.svg"),
                                                    Text(
                                                      "4.2",
                                                      style: TextStyle(
                                                          fontSize: 6,
                                                          color: Color(
                                                              0xffF89F5B)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15),
                                        child: Container(
                                          height: 0.5,
                                          color: Colors.grey,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              2.1,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "Price =",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "150",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xffF89F5B)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          InkWell(
                                            onTap: () {
                                              if(seller.type=='Cooling'){
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) {
                                                      return CoolingPage(
                                                          id:  seller.id.toString(), name: seller.firstname.toString(),
                                                      );
                                                    }));
                                                print(seller.id);

                                              }else{
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) {
                                                      return Select_Schedule(
                                                        amount: '150',
                                                        type: seller.type.toString(),
                                                        id: seller.id.toString(),
                                                      );
                                                    }));
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                  Color(0xffF89F5B),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(32),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 1,
                                                      offset: Offset(
                                                          1.0, 2.0),
                                                    )
                                                  ]),
                                              height: 25,
                                              width: 80,
                                              child: Align(
                                                  alignment:
                                                  Alignment.center,
                                                  child: Text(
                                                    "Continue",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                        Colors.white),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  // handle error
                } else {
                  return CircularProgressIndicator();
                  // show loading indicator
                }
                return Text("data");
              },
            ),
          ),
        ],
      ),
    );
  }
}
