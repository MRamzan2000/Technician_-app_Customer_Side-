import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_customer_side/Payment%20Details/Credit_Card.dart';
import 'package:technician_customer_side/Payment%20Details/Debit_Card.dart';

class Second_Payment_Method extends StatelessWidget {
  const Second_Payment_Method({Key? key}) : super(key: key);

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
              width: MediaQuery.of(context).size.width / 1.7,
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
                      "Payment Method",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          SvgPicture.asset(
            "assets/Payment method pic.svg",
            height: MediaQuery.of(context).size.height / 3,
          ),
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffe5d2e3),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: Offset(1.0, 2.0),
                  )
                ]),
            height: 100,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "By Card",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SvgPicture.asset("assets/Black DRop DOwn.svg"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Debit_Card();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff9C3587),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text(
                            "Debit Card",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Credit_Card();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffFFFFFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text(
                            "Credit Card",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff9C3587)),
                          )),
                    )
                  ],
                )
              ],
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
                    blurRadius: 2,
                    offset: Offset(1.0, 2.0),
                  )
                ]),
            height: 45,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Padding(
              padding: const EdgeInsets.only(top: 12, left: 15),
              child: Text(
                "By Cash on Hand",
                style: TextStyle(fontSize: 15, color: Colors.black),
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
                    blurRadius: 2,
                    offset: Offset(1.0, 2.0),
                  )
                ]),
            height: 45,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Padding(
              padding: const EdgeInsets.only(top: 12, left: 15),
              child: Text(
                "STC pay عبر ",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
