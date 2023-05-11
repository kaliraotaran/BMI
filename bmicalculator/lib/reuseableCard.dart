import 'package:flutter/material.dart';

class reuseablecard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  const reuseablecard(
      {required this.colour, required this.cardChild, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(10),
        height: 230,
        width: 170,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
