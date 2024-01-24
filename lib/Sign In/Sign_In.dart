import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:technician_customer_side/Api/SignInApi.dart';
import 'package:technician_customer_side/Bottom%20bar/Bottom_Bar.dart';
import 'package:technician_customer_side/Sign%20Up/Sign_Up.dart';
import '../forgotpass_verify_pass/Forget_Password.dart';
import '../notification_Services.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
String? deviceToken;
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _loading = false;
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();

    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.inItLocalNotification(context);

    notificationServices.handleAction();
    notificationServices.getDeviceToken().then((value) {
      if(kDebugMode){
        deviceToken=value;
      }


    });
  }
  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill all required fields';
    }
    return null;
  }

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
                const SizedBox(height: 50),
                Image.asset("assets/logo.png",
                  height: MediaQuery.of(context).size.height / 3,
                ),
                const SizedBox(height: 30),
                const Text(
                  " تسجيل الدخول",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    validator: validateRequired,

                    keyboardType: TextInputType.number,
                    controller: phone,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: " رقم الجوال",
                        hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: pass,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20),
                        hintText: "كلمة المرور",
                        hintStyle: TextStyle(fontSize: 10, color: Colors.black)),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return const Forget_Password();
                          }));
                        },
                        child: const Text(
                          "نسيت كلمة المرور",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      )),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 130,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {

                        setState(() {
                          _loading = true;
                        });
                        Map<String, dynamic> body = {

                          "phonenumber": phone.text,
                          "password": pass.text,

                        };
                        ApiServiceForSignIn.signin(body).then((value) => {
                          if (value.userId != "")

                            {
                              print('This is User Id : ${value.userId}'),
                              notificationServices.saveUserId(value.userId.toString()),

                        notificationServices.addDeviceToken(value.userId.toString(),deviceToken.toString()),
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Bottom_Bar()),
                        ),
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
                                    content: Text(value.message.toString()),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: const Text(' إلغاء'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      CupertinoDialogAction(
                                        child: const Text('OK'),
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
                          backgroundColor: const Color(0xff9C3587),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32))),
                      child: const Text(
                        " تسجيل الدخول",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      )),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ليس لديك حساب؟",
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Sign_Up();
                        }));
                      },
                      child: const Text(
                        "التسجيل",
                        style: TextStyle(fontSize: 12, color: Color(0xff585D5E)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  "تسجيل الدخول ب",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/Sign in apple.svg"),
                    const SizedBox(width: 10),
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
