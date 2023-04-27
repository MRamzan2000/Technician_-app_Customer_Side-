import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:technician_customer_side/Api/SignInApi.dart';
import 'package:technician_customer_side/Bottom%20bar/Bottom_Bar.dart';
import 'package:technician_customer_side/Sign%20Up/Sign_Up.dart';
import '../ForgotPass_verify_change_pass/ForgotPass.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        // useDefaultLoading: true,
      inAsyncCall: _loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                SvgPicture.asset(
                  "assets/Sign in.svg",
                  height: MediaQuery.of(context).size.height / 3,
                ),
                SizedBox(height: 30),
                Text(
                  "Sign In",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "Email ID",
                        hintStyle: TextStyle(fontSize: 10, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: pass,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 10, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return const ForgotPassword();
                          }));
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      )),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 130,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //       return Bottom_Bar();
                        //     }));
                        setState(() {
                          _loading = true;
                        });
                        Map<String, dynamic> body = {

                          "email": "imuhammadfaizan@gmail.com",
                          "password": "xxxxxxxx",
                          // "email":"inzmamkhan56@gmail.com",
                          // "password":"assword"
                          // "email": "immuhamm adfa izan@gmail.com",
                          // "password": "xxxxxxxx"

                        };
                        ApiServiceForSignIn.signin(body).then((value) => {
                          if (value.userId != "")

                            {
                              print(value.userId),
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return Bottom_Bar();
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
                                builder: (BuildContext context) {
                                  return CupertinoAlertDialog(
                                    title: Text('Error'),
                                    content: Text(value.message.toString()),
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
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (BuildContext context) {
                        //   return Bottom_Bar();
                        // }));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff9C3587),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32))),
                      child: Text(
                        "Sign In",
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Sign_Up();
                        }));
                      },
                      child: Text(
                        " Sign Up",
                        style: TextStyle(fontSize: 12, color: Color(0xff585D5E)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  "Sign In with",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/Sign in apple.svg"),
                    SizedBox(width: 10),
                    SvgPicture.asset("assets/Sign in mail.svg")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
