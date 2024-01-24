import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Bottom%20bar/Bottom_Bar.dart';
import 'package:technician_customer_side/Payment%20Details/Payment_Method.dart';

import '../Api/AddammouttoSellerwallerAPi.dart';
import '../Api/ApiServiceForAcceptOrders.dart';
import '../Api/ApiServiceForStoringTransactions.dart';
import '../Api/ApiServiceForStoringTransactions.dart';
import '../Api/ApiServiceForStoringTransactions.dart';
import '../Api/ApiServiceoforCancellingOrders.dart';
import '../Api/RequestAmount.dart';
import '../My Orders/My_Orders.dart';

class Order_Detail extends StatefulWidget {
  final String id;
  final String status;
  final String amount;
  final String orderid;
  final String updatedamount;
  final String type;

  Order_Detail({
    Key? key,
    required this.id,
    required this.amount,
    required this.updatedamount,
    required this.type,
    required this.orderid,
    required this.status,
  }) : super(key: key);

  @override
  State<Order_Detail> createState() => _Order_DetailState();
}

class _Order_DetailState extends State<Order_Detail> {
  TextEditingController updateamount = TextEditingController();

  String myid = "";

  void initialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      myid = prefs.getString("id") ?? "";
    });
  }

  void initState() {
    super.initState();
    print(widget.amount);
    initialize();
    setState(() {
      updateamount.text = widget.updatedamount;
    });
    check();
  }

  check() {
    if (widget.status != "In Progress") {
      setState(() {
        visibility = true;
        payvisible = false;
      });
    } else {
      visibility = false;
      payvisible = true;
    }
  }

  late bool visibility;

  late bool payvisible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      const Text(
                        "تفاصيل الطلب",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            payvisible == false
                ? const Text("لم يتم قبول الطلب حتى الآن")
                : const SizedBox(),
            const SizedBox(height: 10),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xfff8cdaa),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: const [
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
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              width: MediaQuery.of(context).size.width / 1.1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      widget.type,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    // Text(
                    //   "Lorem ipsum dolor sit amet, consectetu elit, sed do eiusmod tempor Lore\nm ipsum dolor sit amet, consectetu elit, sed do eiusmod tempor Lorem ip\nsum dolor sit ame, consectetu elit, sed do",
                    //   style: TextStyle(fontSize: 10, color: Colors.black),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Order Amount",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          widget.amount,
                          style: const TextStyle(
                              fontSize: 18, color: Color(0xffFBBB8A)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: const Color(0xffB4B5B5),
                      height: 0.5,
                      width: MediaQuery.of(context).size.width / 1.2,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "المبلغ المطلوب",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(1.0, 2.0))
                              ]),
                          height: 40,
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: Row(children: [
                            Expanded(
                                child: Center(
                              child: TextFormField(
                                enabled: false,
                                controller: updateamount,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    border: InputBorder.none),
                              ),
                            )),
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "SR",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Visibility(
              visible: visibility,
              child: SizedBox(
                width: 130,
                height: 30,
                child: ElevatedButton(
                    onPressed: () async {
                      ApiServiceForAcceptOrders.accept(
                              widget.orderid.toString())
                          .then((value) => {
                                if (value == true)
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'ORDER ACCEPTED Successfully!'))),
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return const My_Orders();
                                    }))
                                  }
                                else
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'ORDER  ACCEPTED Failed!'))),
                                  }
                              });

                      // ApiServiceForAmount.updateamount(widget.orderid, updateamount.text).then((value) =>
                      // {
                      //   if(value.message == "Order amount updated successfully"){
                      //     Navigator.of(context).pop(),
                      //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //       content: Text('Order Request Sent Successfully!'),
                      //
                      //     ))
                      //   }
                      //   else{
                      //     print(value.message.toString() + value.error.toString())
                      //   }
                      //
                      // });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff9C3587),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32))),
                    child: const Text(
                      "قبول",
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    )),
              ),
            ),
            const SizedBox(height: 50),
            Visibility(
              visible: payvisible,
              child: SizedBox(
                width: 130,
                height: 30,
                child: ElevatedButton(
                    onPressed: () async {
                      print(widget.id);
                      Map<String, dynamic> body = {
                        "seller": widget.id.toString(),
                        "amount": widget.amount
                      };
                      Map<String, dynamic> body2 = {
                        "sellerid": widget.id.toString(),
                        "userId": myid,
                        "date": DateTime.now().toString(),
                        "amount": widget.amount
                      };
                      print(body);
                      await ApiServiceForAddAmount.addAmount(body)
                          .then((value) async {
                        await ApiServiceForCompletingOrder.completeorder(
                                widget.orderid)
                            .then((value) {
                          if (value.message == "Order successfully completed") {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const Bottom_Bar();
                            }));
                            ApiServiceForStoringTransactions.storetransaction(
                                    body2)
                                .then((value) => {print(body2)});
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Payment Successfull!'),
                            ));
                          }
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff9C3587),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32))),
                    child: const Text(
                      "Pay Now",
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
