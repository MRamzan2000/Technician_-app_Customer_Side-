import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

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
                      "Transactions",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(1.0, 2.0),
              )
            ]),
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/pic.png.webp"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(1.0, 2.0))
                            ]),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Inzmam Malik",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            "September 20,2023",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffBAC0C0)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "256SR",
                    style: TextStyle(fontSize: 16, color: Color(0xff653780)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(1.0, 2.0),
              )
            ]),
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/pic.png.webp"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(1.0, 2.0))
                            ]),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Inzmam Malik",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            "September 20,2023",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffBAC0C0)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "256SR",
                    style: TextStyle(fontSize: 16, color: Color(0xff653780)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(1.0, 2.0),
              )
            ]),
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/pic.png.webp"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(1.0, 2.0))
                            ]),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Inzmam Malik",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            "September 20,2023",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffBAC0C0)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "256SR",
                    style: TextStyle(fontSize: 16, color: Color(0xff653780)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(1.0, 2.0),
              )
            ]),
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/pic.png.webp"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(1.0, 2.0))
                            ]),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Inzmam Malik",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Text(
                            "September 20,2023",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffBAC0C0)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "256SR",
                    style: TextStyle(fontSize: 16, color: Color(0xff653780)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
