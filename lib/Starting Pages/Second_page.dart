import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Third_page.dart';



class Second_Page extends StatelessWidget {
  const Second_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffE53F71),
                        borderRadius: BorderRadius.circular(100),
                      boxShadow: [BoxShadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(1.0,2.0)
                      )]
                    ),
                    height: 30,
                    width: 30,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Third_Page();
                  }));},
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
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/Second Page.svg",
            height: MediaQuery.of(context).size.height / 3,
          ),
          SizedBox(height: 15),
          SvgPicture.asset("assets/Second page slider.svg"),
          Expanded(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/Seond Page svg.svg",
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
                                InkWell(onTap: (){Navigator.of(context)
                                  ..push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return Third_Page();
                                      }));},
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
                                )
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
