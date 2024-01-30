import 'package:aplikasi_pertama/createContact.dart';
import 'package:aplikasi_pertama/welcomepage.dart';
import 'package:aplikasi_pertama/widget/MaterialScreen.dart';
import 'package:aplikasi_pertama/widget/SettingScreen.dart';
import 'package:aplikasi_pertama/widget/contactScreen.dart';
import 'package:aplikasi_pertama/widget/galeryScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  // final List<Widget> _children = [
  //   const ContactList(),
  //   MaterialScreen(),
  // ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: WelcomePage(),
      routes: {
        '/contact': (context) => const FormCOntact(),
        '/gallery': (context) => GalleryScreen(),
      },
    );
  }

  void onTabTapped(int index) {
    setState(() {
      setState(() {
        _currentIndex = index; // ubah indeks tombol yang aktif
      });
    });
  }
}
