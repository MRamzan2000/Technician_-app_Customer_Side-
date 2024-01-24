import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Api/UpdateUserInfo.dart';

import '../Api/GetUserInfoAPi.dart';
import '../Api/SignOutApi.dart';
import '../Sign In/Sign_In.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? firstname;
  String? lastname;
  String? name;
  String? email;
  String? phonenumber;
  String? city = "Lahore";
  String? dateob;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  bool _loading = false;
  String? image;

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      firstname = prefs.getString("firstname").toString();
      lastname = prefs.getString("lastname").toString();
      phonenumber = prefs.getString("phone").toString();
      dateob = prefs.getString("dateofbirth").toString();
      city = prefs.getString("city").toString();
      image = prefs.getString("imagepath") ?? '';
    });
    print(phonenumber);
    print(dateob);
    setState(() {
      controllers[0].text = firstname.toString();
      controllers[1].text = lastname.toString();
      controllers[2].text = phonenumber.toString();
    });

    print(image);
  }

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  File selectedImage = File('');

  void cameraa(BuildContext context) async {
    setState(() {
      image = null;
    });
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        selectedImage = File(photo.path);
        prefs.setString("imagepath", selectedImage.path);
        initialize();
        Navigator.pop(context);
      });
    }
  }

  void galleryy(BuildContext context) async {
    setState(() {
      image = null;
    });
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        selectedImage = File(photo.path);
        prefs.setString("imagepath", selectedImage.path);
        initialize();
        Navigator.pop(context);
      });
    }
  }

  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () => cameraa(context),
                ),
                const SizedBox(height: 10.0),
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () => galleryy(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        backgroundColor: const Color(0xff653780),
        body: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32),
                          bottomRight: Radius.circular(32)),
                    ),
                    height: 30,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          "الحساب",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff653780)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
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
                                          backgroundColor:
                                              const Color(0xff9C3587),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32))),
                                      child: const Text(
                                        " إلغاء",
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
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
                                                            title: const Text(
                                                                'Error'),
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
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                              CupertinoDialogAction(
                                                                child:
                                                                    const Text(
                                                                        'OK'),
                                                                onPressed: () {
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
                    child: Container(
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
                  )
                ],
              ),
            ),
            const SizedBox(height: 60),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45))),
                      height: MediaQuery.of(context).size.height / 1.1,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(height: 70),
                          Transform.translate(
                            offset: const Offset(0, -15),
                            child: Text(
                              "${firstname} ${lastname}",
                              style: const TextStyle(
                                  fontSize: 16, color: Color(0xffF89F5B)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: controllers[0],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(top: 15),
                                labelText: "الاسم",
                                labelStyle: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                hintText: "${firstname}",
                                hintStyle: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: controllers[1],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 15),
                                labelText: "الاسم الأخير",
                                labelStyle: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                hintText: "Asghar",
                                hintStyle: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controllers[2],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(top: 15),
                                labelText: "رقم الجوال",
                                labelStyle: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                hintText: "${phonenumber}",
                                hintStyle: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("المدينة"),

                                    // SizedBox(
                                    //   height: 40,
                                    //   width: 80,
                                    //   child: DropdownButtonFormField(
                                    //     icon:
                                    //     SvgPicture.asset("assets/Drop down.svg"),
                                    //     value: city ,
                                    //     items: [
                                    //       DropdownMenuItem(
                                    //         child: Text(
                                    //           "Lahore",
                                    //           style: TextStyle(
                                    //               fontSize: 14, color: Colors.black),
                                    //         ),
                                    //         value: "Lahore",
                                    //       ),
                                    //       DropdownMenuItem(
                                    //         child: Text(
                                    //           "Islamabad",
                                    //           style: TextStyle(
                                    //               fontSize: 14, color: Colors.black),
                                    //         ),
                                    //         value: "Islamabad",
                                    //       ),
                                    //       DropdownMenuItem(
                                    //         child: Text(
                                    //           "Jhelum",
                                    //           style: TextStyle(
                                    //               fontSize: 14, color: Colors.black),
                                    //         ),
                                    //         value: "Jhelum",
                                    //       ),
                                    //       DropdownMenuItem(
                                    //         child: Text(
                                    //           "Faislabad",
                                    //           style: TextStyle(
                                    //               fontSize: 14, color: Colors.black),
                                    //         ),
                                    //         value: "Faislabad",
                                    //       ),
                                    //       DropdownMenuItem(
                                    //         child: Text(
                                    //           "karachi",
                                    //           style: TextStyle(
                                    //               fontSize: 14, color: Colors.black),
                                    //         ),
                                    //         value: "karachi",
                                    //       ),
                                    //       DropdownMenuItem(
                                    //         child: Text(
                                    //           "Sindh",
                                    //           style: TextStyle(
                                    //               fontSize: 14, color: Colors.black),
                                    //         ),
                                    //         value: "Sindh",
                                    //       )
                                    //     ],
                                    //     onChanged: (value) {
                                    //       print("changed");
                                    //     },
                                    //   ),
                                    // ),
                                    SizedBox(width: 5),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () => _selectDate(context),
                                      style: ElevatedButton.styleFrom(
                                          primary: const Color(0xffFFFFFF),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32))),
                                      child: Text(
                                        "${dateob}",
                                        style: const TextStyle(
                                            fontSize: 11,
                                            color: Color(0xff9C3587)),
                                      ))),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            width: 140,
                            height: 32,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                            title: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              height: 30,
                                              width: 30,
                                              child: SvgPicture.asset(
                                                "assets/Profile.svg",
                                                fit: BoxFit.scaleDown,
                                              ),
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
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          primary: const Color(
                                                              0xff9C3587),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32))),
                                                      child: const Text(
                                                        " إلغاء",
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color:
                                                                Colors.white),
                                                      )),
                                                ),
                                                const SizedBox(width: 20),
                                                SizedBox(
                                                  width: 100,
                                                  height: 32,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        print(city);
                                                        setState(() {
                                                          _loading = true;
                                                        });
                                                        Map<String, dynamic>
                                                            body = {
                                                          "firstname":
                                                              controllers[0]
                                                                  .text
                                                                  .toString(),
                                                          "lastname":
                                                              controllers[1]
                                                                  .text
                                                                  .toString(),
                                                          "phonenumber":
                                                              controllers[2]
                                                                  .text
                                                                  .toString(),
                                                          "dateofbirth":
                                                              dateob.toString(),
                                                          "city":
                                                              city.toString()
                                                        };
                                                        print(body);
                                                        ApiServiceForUpdateUserInfo
                                                                .updateinfo(
                                                                    body)
                                                            .then((value) => {
                                                                  if (value
                                                                          .message ==
                                                                      "seller information updated successfully")
                                                                    {
                                                                      ApiServiceForGetUserInfo
                                                                          .getinfo(),
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(),
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              const SnackBar(
                                                                        content:
                                                                            Text('Information updated successfully'),
                                                                        duration:
                                                                            Duration(seconds: 1),
                                                                      )),
                                                                      setState(
                                                                          () {
                                                                        _loading =
                                                                            false;
                                                                      })
                                                                    }
                                                                  else
                                                                    {
                                                                      setState(
                                                                          () {
                                                                        _loading =
                                                                            false;
                                                                      }),
                                                                      showCupertinoDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return CupertinoAlertDialog(
                                                                            title:
                                                                                const Text('Error'),
                                                                            content:
                                                                                Text(value.message.toString()),
                                                                            actions: [
                                                                              CupertinoDialogAction(
                                                                                child: const Text(' إلغاء'),
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                              ),
                                                                              CupertinoDialogAction(
                                                                                child: const Text('OK'),
                                                                                onPressed: () {
                                                                                  // Perform some action
                                                                                  Navigator.of(context).pop();
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
                                                          primary: const Color(
                                                              0xffFFFFFF),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32))),
                                                      child: const Text(
                                                        "حفظ",
                                                        style: TextStyle(
                                                            fontSize: 11,
                                                            color: Color(
                                                                0xff9C3587)),
                                                      )),
                                                ),
                                              ],
                                            )),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffFFFFFF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32))),
                                child: const Text(
                                  "حفظ",
                                  style: TextStyle(
                                      fontSize: 11, color: Color(0xff9C3587)),
                                )),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 140,
                            height: 32,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xff9C3587),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32))),
                                child: const Text(
                                  " إلغاء",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: InkWell(
                          onTap: () => _showImageSourceDialog(context),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Transform.translate(
                                offset: const Offset(0, -20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffF89F5B)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                  ),
                                  height: 70,
                                  width: 70,
                                  child: ClipRRect(
                                    clipBehavior: Clip.hardEdge,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    child: Stack(
                                      children: [
                                        image == null || image == ''
                                            ? Image.asset(
                                                "assets/pngwing.com (2).png")
                                            : CircleAvatar(
                                                radius: 50, // Image radius
                                                child: Image.file(
                                                  File(image!),
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  DateTime _selectedDate = DateTime.now();

  // String dob='Date of Birth';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dateob = DateFormat('yyyy-MM-dd').format(_selectedDate);
        setState(() {});
      });
    }
  }
}
