import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Api/SignUpApi.dart';
import '../Map/map.dart';
import '../Sign In/Sign_In.dart';

class CodeVerify extends StatefulWidget {
  final String code;
  final String firstname;
  final String lastname;
  final String email;
  final String pass;
  final String phone;
  final String city;
  final String dob;
  const CodeVerify({Key? key, required this.code, required this.firstname, required this.lastname, required this.email, required this.pass, required this.phone, required this.city, required this.dob}) : super(key: key);

  @override
  State<CodeVerify> createState() => _CodeVerifyState();
}

class _CodeVerifyState extends State<CodeVerify> {
  upload(){
    Map<String, dynamic> body = {
      "firstname": widget.firstname,
      "lastname": widget.lastname,
      "email": widget. email,
      "password": widget.pass,
      "phonenumber": widget.phone,
      "city": widget.city,
      "dateofbirth": widget.dob
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
                    child: Text(' إلغاء'),
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
  }
  bool _loading = false;
  TextEditingController verifycode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(

        body: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 150,),
            Text("Code has been sent your phone :"),
            Text("Enter the your Code  :"),


            Container(
              height: 35,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.5
                  )
                ],
                color: Colors.white,


              ),
              child: TextField(
                keyboardType: TextInputType.number,

                controller: verifycode,
                decoration: InputDecoration(
                  hintText: "Enter Your Code"
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              // if(widget.code == verifycode.text){
                upload();
              // }
              // else{
              //   showCupertinoDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return CupertinoAlertDialog(
              //         title: Text('Error'),
              //         content: Text("Invalild Code"),
              //         actions: [
              //           CupertinoDialogAction(
              //             child: Text('Cancel'),
              //             onPressed: () {
              //               Navigator.of(context).pop();
              //             },
              //           ),
              //           CupertinoDialogAction(
              //             child: Text('OK'),
              //             onPressed: () {
              //               // Perform some action
              //               Navigator.of(context).pop();
              //             },
              //           ),
              //         ],
              //       );
              //     },
              //   );
              // }


            }, child: const Text("Verify"))
          ],
        ),
      ),
    );
  }
}
