import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controllerCompleter = Completer();
  double latitude = 0.0;
  double longitude = 0.0;
  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    setState(() {

    });
  }

  Future<void> _checkLocationPermission() async {
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
        _locationData = await location.getLocation();
        setState(() {
          longitude = _locationData.longitude!;
          latitude = _locationData.latitude!;
          print("Longitide:${latitude}");
          print("Longitide:${longitude}");
        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: latitude==0.0&&longitude==0.0?LatLng(31.453246, 74.293170):LatLng(latitude, longitude),
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controllerCompleter.complete(controller);
            },
            markers: const LatLng(31.453246, 74.293170) != null
                ? <Marker>{
              Marker(
                markerId: const MarkerId("current_location"),
                position: LatLng(latitude, latitude),
                infoWindow: const InfoWindow(
                  title: "Current Location",
                  snippet: "This is your current location.",
                ),
              ),
            } : <Marker>{},

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
                height: 180,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Select Your Location",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1.0, 2.0))
                          ]),
                      height: 30,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 20),
                            prefixIcon: SvgPicture.asset(
                              "assets/Service Search.svg",
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: "Type your address here",
                            hintStyle: TextStyle(
                                fontSize: 9, color: Color(0xffACACAC))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/serviceLocation.svg"),
                          SizedBox(width: 5),
                          Text(
                            "21, Alex Davidson Avenue, Opposite Omegatron, Vicent",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 170,
                      height: 33,
                      child: ElevatedButton(
                          onPressed: _checkLocationPermission,
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff9C3587),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text(
                            "Select current address",
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