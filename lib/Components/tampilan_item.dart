import 'package:flutter/material.dart';

class TampilanItem extends StatelessWidget {
  const TampilanItem({
    super.key,
    required this.namabarang,
    required this.asetbarang,
  });

  final String namabarang;
  final String asetbarang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color.fromARGB(255, 255, 84, 79),
            ),
          ),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      namabarang.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Rp. 25000',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Image.asset(asetbarang),
            ],
          ),
        ),
      ),
    );
  }
}
