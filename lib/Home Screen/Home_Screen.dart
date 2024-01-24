import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Cooling%20Services/Cooling_Services.dart';
import 'package:technician_customer_side/Sign%20In/Sign_In.dart';
import 'package:http/http.dart' as http;

import '../Api/SignOutApi.dart';
import '../Map/map.dart';
import '../Transactions/Transactions.dart';
import '../notification_Services.dart';

class Home_Screen extends StatefulWidget {
  Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  String? name;



  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("firstname").toString();
    });
  }

  bool _loading = false;






  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(100))),
          child: Column(
            children: [


              Container(
                decoration: const BoxDecoration(
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
                                      decoration: const BoxDecoration(
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
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 6),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/pic.png.jpg")),
                                        borderRadius: const BorderRadius.all(
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/transcatiion.svg"),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Transactions();
                        }));
                      },
                      child: const Text(
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
              // Padding(
              //   padding: const EdgeInsets.only(left: 25),
              //   child: Row(
              //     children: [
              //       SvgPicture.asset("assets/location.svg"),
              //       SizedBox(width: 10),
              //       // TextButton(
              //       //   onPressed: () {
              //       //     // Navigator.of(context).push(MaterialPageRoute(
              //       //     //     builder: (BuildContext context) {
              //       //     //       return MapSample();
              //       //     //     }));
              //       //   },
              //       //   child: Text(
              //       //     "Location",
              //       //     style:
              //       //         TextStyle(fontSize: 14, color: Color(0xff233245)),
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),
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
                    const SizedBox(width: 10),
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
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xff9C3587),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32))),
                                        child: const Text(
                                          " إلغاء",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white),
                                        )),
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 100,
                                    height: 32,
                                    child: ElevatedButton(
                                        onPressed: () async {


                                          setState(() {
                                            _loading = true;
                                          });

                                          ApiServiceForSignOut.signOut().then((value) => {
                                                    if (value.message ==
                                                        "Customer logged out successfully")
                                                      {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                          return const Sign_In();
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
                                                                  const Text('Error'),
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
                                                                  child: const Text(
                                                                      ' إلغاء'),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                                CupertinoDialogAction(
                                                                  child: const Text(
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
                                            primary: const Color(0xffFFFFFF),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32))),
                                        child: const Text(
                                          " تسجيل الخروج",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff9C3587)),
                                        )),
                                  ),
                                ],
                              )),
                        );
                      },
                      child: const Text(
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
        backgroundColor: const Color(0xff653780),
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
                    children: const [
                      Text(
                        "مرحبا",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(100),
                  //       ),
                  //       height: 25,
                  //       width: 25,
                  //       child: SvgPicture.asset(
                  //         "assets/HS Ntofication.svg",
                  //         fit: BoxFit.scaleDown,
                  //       ),
                  //     ),
                  //     SizedBox(width: 10),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(100),
                  //       ),
                  //       height: 25,
                  //       width: 25,
                  //       child: Builder(builder: (context) {
                  //         return InkWell(
                  //           onTap: () {
                  //             Scaffold.of(context).openDrawer();
                  //           },
                  //           child: SvgPicture.asset(
                  //             "assets/HS Drawer.svg",
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
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(32),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.grey,
                      //           blurRadius: 3,
                      //           offset: Offset(1.0, 2.0),
                      //         )
                      //       ]),
                      //   height: 40,
                      //   width: MediaQuery.of(context).size.width / 1.1,
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //       prefixIcon: SvgPicture.asset(
                      //         "assets/HS search box.svg",
                      //         fit: BoxFit.scaleDown,
                      //       ),
                      //       hintText: "Search any type of services",
                      //       hintStyle: TextStyle(
                      //           fontSize: 10, color: Color(0xffBAC0C0)),
                      //       border: InputBorder.none,
                      //       contentPadding: EdgeInsets.only(top: 5),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                            boxShadow: const [
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
                                children: const [
                                  Text(
                                    "Funni",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                  // SizedBox(height: 5),
                                  // Text(
                                  //   "Lorem ipsum dolor sit amet, consectetu elit, sed\ndo eiusmod tempor Lorem ipsum dolor sit amet,\nconsectetu elit, sed do eiusmod tempor Lorem\nipsum dolor sit amet, consectetu elit, sed do",
                                  //   style: TextStyle(
                                  //       fontSize: 6, color: Colors.black),
                                  // ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffffd19c),
                                    borderRadius: BorderRadius.circular(45)),
                                height: 140,
                                width: MediaQuery.of(context).size.width / 2.1,
                                child: Image.asset("assets/logo.png")
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            " خدمات ",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 15),
                            //Electric Services
                            InkWell(
                              onTap: () async{
                                final prefs = await SharedPreferences.getInstance();
                                String address = prefs.getString("address").toString();
                                if(address==null){

                                }
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return Cooling_Services(
                                    type: 'Electric+Heater',
                                  );
                                }));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
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
                                    width: MediaQuery.of(context).size.width  / 2.5,
                                    child: SvgPicture.asset(
                                      "assets/Electric service.svg",
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    decoration: const BoxDecoration(
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
                                    width: MediaQuery.of(context).size.width  / 2.5,
                                    child: const Center(
                                      child: Text(
                                        "خدمات الكهرباء",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async{
                                final prefs = await SharedPreferences.getInstance();
                                String address = prefs.getString("address").toString();
                                if(address==null){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                            title: const Text(
                                              "Please Update your location"
                                            ),
                                            content: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  height: 32,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary:
                                                          const Color(0xffFFFFFF),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  32))),
                                                      child: const Text(
                                                        "Okay",
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Color(
                                                                0xff9C3587)),
                                                      )),
                                                ),
                                              ],
                                            )),
                                  );
                                }
                                else{
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return Cooling_Services(
                                          type: 'Cooling',
                                        );
                                      }));
                                }

                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
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
                                    width: MediaQuery.of(context).size.width  / 2.5,
                                    child: SvgPicture.asset(
                                      "assets/Cooling.svg",
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  InkWell(
                                    onTap: () async{
                                      final prefs = await SharedPreferences.getInstance();
                                      String address = prefs.getString("address").toString();
                                      if(address==null){
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                  title: const Text(
                                                      "Please Update your location"
                                                  ),
                                                  content: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        height: 32,
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                                primary:
                                                                const Color(0xffFFFFFF),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        32))),
                                                            child: const Text(
                                                              "Okay",
                                                              style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Color(
                                                                      0xff9C3587)),
                                                            )),
                                                      ),
                                                    ],
                                                  )),
                                        );
                                      }
                                      else {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return Cooling_Services(
                                                type: 'Cooling',
                                              );
                                            }));
                                      }
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
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
                                      width: MediaQuery.of(context).size.width  / 2.5,
                                      child: const Center(
                                        child: Text(
                                          "خدمات التبريد",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 25),
                            // InkWell(
                            //   onTap: () async{
                            //     final prefs = await SharedPreferences.getInstance();
                            //     String address = prefs.getString("address").toString();
                            //     if(address==null){
                            //       showDialog(
                            //         context: context,
                            //         builder: (BuildContext context) =>
                            //             AlertDialog(
                            //                 title: const Text(
                            //                     "Please Update your location"
                            //                 ),
                            //                 content: Row(
                            //                   crossAxisAlignment:
                            //                   CrossAxisAlignment.center,
                            //                   children: [
                            //                     SizedBox(
                            //                       width: 100,
                            //                       height: 32,
                            //                       child: ElevatedButton(
                            //                           onPressed: () {
                            //                             Navigator.pop(context);
                            //                           },
                            //                           style: ElevatedButton.styleFrom(
                            //                               primary:
                            //                               const Color(0xffFFFFFF),
                            //                               shape: RoundedRectangleBorder(
                            //                                   borderRadius:
                            //                                   BorderRadius
                            //                                       .circular(
                            //                                       32))),
                            //                           child: const Text(
                            //                             "Okay",
                            //                             style: TextStyle(
                            //                                 fontSize: 11,
                            //                                 color: Color(
                            //                                     0xff9C3587)),
                            //                           )),
                            //                     ),
                            //                   ],
                            //                 )),
                            //       );
                            //     }
                            //     else {
                            //       Navigator.of(context).push(MaterialPageRoute(
                            //           builder: (BuildContext context) {
                            //             return Cooling_Services(
                            //               type: 'Plumber',
                            //             );
                            //           }));
                            //     }
                            //   },
                            //   child: Column(
                            //     children: [
                            //       Container(
                            //         decoration: const BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.only(
                            //                 topLeft: Radius.circular(20),
                            //                 topRight: Radius.circular(20)),
                            //             boxShadow: [
                            //               BoxShadow(
                            //                 color: Colors.grey,
                            //                 blurRadius: 3,
                            //                 offset: Offset(1.0, 2.0),
                            //               )
                            //             ]),
                            //         height: 120,
                            //   width: MediaQuery.of(context).size.width  / 2.5,
                            //         child: SvgPicture.asset(
                            //           "assets/Plumber service.svg",
                            //           fit: BoxFit.scaleDown,
                            //         ),
                            //       ),
                            //       const SizedBox(height: 8),
                            //       Container(
                            //         decoration: const BoxDecoration(
                            //             color: Colors.white,
                            //             borderRadius: BorderRadius.only(
                            //                 bottomLeft: Radius.circular(20),
                            //                 bottomRight: Radius.circular(20)),
                            //             boxShadow: [
                            //               BoxShadow(
                            //                 color: Colors.grey,
                            //                 blurRadius: 3,
                            //                 offset: Offset(1.0, 2.0),
                            //               )
                            //             ]),
                            //         height: 40,
                            //         width: MediaQuery.of(context).size.width  / 2.5,
                            //         child: const Center(
                            //           child: Text(
                            //             "Plumbing Services",
                            //             style: TextStyle(
                            //                 fontSize: 13, color: Colors.black),
                            //           ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(width: 10,),
                            InkWell(
                              onTap: ()async{
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        title: Text(" أرسل الشكوى إلى : ghasanwar@gmail.com"),
                                        content: Text(" رقم الجوال : 054 753 3936"),
                                        actions: <Widget>[

                                        ],
                                      );
                                    },
                                  );


                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
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
                              width: MediaQuery.of(context).size.width  / 2.5,
                                    child: Image.asset(
                                      "assets/icons8-open-box-96.png",
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    decoration: const BoxDecoration(
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
                                    width: MediaQuery.of(context).size.width  / 2.5,
                                    child: const Center(
                                      child: Text(
                                        " رفع شكوى",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // const SizedBox(width: 15),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
