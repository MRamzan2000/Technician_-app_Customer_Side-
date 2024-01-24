import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import '../Api/ApiServieForgotingpass.dart';
import 'Password.dart';
import 'Varification.dart';

class Forget_Password extends StatefulWidget {
  const Forget_Password({Key? key}) : super(key: key);

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  TextEditingController phone = TextEditingController();
  bool _loading = false;
  late TwilioFlutter twilioFlutter;

  @override
  void initState(){
    super.initState();
    twilioFlutter = TwilioFlutter(
        accountSid: "AC68b9ff9f95ece118a357a5099e58211d",
        authToken: "8fd3ebeccae56c8c82a878a2c3ac033a",
        twilioNumber: "+14302264650"
    );

  }
  var numbber = 0;

  void sendSms() async {
    var random = Random();
    numbber =  random.nextInt(9000) + 1000;
    twilioFlutter.sendSMS(
        toNumber: phone.text.toString(),
        messageBody: 'Hii everyone this is a $numbber of\nflutter twilio sms.').then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          backgroundColor: const Color(0xff9C3587),
          shape: const RoundedRectangleBorder(
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
          title: const Text(
            "Forget Password",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                SvgPicture.asset("assets/Forgot password.svg",
                height: MediaQuery.of(context).size.height / 3,),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phone,
                    decoration: const InputDecoration(
                      hintText: "رقم الجوال",
                      hintStyle: TextStyle(fontSize: 14, color: Color(0xffCCCACA)),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 160,
                  height: 35,
                  child: ElevatedButton(
                      onPressed: () {

                        sendSms();
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                          return Password(number: numbber.toString(),);
                        }));


                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff9C3587),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32))),
                      child: const Text(
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
