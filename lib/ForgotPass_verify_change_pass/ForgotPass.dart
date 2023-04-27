import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technician_customer_side/ForgotPass_verify_change_pass/VerifyPass.dart';

import '../Api/ApiServieForgotingpass.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                "Forgot Your Password?",
                style: TextStyle(color: Colors.black, fontSize: 23),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Text(
              "Enter your email address to retrieve your password ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 50),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.5
                  )
                ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Center(
                child: TextFormField(

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                      border: InputBorder.none,
                      hintText: "Enter you email here"),
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
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  )),
                  backgroundColor: MaterialStatePropertyAll(Colors.greenAccent)
                ),
                  onPressed: (){
                  String email = "inzmamkhan56@gmail.com";
                    ApiServiceForForgotPassword.sendCodeToEmail(email).then((value) =>{

                      if(value.message == "Code sent to email"){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                      return const VerifyPage();
                    }))
                      }
                      else{
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

                 

                  }, child: Text("Reset Password")))
        ],
      ),
    );
  }
}
