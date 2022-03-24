import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kaivigan_2022/ui/waste/waste_found.dart';

import '../common/styles.dart';
import '../common/widgets/themedActinButton.dart';
import '../parking/components/primary_textfield.dart';

class WasteLocator extends StatefulWidget {
  static String routeName = "/waste_locator";

  const WasteLocator({Key? key}) : super(key: key);

  @override
  _WasteLocatorState createState() => _WasteLocatorState();
}

class _WasteLocatorState extends State<WasteLocator> {
  late GoogleMapController _controller;

  final MarkerId markerId = MarkerId(17.572441034033826.toString());
  late Marker marker1;

  @override
  void initState() {
    marker1 = Marker(
        markerId: markerId,
        position: LatLng(17.572441034033826, 120.38844343964323),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: 'Delivery Location'),
        onTap: () {});
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
                initialCameraPosition: CameraPosition(
                    target: LatLng(17.572441034033826, 120.38844343964323),
                    zoom: 14),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set Collectin Location',
                style: heading2,
              ),
              RadioListTile(
                value: true,
                groupValue: true,
                onChanged: (value) {},
                title: Text('Use my current location'),
              ),
              const Align(child: Text('or'), alignment: Alignment.center,),
              SizedBox(height: 20,),
              const PrimaryTextField(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                isdense: true,
                labelText: 'Set Location',
                hintText: 'Set Location',
              ),
              const SizedBox(height: 10,),
              ThemedActionButton(
                onTap: () => Navigator.pushNamed(context, WasteFound.routeName),
                buttonLabel: "Find Collector",
                fillColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
