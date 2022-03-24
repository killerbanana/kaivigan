import 'package:flutter/material.dart';
import 'package:kaivigan_2022/ui/common/styles.dart';

class CollectorResultCard extends StatelessWidget {
  final String collectorNumber;
  final String location;
  final String image;
  const CollectorResultCard({
    Key? key, required this.collectorNumber, required this.location, required this.image,
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
                    image: NetworkImage(image),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          collectorNumber,
                          style: heading2,
                        ),
                        Text(
                          location,
                          style: subHeading2,
                        ),
                      ],
                    ),
                    const Padding(
                      child: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                      padding: EdgeInsets.only(right: 20),
                    )
                  ],
                ),
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
