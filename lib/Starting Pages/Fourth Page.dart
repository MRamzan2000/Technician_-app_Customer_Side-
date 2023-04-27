import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technician_customer_side/Sign%20In/Sign_In.dart';

class Fourth_Page extends StatelessWidget {
  const Fourth_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SvgPicture.asset(
                "assets/fourth page.svg",
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "You did it,\n you're in.",
              style: TextStyle(fontSize: 34, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              "    Welcome to Service now\nBook Your Service in One click!",
              style: TextStyle(fontSize: 12, color: Color(0xff646464)),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 130,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Sign_In();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff9C3587),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                  child: Text(
                    "Enter",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
