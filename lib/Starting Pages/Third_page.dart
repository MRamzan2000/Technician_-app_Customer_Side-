import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technician_customer_side/Starting%20Pages/Fourth%20Page.dart';

class Third_Page extends StatelessWidget {
  const Third_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 70),
            SvgPicture.asset(
              "assets/third page.svg",
              height: MediaQuery.of(context).size.height / 3,
            ),
            SizedBox(height: 20),
            SvgPicture.asset("assets/third page slider.svg"),
            Expanded(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/Path 3.svg",
                    fit: BoxFit.cover,
                  ),
                  Transform.translate(
                    offset: Offset(50, -10),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset("assets/design.svg")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Transform.translate(
                          offset: Offset(0, -75),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
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
                            SizedBox(
                              height: 80,

                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                          ..push(MaterialPageRoute(
                                              builder: (BuildContext context) {
                                            return Fourth_Page();
                                          }));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffE53F71),
                                          borderRadius:
                                              BorderRadius.circular(100),
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
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-70, 70),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: SvgPicture.asset("assets/second Design.svg")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
