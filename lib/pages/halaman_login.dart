import 'package:flutter/material.dart';
import 'package:jastip_demo/Components/teks_input.dart';
import 'package:jastip_demo/Components/tombol_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key, required this.showregisterpage});

  final VoidCallback showregisterpage;

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  String eror = '';
  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  Future masuk() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernamecontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print('Failed With error code : ${e.code}');
      print(e.message);
      setState(() {
        eror = "Username Atau Password Salah";
      });
    }
  }

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                    "Selamat Datang".toUpperCase(),
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(143, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TeksInput(
                          controller: usernamecontroller,
                          obsecureText: false,
                          katakunci: 'Masukan Email',
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TeksInput(
                          controller: passwordcontroller,
                          obsecureText: true,
                          katakunci: 'Masukan Password',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Lupa Password?',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
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
                                onTap: masuk,
                                katatombol: 'Masuk'.toUpperCase(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Belum Mempunyai Akun?',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 11.5),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: widget.showregisterpage,
                          child: const Text(
                            'Daftar Sekarang',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    eror,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
