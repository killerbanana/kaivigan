import 'package:flutter/material.dart';
import 'package:kaivigan_2022/ui/common/styles.dart';
import 'package:kaivigan_2022/ui/emergency/emergency_layout.dart';
import 'package:kaivigan_2022/ui/parking/parking_layout.dart';
import 'package:kaivigan_2022/ui/waste/waste_layout.dart';
import 'components/card_button_dash.dart';
import 'components/dash_header.dart';

class DashLayout extends StatefulWidget {
  static String routeName = "/dashboard";

  const DashLayout({Key? key}) : super(key: key);

  @override
  State<DashLayout> createState() => _DashLayoutState();
}

class _DashLayoutState extends State<DashLayout> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const DashHeader(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardButtonDash(
                  callback: () =>
                      Navigator.pushNamed(context, ParkingLayout.routeName),
                  title: 'Parking Space',
                  image:
                      'https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Indoor%20Parking.png?alt=media&token=ce41ef70-fe20-464c-aa9f-ccd9e1f729e6',
                ),
                CardButtonDash(
                    callback: () => Navigator.pushNamed(context, EmergencyLayout.routeName),
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Siren.png?alt=media&token=ab8d1550-b27b-4b13-b826-8c5235ab0e13',
                    title: 'Emergency')
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardButtonDash(
                    callback: () => Navigator.pushNamed(context, WasteLayout.routeName),
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Waste%20Separation.png?alt=media&token=88ee6aa0-9b33-4f13-9bf9-627ac8ff33c1',
                    title: 'Waste Management'),
                CardButtonDash(
                    callback: () => {},
                    image:
                        'https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Bus.png?alt=media&token=a7316e30-899c-4fbf-9c86-df7b116c844e',
                    title: "Bus")
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
