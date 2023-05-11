import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Iconswidget extends StatelessWidget {
  Iconswidget({super.key, required this.gender, required this.icons});
  // ignore: prefer_typing_uninitialized_variables
  var gender;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 4,
        ),
        Icon(
          icons,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: const TextStyle(fontSize: 25),
        )
      ],
    );
  }
}
