import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Bottom%20bar/Bottom_Bar.dart';
import 'package:technician_customer_side/Payment%20Details/Payment_Method.dart';

import '../Api/AddammouttoSellerwallerAPi.dart';
import '../Api/ApiServiceForStoringTransactions.dart';
import '../Api/ApiServiceForStoringTransactions.dart';
import '../Api/ApiServiceForStoringTransactions.dart';
import '../Api/ApiServiceoforCancellingOrders.dart';
import '../Api/RequestAmount.dart';

class Order_Detail extends StatefulWidget {

   final String id;
   final String status;
  final  String amount;
  final  String orderid;
  final String updatedamount;
  final String type;
  Order_Detail({Key? key,required this.id, required this.amount, required this.updatedamount, required this.type, required this.orderid, required this.status,}) : super(key: key);

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


  void initState(){
    super.initState();
    print(widget.amount);
    initialize();
    setState(() {
        updateamount.text = widget.updatedamount;
    });
    check();
  }
  check (){

    if(widget.status != "In Progress"){
      setState(() {
        visibility =true;
        payvisible =false;

      });
    }
    else {
      visibility  = false;
      payvisible = true;
    }


  }
  late bool visibility ;
  late bool payvisible ;
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
            SizedBox(height: 10),  SizedBox(height: 20),
            payvisible == false ?  Text( "Order Not Accepted Yet") : SizedBox(),
            SizedBox(height: 10),

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
            SizedBox(height: 20),


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
                      widget.type,
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
                          "Order Amount",
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          widget.amount,
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
                          "Requested Amount",
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
                                  enabled: visibility,
                                  controller: updateamount,
                                  keyboardType: TextInputType.number,

                                  decoration: InputDecoration(

                                    contentPadding: EdgeInsets.only(left: 20),
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
            Visibility(
              visible: visibility,
              child: SizedBox(
                width: 130,
                height: 30,
                child: ElevatedButton(
                    onPressed: () async{
                      print(widget.orderid);
                      print( widget.amount);


                      ApiServiceForAmount.updateamount(widget.orderid, updateamount.text).then((value) =>
                      {
                        if(value.message == "Order amount updated successfully"){
                          Navigator.of(context).pop(),
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Order Request Sent Successfully!'),

                          ))
                        }
                        else{
                          print(value.message.toString() + value.error.toString())
                        }

                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff9C3587),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32))),
                    child: Text(
                      "Request Amount",
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    )),
              ),
            ),
            SizedBox(height: 50),
            Visibility(
              visible: payvisible,
              child: SizedBox(
                width: 130,
                height: 30,
                child: ElevatedButton(
                    onPressed: () async{
                      print(widget.id);
                      Map<String ,dynamic> body = {
                        "seller" : widget.id.toString(),
                        "amount" : widget.amount
                      };
                      Map<String ,dynamic> body2 = {
                        "sellerid" : widget.id.toString(),
                          "userId" :  myid,
                        "date" : DateTime.now().toString(),
                        "amount" : widget.amount
                      };
                      print(body);
                     await ApiServiceForAddAmount.addAmount(body).then((value) async{
                       await ApiServiceForCompletingOrder.completeorder(widget.orderid).then((value) {
                         if(value.message=="Order successfully completed"){
                           Navigator.of(context)
                               .push(MaterialPageRoute(builder: (BuildContext context) {
                                 return Bottom_Bar();
                           }));
                           ApiServiceForStoringTransactions.storetransaction(body2).then((value) =>
                           {
                             print(body2)

                           });
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                             content: const Text('Payment Successfull!'),

                           ));
                         }
                       });
                     });
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
            ),


          ],
        ),
      ),
    );
  }
}
