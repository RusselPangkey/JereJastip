import 'package:flutter/material.dart';

class ButtonSaya extends StatelessWidget {
  final Function()? onTap;
  final String katatombol;

  ButtonSaya({super.key, required this.onTap, required this.katatombol});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white54)),
        child: Text(
          katatombol,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
