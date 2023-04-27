import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/My%20Orders/Second_My_Orders.dart';

import '../Api/GetOrdersbyid.dart';
import '../Meesages/Messages/ChatScreen.dart';
import '../Models/OrdersModels.dart';
import '../Order Detail/Order_Detail.dart';

class My_Orders extends StatefulWidget {
  const My_Orders({Key? key}) : super(key: key);

  @override
  State<My_Orders> createState() => _My_OrdersState();
}

class _My_OrdersState extends State<My_Orders> {


  @override
  void initState(){
    super.initState();

    inititialize();


  }
  String myid = "";

  inititialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      myid =prefs.getString("id").toString();
    });


  }




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
              width: MediaQuery.of(context).size.width / 2.1,
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
                      "My Orders",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Order>>(
              stream: Stream.fromFuture(ApiServiceForGetOrders.getOrders()),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final orders = snapshot.data!;

                  if(orders.isEmpty){
                    return Center(
                      child: Text("No Orders Yet"),
                    );
                  }
                  else {
                    return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      print(order.id);
                      String timestamp = order.timestamp.toString();
                      DateTime dateTime = DateTime.parse(timestamp);
                      String date =
                          "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                      String time =
                          "${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
                      return InkWell(
                        onTap: (){
                          print(order.username);
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (BuildContext context) {
                            return Order_Detail(id:  order.seller.toString(),);
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(1.0, 2.0),
                                  )
                                ]),
                            height: 110,
                            // width: MediaQuery.of(context).size.width / 1.1,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff8cdaa),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 105,
                                  width: MediaQuery.of(context).size.width / 3.1,
                                  child: SvgPicture.asset(
                                    "assets/minisplit-svgrepo-com.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              order.username.toString(),
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {

                                                    // Navigator.of(context).push(
                                                    //     MaterialPageRoute(
                                                    //         builder:
                                                    //             (BuildContext
                                                    //                 context) {
                                                    //   return Person_1();
                                                    // }));
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 1,
                                                              offset: Offset(
                                                                  1.0, 2.0))
                                                        ]),
                                                    height: 25,
                                                    width: 25,
                                                    child: IconButton(
                                                      onPressed: (){
                                                        print(orders[index].seller.toString());
                                                        // print(orders[index].sellerId);
                                                        Navigator.of(context)
                                                            .push(MaterialPageRoute(builder: (BuildContext context) {
                                                          return ChatScreen(myUserId:myid.toString(),otherUserId: orders[index].seller.id.toString(),);
                                                        }));
                                                      },
                                                      icon:  SvgPicture.asset(
                                                        "assets/Message Svg.svg",
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return Second_My_Orders();
                                                    }));
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 1,
                                                              offset: Offset(
                                                                  1.0, 2.0))
                                                        ]),
                                                    height: 25,
                                                    width: 25,
                                                    child: SvgPicture.asset(
                                                      "assets/Call Svg.svg",
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          height: 0.5,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  3,
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              "Split Unit Clean",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "${order.amount.toString()} SR",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              date.toString(),
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              time.toString(),
                                              style: const TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              32)),
                                                            ),
                                                            height: 70,
                                                            width: 40,
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  width: 130,
                                                                  height: 23,
                                                                  child:
                                                                      ElevatedButton(
                                                                          onPressed:
                                                                              () {},
                                                                          style: ElevatedButton.styleFrom(
                                                                              primary:
                                                                                  Color(0xffFFFFFF),
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
                                                                          child: Text(
                                                                            "Confirm Cancel",
                                                                            style: TextStyle(
                                                                                fontSize: 12,
                                                                                color: Color(0xff9C3587)),
                                                                          )),
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                SizedBox(
                                                                  width: 130,
                                                                  height: 23,
                                                                  child:
                                                                      ElevatedButton(
                                                                          onPressed:
                                                                              () {},
                                                                          style: ElevatedButton.styleFrom(
                                                                              primary:
                                                                                  Color(0xff9C3587),
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
                                                                          child: Text(
                                                                            "Back",
                                                                            style: TextStyle(
                                                                                fontSize: 12,
                                                                                color: Colors.white),
                                                                          )),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Color(0xffFFFFFF),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          32),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          32)))),
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color(0xffE53F71)),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                      //   ListTile(
                      //   title: Text(order.type),
                      //   subtitle: Text(order.date.toString()),
                      //   trailing: Text('\$${order.amount}'),
                      // )
                      ;
                    },
                  );
                  }
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),


        ],
      ),
    );
  }
}
