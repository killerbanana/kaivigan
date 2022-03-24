import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kaivigan_2022/ui/common/styles.dart';
import 'package:kaivigan_2022/ui/waste/waste_locator.dart';

import '../common/widgets/themedActinButton.dart';
import 'components/waste_card.dart';

class WasteLayout extends StatefulWidget {
  static String routeName = "/waste";

  const WasteLayout({Key? key}) : super(key: key);

  @override
  _WasteLayoutState createState() => _WasteLayoutState();
}

class _WasteLayoutState extends State<WasteLayout> {
  final List<Map<String, dynamic>> _wasteManagement = [
    {
      "date": "March 28, 2022",
      "time": "Time: 6 am to 6 pm",
      "Image":
          "https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Monday.png?alt=media&token=4a980c58-edbb-43d8-897f-605d3aa87859"
    },
    {
      "date": "April 4, 2022",
      "time": "Time: 6 am to 6 pm",
      "Image":
          "https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Monday.png?alt=media&token=4a980c58-edbb-43d8-897f-605d3aa87859"
    },
    {
      "date": "April 11, 2022",
      "time": "Time: 6 am to 6 pm",
      "Image":
          "https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Monday.png?alt=media&token=4a980c58-edbb-43d8-897f-605d3aa87859"
    },
  ];


  late Marker marker1, marker2, marker3;

  @override
  void initState() {

    super.initState();
  }

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
          'Waste Management',
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
            mainAxisAlignment: MainAxisAlignment.start,
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
                height: 20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Collection Schedule',
                  style: heading3Italic,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ..._wasteManagement.map(
                (e) => WasteCard(
                  image: e['Image'],
                  date: e['date'],
                  time: e['time'],
                ),
              ),
              const SizedBox(height: 20,),
              ThemedActionButton(
                onTap: () {},
                buttonLabel: "Contact Collector",
                fillColor: Colors.blueAccent,
              ),
              const SizedBox(height: 10,),
              ThemedActionButton(
                onTap: () => Navigator.pushNamed(context, WasteLocator.routeName),
                buttonLabel: "Locate Disposal",
                fillColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
