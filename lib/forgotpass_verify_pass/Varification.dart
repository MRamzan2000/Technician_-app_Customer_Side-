import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Api/ApiServieForgotingpass.dart';
import 'Password.dart';

class Varification extends StatefulWidget {
  final String email;

  const Varification({Key? key, required this.email}) : super(key: key);

  @override
  State<Varification> createState() => _VarificationState();
}

class _VarificationState extends State<Varification> {
  TextEditingController code =TextEditingController();
  bool _loading = false;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,

      child: Scaffold(
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
            "Verification",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Code is sent to",
                    style: TextStyle(fontSize: 12, color: Color(0xffACACAC)),
                  ),
                  SizedBox(width: 5),
                  Text(
                    widget.email,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3.5)],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: TextFormField(
                      controller: code,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          border: InputBorder.none,
                          hintText: "Enter your code here"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 35,
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _loading = true;
                      });
                      Map<String, dynamic> body = {
                        "email":widget.email,
                        "code":  code.text
                      };

                      ApiServiceForForgotPassword.verifyCode(body)
                          .then((value) => {
                        if (value.message == "Code verified")
                          {
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return Password(email: widget.email,);
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
