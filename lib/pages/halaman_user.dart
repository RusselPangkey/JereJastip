import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HalamanUser extends StatefulWidget {
  const HalamanUser({super.key});

  @override
  State<HalamanUser> createState() => _HalamanUserState();
}

class _HalamanUserState extends State<HalamanUser> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.amber,
        title: Text('Profil'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('Apakah Anda Ingin Keluar ?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Tidak"),
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
                          },
                          child: Text("Ya"),
                        ),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selamat Datang ${user.email!}'),
            MaterialButton(
              color: Colors.lightBlue,
              child: const Text('Keluar'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
