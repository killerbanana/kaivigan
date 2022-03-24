import 'package:flutter/material.dart';
class DashHeader extends StatelessWidget {
  const DashHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208,
      child: Stack(
        children: [
          Container(
            height: 208,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter:
                ColorFilter.mode(Colors.black45, BlendMode.darken),
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/kaivigan-1.appspot.com/o/unsplash_o5vMbDIvPQI.png?alt=media&token=19d50003-cc27-44f2-91c2-90070057a724'),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Welcome To Vigan!',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}