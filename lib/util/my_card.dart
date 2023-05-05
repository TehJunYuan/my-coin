import 'package:flutter/material.dart';

/*
  Function : reuseable card
  Design : the card can unlimited used for the card that include with image only
  Last udpated : 11 April 2023
*/
class MyCard extends StatelessWidget {
  final String image;
  const MyCard({super.key,
      required this.image,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill
          ),
        ),
        //cards
        width: double.infinity,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
