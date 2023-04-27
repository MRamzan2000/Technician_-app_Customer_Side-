import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:technician_customer_side/Service%20App/Service_App.dart';
import 'package:technician_customer_side/Sign%20In/Sign_In.dart';

import '../Api/SignUpApi.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController idofIqama = TextEditingController();

  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                SvgPicture.asset("assets/Sign up.svg",
                    height: MediaQuery.of(context).size.height / 3),
                const SizedBox(height: 30),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: firstname,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "First name",
                        hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: lastname,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "Last name",
                        hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: pass,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: idofIqama,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "ID-Iqyama",
                        hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "Phone number",
                        hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 40),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 80,
                        child: DropdownButtonFormField(
                          icon: SvgPicture.asset("assets/Drop down.svg"),
                          value: "Lahore",
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Lahore",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              value: "Lahore",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Islamabad",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              value: "Islamabad",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Jhelum",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              value: "Jhelum",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Faislabad",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              value: "Faislabad",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "karachi",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              value: "karachi",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Sindh",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.black),
                              ),
                              value: "Sindh",
                            )
                          ],
                          onChanged: (value) {
                            print("changed");
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          "Date of Birth",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xffE2E1E1)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: 35,
                          width: 30,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "MM",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Color(0xffC0BDBD)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: 35,
                          width: 25,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "DD",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Color(0xffC0BDBD)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: 35,
                          width: 30,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "YYY",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Color(0xffC0BDBD)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 130,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {

                          _loading = true;
                        });
                        Map<String, dynamic> body = {
                          "firstname": "Muhammad",
                          "lastname": "Faizan",
                          "email": "imuhammadfaizan@gmail.com",
                          "password": "xxxxxxxx",
                          "phonenumber": "03084671840",
                          "city": "Lahore",
                          "dateofbirth": "02-04-2000"
                        };
                        ApiServiceForSignup.signup(body).then((value) => {
                              if (value.message == "User created successfully")
                                {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return Sign_In();
                                  })),
                        setState(() {

                        _loading = false;
                        })
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (BuildContext context) {
                                  //   return Service_App();
                                  // }))
                                }
                              else
                                {
                                  setState(() {

                                    _loading = false;
                                  }),
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: Text('Error'),
                                        content: value.error == null
                                            ? Text(value.message.toString())
                                            : Text(value.error.toString()),
                                        actions: [
                                          CupertinoDialogAction(
                                            child: Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            child: Text('OK'),
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
                          primary: Color(0xff9C3587),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32))),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      )),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        " Sign In",
                        style: TextStyle(fontSize: 12, color: Color(0xff585D5E)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
