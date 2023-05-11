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

  String id = "";
  @override
  void initState() {
    super.initState();
    setState(() {
      _checkLocationPermission();
    });
    inititialize();
  }

  String myid = "";

  inititialize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      myid = prefs.getString("id") ?? "";
    });


  }
  int n=-1;
  String _address="No Address";
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
    else{
      _locationData = await location.getLocation();
      longitude = _locationData.longitude!;
      latitude = _locationData.latitude!;
      final coordinates = new Coordinates(
          latitude, longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(
          coordinates);
      var first = addresses.first;
      setState(()async{
        print("Longitide:${latitude}");
        print("Longitide:${longitude}");
        _address="${first.addressLine}";

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.none,
            initialCameraPosition: CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 14.4746,
            ),
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
                height: 180,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Your Current Location",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 30,),

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
                    SizedBox(height: 30,),
                    SizedBox(
                      width: 170,
                      height: 33,
                      child: ElevatedButton(
                          onPressed: ()async{
                            if(_address=="No Address"){
                              _checkLocationPermission();

                              n=0;
                            }
                            else{
                              if(n==1){
                                if(myid == ""){
                                   Navigator.of(context).push(MaterialPageRoute(
                                       builder: (BuildContext context) {
                                         return Sign_In();
                                       }));


                                }
                                else {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return Bottom_Bar();
                                    }));
                                }
                              }
                              else{
                                n=1;
                              }
                            }
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString('address', _address);
                            setState(() {

                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xff9C3587),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32))),
                          child: Text(
                            _address=="No Address"?"Get yours":"Next",
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