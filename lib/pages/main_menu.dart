import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jastip_demo/Components/tampilan_item.dart';
import 'package:jastip_demo/Components/tampilan_toko.dart';
import 'package:jastip_demo/pages/halaman_pesanan.dart';
import 'package:jastip_demo/pages/halaman_toko.dart';
import 'package:line_icons/line_icons.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final user = FirebaseAuth.instance.currentUser!;

  final List _kota = [
    'mantos',
    'megamall',
    'indogrosir',
    'lippo Plaza',
    'Transmart',
    'Aroma',
  ];

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(
              LineIcons.shoppingBag,
              color: Color.fromARGB(255, 255, 84, 79),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hallo',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    user.email.toString().trim().toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 84, 79),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'More',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: ListView.builder(
                  itemCount: _kota.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HalamanToko(
                              namatoko: _kota[index],
                            ),
                          ),
                        );
                      },
                      child: TampilanKota(
                        tekskota: _kota[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 5),
                  child: Text(
                    'Kami Menyarankan',
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HalamanPesanan(
                                namabarang: item[index],
                                gambarbarang: asetbarang[index]),
                          ),
                        );
                      },
                      child: TampilanItem(
                        namabarang: item[index],
                        asetbarang: asetbarang[index],
                      ),
                    );
                  }),
            ),
            Container(height: 200, child: Text('Test123')),
          ],
        ),
      ),
    );
  }
}
