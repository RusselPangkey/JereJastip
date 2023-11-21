import 'package:flutter/material.dart';

class HalamanCari extends StatefulWidget {
  const HalamanCari({super.key});

  @override
  State<HalamanCari> createState() => _HalamanCariState();
}

class _HalamanCariState extends State<HalamanCari> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: 500,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          ),
          Center(
            child: Text('Halaman Cari'),
          ),
        ],
      ),
    );
  }
}
