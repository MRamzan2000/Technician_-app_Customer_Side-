import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Api/ApiServieForgotingpass.dart';
import '../Sign In/Sign_In.dart';

class Password extends StatefulWidget {
  final String email;

  const Password({Key? key, required this.email}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController pass =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SvgPicture.asset(
            "assets/Map Icon.svg",
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Text(
          "Password",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              SvgPicture.asset("assets/Developer.svg"),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: pass,

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 17),
                    prefixIcon: SvgPicture.asset(
                      "assets/Lock.svg",
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: "Your new Password",
                    hintStyle: TextStyle(fontSize: 12, color: Color(0xffCCCACA)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 17),
                    prefixIcon: SvgPicture.asset(
                      "assets/Lock.svg",
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(fontSize: 12, color: Color(0xffCCCACA)),
                  ),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 35,
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      Map<String , dynamic> body ={
                        "email":widget.email,
                        "newPassword": pass.text
                      };



                      ApiServiceForForgotPassword.changePassword(body).then((value) => {
                        if(value.message == "Password updated"){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return Sign_In();
                          }))
                        }
                        else{
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: const Text('Error'),
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
                      "Done",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
