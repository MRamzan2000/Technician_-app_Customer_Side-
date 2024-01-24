import 'dart:async';
import 'dart:math';
import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import '../Api/SignUpApi.dart';
import 'package:location/location.dart';

import '../Map/map.dart';



class Sign_Up extends StatefulWidget {
  const Sign_Up({Key? key}) : super(key: key);

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {

  double latitude = 0.0;
  double longitude = 0.0;
  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  late TwilioFlutter twilioFlutter;
  @override
  void initState() {


    firstname = TextEditingController();
    lastname = TextEditingController();
    email = TextEditingController();
    pass = TextEditingController();
    phone = TextEditingController();
    idofIqama = TextEditingController();
    twilioFlutter = TwilioFlutter(
        accountSid: "ACc6f159fb5f0f63c7988b171d25d16c6f",
        authToken: "aea7a8019e5003a1f21e22d8491b5c21",
        twilioNumber: "+15856321097"
    );
    super.initState();

    inititialize();
  }

  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController email;
  late TextEditingController pass;
  late TextEditingController phone;
  late TextEditingController idofIqama;
  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill all required fields';
    }
    return null;
  }



  String city = "Lahore";
// Generate a 4-digit OTP code
  var numbber = 0;
  final _formKey = GlobalKey<FormState>();


  void sendSms() async {
    var random = Random();
    numbber =  random.nextInt(9000) + 1000;
    twilioFlutter.sendSMS(
        toNumber: phone.text.toString(),
        messageBody: 'Hii everyone this is a $numbber of\nflutter twilio sms.').then((value) {
          print(value);
    });
  }

  String _address="No Address";
  String latlong="No latlong";

  String myid = "";
  String id = "";
  int n=-1;



  inititialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      myid = prefs.getString("id") ?? "";
    });


  }
  Future<void> _checkLocationPermission() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Getting Your Location Please Wait!'),
      ),
    );
    setState(() {
      _loading = true;
    });

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    bool locationObtained = false;
    while (!locationObtained) {
      try {
        _locationData = await location.getLocation();
        longitude = _locationData.longitude!;
        latitude = _locationData.latitude!;
        final coordinates = Coordinates(latitude, longitude);
        var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        var first = addresses.first;
        final prefs = await SharedPreferences.getInstance();
        setState(() {
          print("lat : "  + latitude.toString());
          print("lot: " + longitude.toString());
           _address = "${longitude+ latitude}";
          latlong = first.addressLine;
          prefs.setString('address', first.addressLine);
          prefs.setString('lat', latitude.toString());
          prefs.setString('long', longitude.toString());
          print(_address);
        });
        upload();

        locationObtained = true;
      } catch (e) {
        // Location not obtained, retrying...
        print(e);
        await Future.delayed(const Duration(seconds: 1));
      }
    }


  }

  // Future<void> _checkLocationPermission() async {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar( content: Text('Getting Your Location Please Wait!'), ));
  //   setState(() {
  //     _loading = true;
  //   });
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       _locationData = await location.getLocation();
  //       setState(() {
  //         longitude = _locationData.longitude!;
  //         latitude = _locationData.latitude!;
  //         print("Longitide:${latitude}");
  //         print("Longitide:${longitude}");
  //       });
  //     }
  //   }
  //   else{
  //     _locationData = await location.getLocation();
  //     longitude = _locationData.longitude!;
  //     latitude = _locationData.latitude!;
  //     final coordinates = new Coordinates(
  //         latitude, longitude);
  //     var addresses = await Geocoder.local.findAddressesFromCoordinates(
  //         coordinates);
  //     var first = addresses.first;
  //     setState(()async{
  //       print("Longitide:${latitude}");
  //       print("Longitide:${longitude}");
  //       _address="${first.addressLine}";
  //
  //     });
  //     setState(() {
  //       _loading = false;
  //     });
  //   }
  // }

  upload(){

    Map<String, dynamic> body = {
      "firstname": firstname.text,
      "lastname": lastname.text,
      "password": pass.text,
      "phonenumber": phone. text,
      "city": "المدينة",
      "dateofbirth": dob.toString(),

    };
    ApiServiceForSignup.signup(body).then((value) => {
      if (value.message == "User created successfully")
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return  MapSample(lat: latitude, long: longitude,);
              })),
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar( content: Text('User Created Successfully!'), )),
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
  }
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  SvgPicture.asset("assets/Sign up.svg",
                      height: MediaQuery.of(context).size.height / 3),
                  const SizedBox(height: 30),
                  const Text(
                    "التسجيل",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: validateRequired,
                      controller: firstname,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20),
                          hintText: "الاسم",
                          hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: validateRequired,

                      controller: lastname,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20),
                          hintText: "الاسم الأخير",
                          hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                    ),
                  ),
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
                      validator: validateRequired,

                      controller: pass,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20),
                          hintText: "كلمة المرور",
                          hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: validateRequired,

                      keyboardType: TextInputType.number,

                      controller: idofIqama,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20),
                          hintText: "معرف الإقامة",
                          hintStyle: TextStyle(fontSize: 11, color: Colors.black)),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(width: 20,),
                          // SizedBox(
                          //   height: 40,
                          //   width: 80,
                          //   child: DropdownButtonFormField(
                          //     icon:
                          //     SvgPicture.asset("assets/Drop down.svg"),
                          //     value: "Lahore",
                          //     items: [
                          //       DropdownMenuItem(
                          //         child: Text(
                          //           "Lahore",
                          //           style: TextStyle(
                          //               fontSize: 14, color: Colors.black),
                          //         ),
                          //         value: "Lahore",
                          //       ),
                          //       DropdownMenuItem(
                          //         child: Text(
                          //           "Islamabad",
                          //           style: TextStyle(
                          //               fontSize: 14, color: Colors.black),
                          //         ),
                          //         value: "Islamabad",
                          //       ),
                          //       DropdownMenuItem(
                          //         child: Text(
                          //           "Jhelum",
                          //           style: TextStyle(
                          //               fontSize: 14, color: Colors.black),
                          //         ),
                          //         value: "Jhelum",
                          //       ),
                          //       DropdownMenuItem(
                          //         child: Text(
                          //           "Faislabad",
                          //           style: TextStyle(
                          //               fontSize: 14, color: Colors.black),
                          //         ),
                          //         value: "Faislabad",
                          //       ),
                          //       DropdownMenuItem(
                          //         child: Text(
                          //           "karachi",
                          //           style: TextStyle(
                          //               fontSize: 14, color: Colors.black),
                          //         ),
                          //         value: "karachi",
                          //       ),
                          //       DropdownMenuItem(
                          //         child: Text(
                          //           "Sindh",
                          //           style: TextStyle(
                          //               fontSize: 14, color: Colors.black),
                          //         ),
                          //         value: "Sindh",
                          //       )
                          //     ],
                          //     onChanged: (value) {
                          //       setState(() {
                          //         city=value.toString();
                          //       });
                          //     },
                          //   ),
                          // ),
                          Text("المدينة"),
                          SizedBox(width: 5),
                        ],
                      ),),
                      Expanded(child: ElevatedButton(
                          onPressed: () => _selectDate(context),
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xffFFFFFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text(
                            dob,
                            style: const TextStyle(
                                fontSize: 11, color: Color(0xff9C3587)),
                          ))  ),
                      const SizedBox(width: 20,),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 130,
                    height: 30,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {

                            // if(_address=="No Address"){
                              _checkLocationPermission();

                              // n=0;
                            // }

                          }


                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff9C3587),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32))),
                        child: const Text(
                          "التسجيل",
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
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "تسجيل الدخول",
                          style: TextStyle(fontSize: 12, color: Color(0xff585D5E)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DateTime _selectedDate=DateTime.now();
  String dob='تاريخ الميلاد';
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), initialEntryMode: DatePickerEntryMode.calendarOnly
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // dob = DateFormat('yyyy-MM-dd').format(_selectedDate);
        dob = DateFormat('dd-MM-yyyy').format(_selectedDate);
        setState(() {

        });
      });
    }
  }

}


