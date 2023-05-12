import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_customer_side/Upload%20Photo/Upload_Photo.dart';
import 'package:intl/intl.dart';
import '../Api/ApiServiceForStoringOrders.dart';

class Select_Schedule extends StatefulWidget {

  String id;
  String amount;
  String type;
  Select_Schedule({Key? key, required this.id,required this.type, required this.amount }) : super(key: key);

  @override
  State<Select_Schedule> createState() => _Select_ScheduleState();
}

class _Select_ScheduleState extends State<Select_Schedule> {
  DateTime now = DateTime.now();

  DatePickerController _datePickerController = DatePickerController();
  DateTime start = DateTime.now();
  DateTime twoMonthsFromNow = DateTime.now().add(Duration(days: 30));

  double value = 0;
  double value1 = 0;

  String name = "";
  String am_pm = "AM";

  @override
void initState() {
  super.initState();
  initialize();


}
  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    String f =  prefs.getString("firstname").toString();
    String l =  prefs.getString("lastname").toString();
    setState(() {

      name = f+l;
    });
  }
  @override
  Widget build(BuildContext context) {
    // print(now);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        "Select Schedule ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 3, offset: Offset(1.0, 2.0))
              ]),
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                )
                              ]),
                          height: 25,
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "2023",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xffB4B5B5)),
                              ),
                              SizedBox(width: 5),
                              // SvgPicture.asset("assets/Drop down.svg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
              HorizontalDatePickerWidget(
                locale: 'en_AU',
                startDate: start, // set start date to 30 days ago
                endDate: twoMonthsFromNow, // set end date to today
                selectedDate: now,
                widgetWidth: MediaQuery.of(context).size.width,
                datePickerController: _datePickerController,
                onValueSelected: (date) {
                  setState(() {
                    now = date ;
                  });
                  print('selected = $now');
                },


              ),

              // HorizontalDatePickerWidget(
                  //   locale: 'en_AU',
                  //   startDate: DateTime(1),
                  //   endDate: DateTime(999),
                  //   selectedDate: now,
                  //   widgetWidth: MediaQuery.of(context).size.width,
                  //   datePickerController: _datePickerController,
                  //   onValueSelected: (date) {
                  //     setState(() {
                  //       now = date ;
                  //     });
                  //     print('selected = $now');
                  //   },
                  // ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Time",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(1.0, 2.0),
                        )
                      ]),
                  height: 60,
                  width: 60,
                  child: Center(
                      child: Text(
                        value.toInt().toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                ),
                SizedBox(width: 5),
                Text(
                  ":",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(1.0, 2.0),
                        )
                      ]),
                  height: 60,
                  width: 60,
                  child: Center(
                      child: Text(
                        value1.toInt().toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  )),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(1.0, 2.0),
                        )
                      ]),
                  height: 40,
                  width: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Center(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(border: InputBorder.none),
                        icon: SvgPicture.asset(
                          "assets/Drop down.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        value: "AM",
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "AM",
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            value: "AM",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "PM",
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            value: "PM",
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {

                            am_pm = value!.toString();

                          });
                          print(value);
                          print("changed");
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Hours",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
            ),
            Slider(

                thumbColor: Color(0xffF89F5B),
                inactiveColor: Colors.grey,
                activeColor: Color(0xff9C3587),
                min: 0,
                max: 12,
                value: value,
                onChanged: (n) {
                  setState(() {
                    value = n;
                    print(value.toInt());
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Minutes",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
            ),
            Slider(
                thumbColor: Color(0xffF89F5B),
                inactiveColor: Colors.grey,
                activeColor: Color(0xff9C3587),
                value: value1,
                min: 0,
                max: 60,
                onChanged: (n) {
                  setState(() {
                    value1 = n;
                  });
                }),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(1.0, 2.0),
                )
              ]),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Upload your House Image",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 25),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Upload_Photo(id: widget.id, type: widget.type, username: name, day: DateFormat('d').format(now), time: '${value.toInt().toString()}:${value1.toInt().toString()} ${am_pm}', date:  DateFormat('yyyy-MM-dd').format(now), ammount: widget.amount,);
                      }));
                    },
                    child: Container(
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
                      height: 110,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/uplooad pic.svg"),
                          SizedBox(height: 10),
                          Text(
                            "Upload",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 30),
            // SizedBox(
            //   width: 130,
            //   height: 30,
            //   child: ElevatedButton(
            //       onPressed: () {
            //         // Map<String , dynamic>  body=  {
            //         //
            //         //     "userId": "6439f15ae98af0dc09c16bcf",
            //         //     "sellerId": "643944727c89ea515877c546",
            //         //     "type": "Heater",
            //         //     "date": "2023-04-15T09:00:00Z",
            //         //     "day": "Friday",
            //         //     "time": "09:00 AM",
            //         //     "image": "<base64-encoded-image-data>",
            //         //     "amount": "50.00",
            //         //      "lat" : "10",
            //         //      "lon" : "10",
            //         //      "username" : "hello"
            //         // };
            //         // ApiServiceForStoringOrder.storeorder(body).then((value) => {
            //         //   if(value == true)
            //         // {
            //         //   print("Asd"),
            //         //
            //         // }else{
            //         //     print("error")
            //         //   }
            //         // });
            //
            //         // print(body.runtimeType);
            //         // showDialog(
            //         //   context: context,
            //         //   builder: (BuildContext context) => AlertDialog(
            //         //     title: Container(
            //         //         decoration: BoxDecoration(
            //         //           color: Colors.white,
            //         //           borderRadius: BorderRadius.circular(100),
            //         //         ),
            //         //         height: 100,
            //         //         width: 40,
            //         //         child: Column(
            //         //           children: [
            //         //             Text(
            //         //               "Your Request is to Proceed you\n     may get a notification",
            //         //               style: TextStyle(
            //         //                   fontSize: 16, color: Color(0xff653780)),
            //         //             ),
            //         //             SizedBox(height: 30),
            //         //             SizedBox(
            //         //               width: 110,
            //         //               height: 25,
            //         //               child: ElevatedButton(
            //         //                   onPressed: () {
            //         //
            //         //
            //         //                   },
            //         //                   style: ElevatedButton.styleFrom(
            //         //                       primary: Color(0xff9C3587),
            //         //                       shape: RoundedRectangleBorder(
            //         //                           borderRadius:
            //         //                               BorderRadius.circular(32))),
            //         //                   child: Text(
            //         //                     "ok",
            //         //                     style: TextStyle(
            //         //                         fontSize: 11, color: Colors.white),
            //         //                   )),
            //         //             ),
            //         //           ],
            //         //         )),
            //         //   ),
            //         // );
            //       },
            //       style: ElevatedButton.styleFrom(
            //           primary: Color(0xffc997c1),
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(32))),
            //       child: Text(
            //         "Continue",
            //         style: TextStyle(fontSize: 11, color: Colors.white),
            //       )),
            // ),
            // SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
