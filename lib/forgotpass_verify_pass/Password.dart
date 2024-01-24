import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Api/ApiServieForgotingpass.dart';
import '../Sign In/Sign_In.dart';

class Password extends StatefulWidget {
  final String number;

  const Password({Key? key, required this.number}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController code =TextEditingController();

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
          "Enter Your Code",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              SvgPicture.asset("assets/Developer.svg",
              height: MediaQuery.of(context).size.height / 3,),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: code,

                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(

                    contentPadding: EdgeInsets.only(top: 17),
                    prefixIcon: SvgPicture.asset(
                      "assets/Lock.svg",
                      fit: BoxFit.scaleDown,
                    ),
                    hintText: "Your Code",
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
                      if(code.text == widget. number){
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                          return Sign_In();
                        }));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Invalid Code!'),
                        ));
                      }



                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff9C3587),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32))),
                    child: Text(
                      "تم",
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
