import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technician_customer_side/Upload%20Photo/Second_Upload_Photo.dart';



class Upload_Photo extends StatefulWidget {
  String id;
  final String type;
  final String username;
  final String day;
  final String time;
  final String date;
  final String ammount;
  Upload_Photo({Key? key,required this.id, required this.type, required this.username, required this.day, required this.time, required this.date, required this.ammount}) : super(key: key);

  @override
  State<Upload_Photo> createState() => _Upload_PhotoState();
}

class _Upload_PhotoState extends State<Upload_Photo> {


  File selectedImage = File('');
  void cameraa() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        selectedImage = File(photo.path);
        print(Image);
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return Second_Upload_Photo(image: selectedImage,id : widget.id, type: widget.type, username: widget.username, day: widget.day, time: widget.time, date: widget.date, ammount: widget.ammount,);
      }));
    }


  }

  void galleryy() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        selectedImage = File(photo.path);
        print(Image);
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return Second_Upload_Photo(image: selectedImage,id : widget.id, type: widget.type, username: widget.username, day: widget.day, time: widget.time, date: widget.date, ammount: widget.ammount,);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xfff8cdaa),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              height: 30,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            "assets/Back arrow.svg",
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                    Text(
                      "Upload Photo",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(1.0, 2.0),
                  )
                ]),
            height: 180,
            width: MediaQuery
                .of(context)
                .size
                .width / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("assets/Upload Camera Photo.png"),
                SizedBox(width: 5),
                Text(
                  "Camera",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: 130,
            height: 30,
            child: ElevatedButton(
                onPressed: () {
                  cameraa();

                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff9C3587),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
                child: Text(
                  "Take Photo",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                )),
          ),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(1.0, 2.0),
                  )
                ]),
            height: 180,
            width: MediaQuery
                .of(context)
                .size
                .width / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("assets/upload gallery photo.png"),
                SizedBox(width: 5),
                Text(
                  "Camera",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: 130,
            height: 30,
            child: ElevatedButton(
                onPressed: () {
                  galleryy();




                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff9C3587),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32))),
                child: Text(
                  "Choose Photo",
                  style: TextStyle(fontSize: 11, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }


}