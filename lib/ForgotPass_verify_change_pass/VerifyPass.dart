import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technician_customer_side/ForgotPass_verify_change_pass/updatePass.dart';

import '../Api/ApiServieForgotingpass.dart';

class VerifyPage extends StatefulWidget {
  final String email;
  const VerifyPage({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController code =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Center(
              child: Text(
                "Verification Code Sent Your Email",
                style: TextStyle(color: Colors.black, fontSize: 23),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Text(
              widget.email,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
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
          SizedBox(
              height: 35,
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.greenAccent)),
                  onPressed: () {
                    Map<String, dynamic> body = {
                      "email":widget.email,
                      "code":  code.text
                    };
                    ApiServiceForForgotPassword.verifyCode(body)
                        .then((value) => {
                              if (value.message == "Code verified")
                                {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return UpdatePassword(email: widget.email,);
                                  }))
                                }
                              else
                                {
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
                  child: Text("Reset Password")))
        ],
      ),
    );
  }
}
