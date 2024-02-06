import 'package:aplikasi_pertama/createContact.dart';
import 'package:aplikasi_pertama/provider/mainProvider.dart';
import 'package:aplikasi_pertama/provider/themeProvider.dart';
import 'package:aplikasi_pertama/welcomepage.dart';
import 'package:aplikasi_pertama/widget/MaterialScreen.dart';
import 'package:aplikasi_pertama/widget/contactScreen.dart';
import 'package:aplikasi_pertama/widget/galeryScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      Provider<Counter>(create: (_) => Counter()),
      Provider<ThemeProvider>(create: (_) => ThemeProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const ContactList(),
    MaterialScreen(),
  ];


  @override
  Widget build(BuildContext context) {
     final counter = Provider.of<Counter>(context);
    return MaterialApp(
      theme: counter.isDarkMode?ThemeData.dark():ThemeData.light(),
      title: 'Material App',
      home: const WelcomePage(),
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
