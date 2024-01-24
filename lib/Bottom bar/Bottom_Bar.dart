import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technician_customer_side/Account/Account.dart';
import 'package:technician_customer_side/Home%20Screen/Home_Screen.dart';

import '../Meesages/Messages/Messages.dart';
import '../My Orders/My_Orders.dart';

class Bottom_Bar extends StatefulWidget {
  const Bottom_Bar({Key? key}) : super(key: key);

  @override
  State<Bottom_Bar> createState() => _Bottom_BarState();
}

class _Bottom_BarState extends State<Bottom_Bar> {
  static final List<Widget> _widgetOptions = <Widget>[
    const My_Orders(),
    Home_Screen(),
    const Account(),
    const Messages(),

    const Text(
      'Index 1: Order',
      // style: optionStyle,
    ),
    const Text(
      'Index 2: Home',
      // style: optionStyle,
    ),
    const Text(
      'Index 3: Account',
      // style: optionStyle,
    ),
    const Text(
      'Index 4: Account',
      // style: optionStyle,
    ),
  ];

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable back button
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.black,
          child: BottomNavigationBar(
            // selectedItemColor: Colors.red,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/bottom bar order.svg"),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/bottom bar home.svg"),
                label: 'Home',
              ),

              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/bottom bar Account.svg"),
                label: 'Account',
              ),
              const BottomNavigationBarItem(

                icon: Icon(Icons.chat,color: Colors.grey,),
                label: 'Chat',
              ),


            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
