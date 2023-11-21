import 'package:flutter/material.dart';
import 'package:jastip_demo/pages/halaman_daftar.dart';
import 'package:jastip_demo/pages/halaman_login.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void togglescreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return HalamanLogin(showregisterpage: togglescreen);
    } else {
      return HalamanDaftar(
        showloginpage: togglescreen,
      );
    }
  }
}
