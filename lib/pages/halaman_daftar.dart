import 'package:flutter/material.dart';
import 'package:jastip_demo/Components/teks_input.dart';
import 'package:jastip_demo/Components/tombol_input.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart  ';

class HalamanDaftar extends StatefulWidget {
  final VoidCallback showloginpage;
  const HalamanDaftar({super.key, required this.showloginpage});

  @override
  State<HalamanDaftar> createState() => _HalamanDaftarState();
}

class _HalamanDaftarState extends State<HalamanDaftar> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final konfirmasipasswordcontroller = TextEditingController();

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    konfirmasipasswordcontroller.dispose();
    super.dispose();
  }

  Future daftar() async {
    if (passwordconfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usernamecontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
    }
  }

  bool passwordconfirmed() {
    if (passwordcontroller.text.trim() ==
        konfirmasipasswordcontroller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 209, 38),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromARGB(255, 250, 209, 38),
                      Color.fromARGB(255, 255, 84, 79),
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 300,
                    height: 200,
                  ),
                  Text(
                    "Silahkan Mendaftar".toUpperCase(),
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(143, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TeksInput(
                          controller: usernamecontroller,
                          obsecureText: false,
                          katakunci: 'Masukan Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TeksInput(
                          controller: passwordcontroller,
                          obsecureText: true,
                          katakunci: 'Masukan Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TeksInput(
                          controller: konfirmasipasswordcontroller,
                          obsecureText: true,
                          katakunci: 'Konfirmasi Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ButtonSaya(
                                onTap: daftar,
                                katatombol: 'Daftar'.toUpperCase(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah Memiliki Akun!',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 11.5),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: widget.showloginpage,
                          child: Text(
                            'Masuk Sekarang',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.5),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
