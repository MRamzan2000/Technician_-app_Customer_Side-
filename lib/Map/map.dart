import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Bottom bar/Bottom_Bar.dart';
import '../Sign In/Sign_In.dart';

class MapSample extends StatefulWidget {
  final double lat;
  final double long;
  const MapSample({Key? key, required this.lat, required this.long}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controllerCompleter = Completer();

  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  String id = "";

  String myid = "";

  inititialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      myid = prefs.getString("id") ?? "";
    });


  }
  int n=-1;
  String _address="No Address";

  @override
  void initState() {
    super.initState();
    latitude = widget.lat;
    longitude = widget.long;
    setState(() {


    });
    _goToTheLake();
    initialice();
  }
  initialice() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _address = prefs.getString("address").toString();
    });


  }

late double latitude  ; // Example latitude value
late double longitude ;
  late  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(longitude,longitude),
    zoom: 14.4746,
  );


  late CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(latitude, longitude),
    // tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );


  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controllerCompleter.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(

            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,

            onMapCreated: (GoogleMapController controller) {
              _controllerCompleter.complete(controller);
            },

            markers:<Marker>{
              Marker(
                markerId: const MarkerId("current_location"),
                position: LatLng(latitude, latitude),
                infoWindow: const InfoWindow(
                  title: "Current Location",
                  snippet: "This is your current location.",
                ),
              ),
            } ,

          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: InkWell(
              onTap: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return Type_of_work();
                // }));
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
                height: 40,
                width: MediaQuery.of(context).size.width / 3.2,
                child: const Center(
                    child: Text(
                      "Service App",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    )),
              ),
            ),
          ),
          // Center(child: Image.asset("assets/Group 11971.png")),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(50)),
                height: 200,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Your Current Location",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: Text(
                          "${_address}",
                          style: TextStyle(fontSize: 12, color: Colors.black,),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 170,
                      height: 33,
                      child: ElevatedButton(
                          onPressed: ()async{
                            // if(_address=="No Address"){
                            //   _goToTheLake();
                            //
                            //
                            //   n=0;
                            // }
                            // else{
                            //   if(n==1){
                            //     if(myid == ""){
                                   Navigator.of(context).push(MaterialPageRoute(
                                       builder: (BuildContext context) {
                                         return Sign_In();
                                       }));


                                // }
                                // else {
                                //   Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (BuildContext context) {
                                //       return Bottom_Bar();
                                //     }));
                                // }
                              // }
                              // else{
                              //   n=1;
                              // }
                            // }
                            // final prefs = await SharedPreferences.getInstance();
                            // prefs.setString('address', _address);
                            // setState(() {
                            //
                            // });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff9C3587),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text("Lets Go",
                            // _address=="No Address"?"Get yours":"Next",
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}