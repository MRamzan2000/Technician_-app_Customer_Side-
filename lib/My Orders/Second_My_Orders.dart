import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_customer_side/Account/Account.dart';

class Second_My_Orders extends StatelessWidget {
  const Second_My_Orders({Key? key}) : super(key: key);

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
          SizedBox(height: 50),
          Text(
            "No Orders Yet",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          SizedBox(height: 20),
          SvgPicture.asset(
            "assets/Question mark.svg",
            height: MediaQuery.of(context).size.height / 3,
          ),
          SizedBox(height: 70),
          SizedBox(
            width: 130,
            height: 30,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff9C3587),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
                child: Text(
                  "Book Now",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
