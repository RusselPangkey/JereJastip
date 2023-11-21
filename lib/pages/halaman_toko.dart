import 'package:flutter/material.dart';
import 'package:jastip_demo/Components/tampilan_item.dart';
import 'package:jastip_demo/pages/halaman_pesanan.dart';

class HalamanToko extends StatelessWidget {
  HalamanToko({
    super.key,
    required this.namatoko,
  });

  final String namatoko;

  final List item = [
    'Susu Frisian Flag Kaleng',
    'Susu Kental Manis Frisian Flag',
    'Tepung Tapioka Rose Brand',
    'Van Houten Cocoa',
  ];

  final List asetbarang = [
    'assets/FrisianFlagKaleng.png',
    'assets/KentalManisFrisianFlag.png',
    'assets/TepunTapiokaRoseBrand.png',
    'assets/VanHoutenCocoa.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12),
                    child: Text(
                      namatoko.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HalamanPesanan(
                                namabarang: item[index],
                                gambarbarang: asetbarang[index],
                              ),
                            ));
                      },
                      child: TampilanItem(
                        namabarang: item[index],
                        asetbarang: asetbarang[index],
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
