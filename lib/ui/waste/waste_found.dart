import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/styles.dart';
import '../common/widgets/themedActinButton.dart';
import '../parking/components/primary_textfield.dart';
import 'components/collector_result_card.dart';

class WasteFound extends StatefulWidget {
  static String routeName = "/waste_found";

  const WasteFound({Key? key}) : super(key: key);

  @override
  _WasteFoundState createState() => _WasteFoundState();
}

class _WasteFoundState extends State<WasteFound> {
  late GoogleMapController _controller;

  final MarkerId markerId = MarkerId(17.572441034033826.toString());
  late Marker marker1, marker2, marker3;

  final List<Map<String, dynamic>> _collectorFound = [
    {
      "number": "Collector # 1",
      "location": "sample location 1",
      "Image":
      "https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/unsplash_3FPtmyflfKQ.png?alt=media&token=690a4ecb-ceb6-44de-88ee-f7399805c1a3"
    },
    {
      "number": "Collector #2",
      "location": "sample location 2",
      "Image":
      "https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/unsplash_3FPtmyflfKQ.png?alt=media&token=690a4ecb-ceb6-44de-88ee-f7399805c1a3"
    },
    {
      "number": "Collector # 3",
      "location": "sample location 3",
      "Image":
      "https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/unsplash_3FPtmyflfKQ.png?alt=media&token=690a4ecb-ceb6-44de-88ee-f7399805c1a3"
    },
  ];

  @override
  void initState() {
    const MarkerId markerId = MarkerId("marker1");
    const MarkerId markerId2 = MarkerId("marker2");
    const MarkerId markerId3 = MarkerId("marker3");

    marker1 = Marker(
        markerId: markerId,
        position: LatLng(17.572441034033826, 120.38844343964323),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
            title: 'Delivery Location'
        ),
        onTap: () {}
    );
    marker2 = Marker(
        markerId: markerId2,
        position: LatLng(17.572495769464428, 120.38731428509263),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
            title: 'Delivery Location'
        ),
        onTap: () {}
    );
    marker3 = Marker(
        markerId: markerId3,
        position: LatLng(17.571352403696398, 120.38773532577251),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
            title: 'Delivery Location'
        ),
        onTap: () {}
    );

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Your current location', style: subHeading1),
            Row(
              children: const [
                Icon(
                  Icons.location_pin,
                  color: Colors.lightBlueAccent,
                ),
                Text(
                  'Barangay I, Vigan City',
                  style: heading2,
                ),
                Icon(Icons.arrow_drop_down_outlined)
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GoogleMap(
                mapType: MapType.normal,
                markers: {
                  marker1,
                  marker2,
                  marker3
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(17.572441034033826, 120.38844343964323),
                    zoom: 17),
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Showing 3 Results',
                      style: heading2,
                    ),
                    Icon(Icons.sort),
                  ],
                ),
                ..._collectorFound.map((e) => CollectorResultCard(collectorNumber: e['number'], location: e['location'], image: e['Image']))
              ],
            ),
          ),
        ),
      ),
    );
  }
}