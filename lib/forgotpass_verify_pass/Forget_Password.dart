import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Api/ApiServieForgotingpass.dart';
import 'Varification.dart';

class Forget_Password extends StatefulWidget {
  const Forget_Password({Key? key}) : super(key: key);

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  TextEditingController email = TextEditingController();
  bool _loading = false;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          backgroundColor: Color(0xff9C3587),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45)),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                "assets/Iconly-Light-outline-Arrow - Left.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          title: Text(
            "Forget Password",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset("assets/Forgot password.svg"),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(fontSize: 14, color: Color(0xffCCCACA)),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 160,
                  height: 35,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _loading = true;
                        });
                        String s = email.text;
                        print(s);
                        ApiServiceForForgotPassword.sendCodeToEmail(s).then((value) =>{

                          if(value.message == "Code sent to email"){
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return Varification(email: email.text,);
                            })),
                        setState(() {
                        _loading = false;
                        })
                          }
                          else{
                            setState(() {
                              _loading = false;
                            }),
                            showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: const Text('Error'),
                                  content: value.error == null ? Text(value.message.toString()) : Text(value.error.toString()),
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
                        "Get Code",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
