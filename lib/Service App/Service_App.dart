import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Service_App extends StatelessWidget {
  const Service_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/Service app.svg",
            fit: BoxFit.cover,
          ),
          SvgPicture.asset(
            "assets/Service app shadow.svg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
                height: 40,
                width: MediaQuery.of(context).size.width / 3.2,
                child: Center(
                    child: Text(
                  "Service App",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                )),
              ),
            ),
          ),
          Center(child: Image.asset("assets/Group 11971.png")),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(32)),
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Select Your Location",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    height: 40,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/service arrow.svg"),
                          Text(
                            "Map View",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            height: 25,
                            width: 180,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: SvgPicture.asset(
                                  "assets/service search (2).svg",
                                  fit: BoxFit.scaleDown,
                                ),
                                contentPadding: EdgeInsets.only(bottom: 17),
                                hintText: "Type your address here",
                                hintStyle: TextStyle(
                                    fontSize: 9, color: Color(0xffACACAC)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: AssetImage("assets/pic.png.webp"),
                                    fit: BoxFit.cover)),
                            height: 30,
                            width: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
