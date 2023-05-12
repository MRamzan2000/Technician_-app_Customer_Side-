import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technician_customer_side/Api/ApiServieForgotingpass.dart';
import 'package:technician_customer_side/ForgotPass_verify_change_pass/VerifyPass.dart';

import '../Sign In/Sign_In.dart';

class UpdatePassword extends StatefulWidget {
  final String email;

  const UpdatePassword({Key? key, required this.email}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  TextEditingController pass =TextEditingController();
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
                "Update Your Password",
                style: TextStyle(color: Colors.black, fontSize: 23),
              ),
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
                  controller: pass,

                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      border: InputBorder.none,
                      hintText: "Enter you pass here"),
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


                  }, child: Text("Update Password")))
        ],
      ),
    );
  }
}
