import 'package:flutter/material.dart';

class TeksInput extends StatelessWidget {
  final controller;
  final String katakunci;
  final bool obsecureText;

  const TeksInput(
      {super.key,
      required this.controller,
      required this.katakunci,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              katakunci,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            controller: controller,
            obscureText: obsecureText,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                fillColor: Colors.white,
                filled: true),
          ),
        ],
      ),
    );
  }
}
