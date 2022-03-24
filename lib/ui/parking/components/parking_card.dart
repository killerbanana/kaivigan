import 'package:flutter/material.dart';

import '../../common/styles.dart';

class ParkingCard extends StatelessWidget {
  final String parkingNumber;
  final String location;
  final String availableSpace;
  final String image;

  const ParkingCard({
    Key? key,
    required this.parkingNumber,
    required this.location,
    required this.availableSpace,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: 5,
      child: Container(
        height: 91,
        child: Row(
          children: [
            Container(
              height: 91,
              width: 98,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter:
                      const ColorFilter.mode(Colors.black45, BlendMode.darken),
                  image: NetworkImage(image),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  parkingNumber,
                  style: heading2,
                ),
                Text(
                  location,
                  style: subHeading2,
                ),
                Text(
                  availableSpace,
                  style: subHeading3,
                ),
              ],
            )
          ],
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
