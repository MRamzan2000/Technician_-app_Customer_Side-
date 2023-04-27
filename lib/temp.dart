import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Person_1 extends StatelessWidget {
  const Person_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          SizedBox(
            height: 60,
            child: Stack(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF89F5B),
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
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                                child: Icon(Icons.arrow_back)),
                          ),
                          Text(
                            "Person 1",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 60, top: 6),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/pic.jpg")),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff2F62BB),
                          blurRadius: 2,
                        )
                      ]),
                  height: 50,
                  width: 50,
                ),
              ),
            ]),
          ),
          SizedBox(height: 40),
          Text(
            "Today",
            style: TextStyle(fontSize: 12, color: Color(0xff3D3D3D)),
          ),
          // SizedBox(height: 30),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15),
          //   child: Row(
          //     children: [
          //       Container(
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 fit: BoxFit.cover,
          //                 image: AssetImage("assets/pic.jpg")),
          //             borderRadius: BorderRadius.all(Radius.circular(100)),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Color(0xff2F62BB),
          //                 blurRadius: 2,
          //               )
          //             ]),
          //         height: 50,
          //         width: 50,
          //       ),
          //       SizedBox(width: 10),
          //       Container(
          //         decoration: BoxDecoration(
          //           color: Color(0xff9C3587),
          //           borderRadius: BorderRadius.only(
          //               bottomLeft: Radius.circular(12),
          //               topRight: Radius.circular(12),
          //               bottomRight: Radius.circular(12)),
          //         ),
          //         height: 50,
          //         width: MediaQuery.of(context).size.width / 2,
          //         child: Padding(
          //           padding: const EdgeInsets.only(left: 10),
          //           child: Align(
          //             alignment: Alignment.centerLeft,
          //             child: Text(
          //               "Lorem ipsum dolor sit amet,\n adipiscing elit.",
          //               style: TextStyle(fontSize: 12, color: Colors.white),
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(height: 30),
          // Padding(
          //   padding: const EdgeInsets.only(right: 15),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       SizedBox(),
          //       Row(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //               color: Color(0xffE2E2E2),
          //               borderRadius: BorderRadius.only(
          //                   bottomLeft: Radius.circular(12),
          //                   topLeft: Radius.circular(12),
          //                   bottomRight: Radius.circular(12)),
          //             ),
          //             height: 45,
          //             width: MediaQuery.of(context).size.width / 2,
          //             child: Padding(
          //               padding: const EdgeInsets.only(left: 10),
          //               child: Align(
          //                 alignment: Alignment.centerLeft,
          //                 child: Text(
          //                   "Lorem ipsum dolor sit amet.",
          //                   style:
          //                       TextStyle(fontSize: 12, color: Colors.black),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           SizedBox(width: 10),
          //           Container(
          //             decoration: BoxDecoration(
          //                 image: DecorationImage(
          //                     fit: BoxFit.cover,
          //                     image: AssetImage("assets/pic.jpg")),
          //                 borderRadius:
          //                     BorderRadius.all(Radius.circular(100)),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Color(0xff2F62BB),
          //                     blurRadius: 2,
          //                   )
          //                 ]),
          //             height: 50,
          //             width: 50,
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffE2E2E2),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12)),
                                ),
                                height: 45,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Lorem ipsum dolor sit amet.",
                                      style:
                                      TextStyle(fontSize: 12, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/pic.jpg")),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xff2F62BB),
                                        blurRadius: 2,
                                      )
                                    ]),
                                height: 50,
                                width: 50,
                              ),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/pic.jpg")),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff2F62BB),
                                    blurRadius: 2,
                                  )
                                ]),
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff9C3587),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12)),
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Lorem ipsum dolor sit amet,\n adipiscing elit.",
                                  style:
                                      TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),


          // SizedBox(height: 30),
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
              height: 40,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 17, left: 10),
                      border: InputBorder.none,
                      hintText: "Type your message ",
                      hintStyle:
                          TextStyle(fontSize: 10, color: Color(0xff97AABD)),
                      suffixIcon: SvgPicture.asset(
                        "assets/Voice Icon.svg",
                        fit: BoxFit.scaleDown,
                      )),
                ),
              ),
            ),

        ],
      ),
    );
  }
}
