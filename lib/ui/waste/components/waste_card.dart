import 'package:flutter/material.dart';

import '../../common/styles.dart';

class WasteCard extends StatelessWidget {
  final String image;
  final String date;
  final String time;

  const WasteCard({
    Key? key, required this.image, required this.date, required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 71,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Container(
                height: 43,
                width: 43,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        image),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: heading2,
                  ),
                  Text(
                    time,
                    style: subHeading2,
                  ),
                ],
              ),
            ],
          ),
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Color.fromARGB(17, 33, 47, 181),
        ),
      ),
    );
  }
}
