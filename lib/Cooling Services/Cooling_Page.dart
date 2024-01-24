import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Api/GetSellerBytypeApi.dart';
import '../Models/GetSellersbyType.dart';
import '../Select Schedule/Select_Schedule.dart';

class CoolingPage extends StatefulWidget {
  String name;
  String id;

  CoolingPage({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  State<CoolingPage> createState() => CoolingPageState();
}

class CoolingPageState extends State<CoolingPage> {
  List<int> count = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
  String type = " ";
  String amount = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1,
                                offset: Offset(1.0, 2.0))
                          ]),
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "assets/Back arrow.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),

                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 20),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SvgPicture.asset(
                            "assets/purple search box.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        hintText: " نوع الخدمة",
                        hintStyle: const TextStyle(
                            fontSize: 10, color: Color(0xffBAC0C0)),
                      ),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(100),
                  //           boxShadow: [
                  //             const BoxShadow(
                  //                 color: Colors.grey,
                  //                 blurRadius: 1,
                  //                 offset: Offset(1.0, 2.0))
                  //           ]),
                  //       height: 25,
                  //       width: 25,
                  //       child: SvgPicture.asset(
                  //         "assets/HS Ntofication.svg",
                  //         fit: BoxFit.scaleDown,
                  //       ),
                  //     ),
                  //     const SizedBox(width: 5),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(100),
                  //           boxShadow: [
                  //             const BoxShadow(
                  //                 color: Colors.grey,
                  //                 blurRadius: 1,
                  //                 offset: Offset(1.0, 2.0))
                  //           ]),
                  //       height: 25,
                  //       width: 25,
                  //       child: Builder(builder: (context) {
                  //         return InkWell(
                  //           onTap: () {
                  //             Scaffold.of(context).openDrawer();
                  //           },
                  //           child: SvgPicture.asset(
                  //             "assets/Call Svg.svg",
                  //             fit: BoxFit.scaleDown,
                  //           ),
                  //         );
                  //       }),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
            // const SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15),
            //   child: Row(
            //     children: [
            //       const Text(
            //         "All Services",
            //         style: TextStyle(fontSize: 16, color: Color(0xff8A8A8A)),
            //       ),
            //       const SizedBox(width: 8),
            //       Container(
            //         height: 2,
            //         width: 10,
            //         color: const Color(0xff8A8A8A),
            //       ),
            //       const SizedBox(width: 5),
            //       Container(
            //         decoration: BoxDecoration(
            //           color: const Color(0xff8A8A8A),
            //           borderRadius: BorderRadius.circular(100),
            //         ),
            //         height: 15,
            //         width: 15,
            //       ),
            //       const SizedBox(width: 5),
            //       Container(
            //         height: 2,
            //         width: 10,
            //         color: const Color(0xff8A8A8A),
            //       ),
            //       const SizedBox(width: 8),
            //       const Text(
            //         "Cooling Services",
            //         style: TextStyle(fontSize: 16, color: Colors.black),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xfff8ccaa),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(32),
                            bottomRight: Radius.circular(32)),
                      ),
                      height: 30,
                      width: 130,
                      child: const Center(
                          child: Text(
                         " اختر فني",
                        // "Installation",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                    ),
                  ),
                  Container(
                    height: 0.5,
                    width: 200,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/jfbgljkv.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Split Unit =",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "150 SR",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xffF89F5B)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "3< 100 SR per unit",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[0]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[0].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[0] != 0) {
                                                    count[0]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type =
                                          "Cooling->Installation->Split Unit";
                                      amount = '0';
                                      if (count[0] <= 3) {
                                        amount = (100 * count[0]).toString();
                                      } else {
                                        amount = (150 * count[0]).toString();
                                      }
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/air-conditioner-air-conditioning-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "asd",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Window Unit",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "On Inspection",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[1]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[1].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[1] != 0) {
                                                    count[1]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type =
                                          "Cooling->Installation->Window Unit";
                                      amount = '0';
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/cpu-fan-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Cassette Unit",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "On Inspection",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[2]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[2].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[2] != 0) {
                                                    count[2]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type =
                                          "Cooling->Installation->Cassette Unit";
                                      amount = '0';
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/299-2992841_complete-order-comments-order-icon-png-transparent.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Standing Unit =",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "350 SR",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xffF89F5B)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "3< 300 SR per unit",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[3]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[3].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[3] != 0) {
                                                    count[3]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type =
                                          "Cooling->Installation->Standing Unit";
                                      amount = '0';
                                      if (count[3] <= 3) {
                                        amount = (300 * count[3]).toString();
                                      } else {
                                        amount = (350 * count[3]).toString();
                                      }
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xfff8ccaa),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32)),
                          ),
                          height: 30,
                          width: 130,
                          child: const Center(
                              child: Text(
                            "Cleaning",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                        ),
                      ),
                      Container(
                        height: 0.5,
                        width: 200,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/jfbgljkv.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Split Unit =",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "110 SR",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xffF89F5B)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "3 <= 90 SR per unit",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[4]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[4].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[4] != 0) {
                                                    count[4]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type = "Cooling->Cleaning->Split Unit";
                                      amount = '0';
                                      if (count[4] <= 3) {
                                        amount = (90 * count[4]).toString();
                                      } else {
                                        amount = (110 * count[4]).toString();
                                      }
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/air-conditioner-air-conditioning-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Window Unit =",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "100 SR",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xffF89F5B)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "3<80 SR per unit",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[5]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[5].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[5] != 0) {
                                                    count[5]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type = "Cooling->Cleaning->Window Unit";
                                      amount = '0';
                                      if (count[5] <= 3) {
                                        amount = (80 * count[5]).toString();
                                      } else {
                                        amount = (100 * count[5]).toString();
                                      }
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/cpu-fan-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Cassette Unit",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "On Inspection",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[6]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[6].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[6] != 0) {
                                                    count[6]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type = "Cooling->Cleaning->Cassette Unit";
                                      amount = '0';
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/cpu-fan-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Standing Unit =",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "120 SR",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xffF89F5B)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "3< 100 SR per unit",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[7]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[7].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[7] != 0) {
                                                    count[7]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type = "Cooling->Cleaning->Standing Unit";
                                      amount = '0';
                                      if (count[7] <= 3) {
                                        amount = (100 * count[7]).toString();
                                      } else {
                                        amount = (120 * count[7]).toString();
                                      }
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/air-conditioner-air-conditioning-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Central ( Hidden + Package )",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "On Inspection",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[8]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[8].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[8] != 0) {
                                                    count[8]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type =
                                          "Cooling->Cleaning->Central(Hidden+Package)";
                                      amount = '0';
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/gas-cylinder-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Freon Gas",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "On Inspection",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xffF89F5B)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[9]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[9].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[9] != 0) {
                                                    count[9]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type =
                                          "Cooling->Cleaning->Inspect or Refill";
                                      amount = '0';
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xfff8ccaa),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32)),
                          ),
                          height: 30,
                          width: 130,
                          child: const Center(
                              child: Text(
                            "Replace",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                        ),
                      ),
                      Container(
                        height: 0.5,
                        width: 200,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/jfbgljkv.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Split Unit =",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "220 SR",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xffF89F5B)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "3 <= 200 SR per unit",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[10]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[10].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[10] != 0) {
                                                    count[10]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type = "Cooling->Replace->Split Unit";
                                      amount = '0';
                                      if (count[10] <= 3) {
                                        amount = (200 * count[10]).toString();
                                      } else {
                                        amount = (220 * count[10]).toString();
                                      }
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/air-conditioner-air-conditioning-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "asd",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Window Unit",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "On Inspection",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[11]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[11].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[11] != 0) {
                                                    count[11]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type = "Cooling->Replace->Window Unit";
                                      amount = '0';
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/cpu-fan-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Cassette Unit",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "On Inspection",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[12]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[12].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[12] != 0) {
                                                    count[12]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type = "Cooling->Replace->Cassette Unit";
                                      amount = '0';
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/299-2992841_complete-order-comments-order-icon-png-transparent.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Standing Unit =",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "500 SR",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xffF89F5B)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "3 <= 465 SR per unit",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[13]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[13].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[13] != 0) {
                                                    count[13]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type = "Cooling->Replace->Standing Unit";
                                      amount = '0';
                                      if (count[13] <= 3) {
                                        amount = (465 * count[13]).toString();
                                      } else {
                                        amount = (500 * count[13]).toString();
                                      }
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xfff8ccaa),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32),
                                bottomRight: Radius.circular(32)),
                          ),
                          height: 30,
                          width: 130,
                          child: const Center(
                              child: Text(
                            "Others",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                        ),
                      ),
                      Container(
                        height: 0.5,
                        width: 200,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfffbceac),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: MediaQuery.of(context).size.width / 3,
                        child: SvgPicture.asset(
                          "assets/duplicate-svgrepo-com.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  offset: Offset(0.0, 1.0))
                            ]),
                        height: 110,
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 15,
                                      width: 30,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/Star.svg"),
                                            const Text(
                                              "4.2",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Color(0xffF89F5B)),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: const [
                                  Text(
                                    "Others",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "On Inspection",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff8A8A8A)),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 2,
                                            offset: Offset(0.0, 1.0),
                                          )
                                        ]),
                                    height: 25,
                                    width: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  count[14]++;

                                                  print("object");
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/+.svg")),
                                          ),
                                          Text(
                                            count[14].toString(),
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  if (count[14] != 0) {
                                                    count[14]--;
                                                  }
                                                },
                                                child: SvgPicture.asset(
                                                    "assets/-.svg")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      type = "Cooling->Other";
                                      amount = '0';
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return Select_Schedule(
                                          type: type,
                                          amount: amount,
                                          id: widget.id.toString(),
                                        );
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF89F5B),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 1,
                                              offset: Offset(1.0, 2.0),
                                            )
                                          ]),
                                      height: 25,
                                      width: 80,
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            " استمرار",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
