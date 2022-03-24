import 'package:flutter/material.dart';

import '../common/styles.dart';
import '../dash/components/card_button_dash.dart';

class EmergencyLayout extends StatefulWidget {
  static String routeName = "/emergency";

  const EmergencyLayout({Key? key}) : super(key: key);

  @override
  _EmergencyLayoutState createState() => _EmergencyLayoutState();
}

class _EmergencyLayoutState extends State<EmergencyLayout> {
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
          'Emergency Service',
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
              const SizedBox(
                child: Text(
                  'Choose the emergency service that you need',
                  style: subHeading1,
                  maxLines: 2,
                ),
                width: 230,
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardButtonDash(
                      callback: () => {},
                      title: 'Police Station',
                      image:
                          'https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Police.png?alt=media&token=613e72bd-76e1-490b-925b-35709cf229e3',
                    ),
                    CardButtonDash(
                        callback: () => {},
                        image:
                            'https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Fire%20Truck.png?alt=media&token=1ba6c00f-56b7-4f0d-ae1a-e656a768fb48',
                        title: 'Fire Station')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardButtonDash(
                      callback: () => {},
                      title: 'Hospital',
                      image:
                      'https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Hospital.png?alt=media&token=12035909-b734-4761-9a05-32bd75eea538',
                    ),
                    CardButtonDash(
                        callback: () => {},
                        image:
                        'https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/Ambulance.png?alt=media&token=ccdf1f19-3e7b-4931-b4cb-c37805af4d43',
                        title: 'Ambulance')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
