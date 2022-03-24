import 'package:flutter/material.dart';
import 'package:kaivigan_2022/ui/common/styles.dart';
import 'package:kaivigan_2022/ui/parking/components/parking_card.dart';

import 'components/primary_textfield.dart';

class ParkingLayout extends StatefulWidget {
  static String routeName = "/parking";

  const ParkingLayout({Key? key}) : super(key: key);

  @override
  _ParkingLayoutState createState() => _ParkingLayoutState();
}

class _ParkingLayoutState extends State<ParkingLayout> {
  final List<Map<String, dynamic>> parkingSpot = [
    {
      "name": "Parking Number1",
      "location": "Sample Location 1",
      "available": "10 Available Space",
      "Image": "https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/unsplash_rCZQCbUAQvg.png?alt=media&token=00d8a5f1-50a1-4724-b0b5-73b69f9e5a47"
    },
    {
      "name": "Parking Number2",
      "location": "Sample Location 2",
      "available": "1 Available Space",
      "Image": "https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/unsplash_wftNpcjCHT4.png?alt=media&token=27fe6d0d-cd18-4f3f-833c-95381698e738"
    },
    {
      "name": "Parking Number3",
      "location": "Sample Location 3",
      "available": "5 Available Space",
      "Image": "https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/unsplash_yvfp5YHWGsc.png?alt=media&token=c2dc5da6-3e5c-49cf-a5bd-ae2686496c5a"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: const Text(
          'Parking Space',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Your current location', style: subHeading1),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.location_pin,
                    color: Colors.lightBlueAccent,
                  ),
                  Text(
                    'Barangay I, Vigan City',
                    style: heading1,
                  ),
                  Icon(Icons.arrow_drop_down_outlined)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const PrimaryTextField(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                isdense: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                labelText: 'Search',
                hintText: 'Search',
                suffixIcon: Icon(Icons.settings_input_composite_sharp),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Near Your Location',
                style: heading2,
              ),
              const Text('10 available parking location ', style: subHeading2),
              ...parkingSpot.map((e) => ParkingCard(
                  parkingNumber: e['name'],
                  location: e['location'],
                  availableSpace: e['available'],
                  image: e['Image']))
            ],
          ),
        ),
      ),
    );
  }
}
