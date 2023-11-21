import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jastip_demo/pages/halaman_cari.dart';
import 'package:jastip_demo/pages/halaman_pesan.dart';
import 'package:jastip_demo/pages/halaman_user.dart';
import 'package:jastip_demo/pages/main_menu.dart';
import 'package:line_icons/line_icons.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _selectedindex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _halaman = [
    const MainMenu(),
    const HalamanCari(),
    const HalamanPesan(),
    const HalamanUser(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _halaman[_selectedindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: GNav(
          selectedIndex: _selectedindex,
          onTabChange: _navigateBottomBar,
          color: const Color.fromARGB(255, 255, 84, 79),
          activeColor: Colors.white,
          padding: const EdgeInsets.all(10),
          tabBorder: Border.all(color: Colors.white, style: BorderStyle.solid),
          tabBackgroundGradient: const LinearGradient(colors: [
            Color.fromARGB(255, 250, 209, 38),
            Color.fromARGB(255, 255, 84, 79),
          ]),
          gap: 5,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineIcons.search,
              text: 'Search',
            ),
            GButton(
              icon: LineIcons.inbox,
              text: 'Pesan',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
