import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_customer_side/Sign%20In/Sign_In.dart';
import 'package:technician_customer_side/Starting%20Pages/Fourth%20Page.dart';

import 'Second_page.dart';

class First_Page extends StatelessWidget {
  const First_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Sign_In();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffE53F71),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(70)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 3,
                          offset: Offset(1.0, 2.0))
                    ]),
                height: 85,
                width: MediaQuery.of(context).size.width / 4,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 70),
          SvgPicture.asset(
            "assets/First Page.svg",
            height: MediaQuery.of(context).size.height / 4.5,
          ),
          SizedBox(height: 50),
          SvgPicture.asset("assets/First page Slider.svg"),
          Expanded(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/starting svg.svg",
                  fit: BoxFit.cover,
                ),
                Transform.translate(
                  offset: Offset(50, -60),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/design.svg")),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Lorem ipsum dolor\n sit amet consectur",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetu\n          elit, sed do eiusmod tempor",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                      ..push(MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return Second_Page();
                                      }));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffE53F71),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(-12, 0),
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(-60, 60),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: SvgPicture.asset("assets/second Design.svg")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
