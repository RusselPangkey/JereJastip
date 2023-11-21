import 'package:flutter/material.dart';

class TampilanKota extends StatelessWidget {
  const TampilanKota({
    super.key,
    required this.tekskota,
  });
  final String tekskota;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(tekskota),
              ),
            ),
            Text(
              tekskota.toUpperCase(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 84, 79),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
