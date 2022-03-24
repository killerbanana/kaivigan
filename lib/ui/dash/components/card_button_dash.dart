import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/styles.dart';
class CardButtonDash extends StatelessWidget {
  final Function() callback;
  final String image;
  final String title;
  const CardButtonDash({
    Key? key, required this.callback, required this.image, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(onTap: callback,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        image),
                  ),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(20)
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(child: Text(title, style: heading4, maxLines: 2, textAlign: TextAlign.center,), width: 120,)
      ],
    );
  }
}