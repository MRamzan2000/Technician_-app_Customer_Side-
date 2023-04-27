import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Cooling%20Services/Cooling_Services.dart';
import 'package:technician_customer_side/Select%20Schedule/Select_Schedule.dart';
import 'package:technician_customer_side/Sign%20In/Sign_In.dart';

import '../Api/SignOutApi.dart';
import '../Transactions/Transactions.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  String? name;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("firstname").toString();
    });
  }

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        drawer: Drawer(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(100))),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff653780),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(100)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                      )
                    ]),
                height: 130,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 70, bottom: 10),
                      child: SvgPicture.asset("assets/6396 [Converted].svg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 130),
                      child: SvgPicture.asset("assets/6350.svg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 45),
                            child: SizedBox(
                              height: 60,
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(32),
                                            bottomRight: Radius.circular(32)),
                                      ),
                                      height: 30,
                                      width: MediaQuery.of(context).size.width /
                                          2.1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        child: Center(
                                          child: Text(
                                            "HI! ${name}",
                                            // textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 6),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/pic.png.jpg")),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        border: Border.all(
                                            color: Colors.white, width: 0.5)),
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 35,
                                width: 35,
                                child: SvgPicture.asset(
                                  "assets/close drawr.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/transcatiion.svg"),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Transactions();
                        }));
                      },
                      child: Text(
                        "Transaction",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff233245)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/location.svg"),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Location",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff233245)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/logout.svg"),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                              title: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 30,
                                width: 30,
                                child: SvgPicture.asset(
                                  "assets/logout.svg",
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              content: Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 32,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xff9C3587),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32))),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white),
                                        )),
                                  ),
                                  SizedBox(width: 20),
                                  SizedBox(
                                    width: 100,
                                    height: 32,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _loading = true;
                                          });

                                          ApiServiceForSignOut.signOut()
                                              .then((value) => {
                                                    if (value.message ==
                                                        "Customer logged out successfully")
                                                      {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                          return Sign_In();
                                                        })),
                                                        setState(() {
                                                          _loading = false;
                                                        })
                                                      }
                                                    else
                                                      {
                                                        setState(() {
                                                          _loading = false;
                                                        }),
                                                        showCupertinoDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return CupertinoAlertDialog(
                                                              title:
                                                                  Text('Error'),
                                                              content: value
                                                                          .error ==
                                                                      null
                                                                  ? Text(value
                                                                      .message
                                                                      .toString())
                                                                  : Text(value
                                                                      .error
                                                                      .toString()),
                                                              actions: [
                                                                CupertinoDialogAction(
                                                                  child: Text(
                                                                      'Cancel'),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                                CupertinoDialogAction(
                                                                  child: Text(
                                                                      'OK'),
                                                                  onPressed:
                                                                      () {
                                                                    // Perform some action
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        )
                                                      }
                                                  });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xffFFFFFF),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32))),
                                        child: Text(
                                          "Sign out",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff9C3587)),
                                        )),
                                  ),
                                ],
                              )),
                        );
                      },
                      child: Text(
                        "Log Out",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff233245)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xff653780),
        body: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "We're Glad you are here",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          "assets/HS Ntofication.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 25,
                        width: 25,
                        child: Builder(builder: (context) {
                          return InkWell(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: SvgPicture.asset(
                              "assets/HS Drawer.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          );
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1.0, 2.0),
                            )
                          ]),
                      height: 40,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: SvgPicture.asset(
                            "assets/HS search box.svg",
                            fit: BoxFit.scaleDown,
                          ),
                          hintText: "Search any type of services",
                          hintStyle: TextStyle(
                              fontSize: 10, color: Color(0xffBAC0C0)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 5),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(1.0, 2.0),
                            )
                          ]),
                      height: 140,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cleaning Servive",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetu elit, sed\ndo eiusmod tempor Lorem ipsum dolor sit amet,\nconsectetu elit, sed do eiusmod tempor Lorem\nipsum dolor sit amet, consectetu elit, sed do",
                                  style: TextStyle(
                                      fontSize: 6, color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 100,
                                  height: 20,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(builder:
                                        //         (BuildContext context) {
                                        //   return Select_Schedule();
                                        // }));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xffF89F5B),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32))),
                                      child: Text(
                                        "Book Now",
                                        style: TextStyle(
                                            fontSize: 7, color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffffd19c),
                                  borderRadius: BorderRadius.circular(45)),
                              height: 140,
                              width: MediaQuery.of(context).size.width / 2.1,
                              child: SvgPicture.asset(
                                "assets/HS clean.svg",
                                fit: BoxFit.scaleDown,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Book a Service For",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 15),
                          //Electric Services
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Cooling_Services(
                                  type: 'Electric',
                                );
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0),
                                        )
                                      ]),
                                  height: 120,
                                  width: 150,
                                  child: SvgPicture.asset(
                                    "assets/Electric service.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0),
                                        )
                                      ]),
                                  height: 40,
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      "Electric Services",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Cooling_Services(
                                  type: 'Cooling',
                                );
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0),
                                        )
                                      ]),
                                  height: 120,
                                  width: 150,
                                  child: SvgPicture.asset(
                                    "assets/Cooling.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                SizedBox(height: 8),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 3,
                                            offset: Offset(1.0, 2.0),
                                          )
                                        ]),
                                    height: 40,
                                    width: 150,
                                    child: Center(
                                      child: Text(
                                        "Cooling Services",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 15),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Cooling_Services(
                                  type: 'Plumber',
                                );
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0),
                                        )
                                      ]),
                                  height: 120,
                                  width: 150,
                                  child: SvgPicture.asset(
                                    "assets/Plumber service.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0),
                                        )
                                      ]),
                                  height: 40,
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      "Plumber Services",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Cooling_Services(
                                  type: 'Heater',
                                );
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0),
                                        )
                                      ]),
                                  height: 120,
                                  width: 150,
                                  child: SvgPicture.asset(
                                    "assets/Heater service.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          offset: Offset(1.0, 2.0),
                                        )
                                      ]),
                                  height: 40,
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      "Heater Services",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
