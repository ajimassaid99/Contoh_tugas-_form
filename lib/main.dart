import 'dart:io';

import 'package:aplikasi_pertama/bloc/text_bloc.dart';
import 'package:aplikasi_pertama/createContact.dart';
import 'package:aplikasi_pertama/feature/auth/bloc/auth_bloc.dart';
import 'package:aplikasi_pertama/feature/auth/view/loginPage.dart';
import 'package:aplikasi_pertama/feature/auth/view/singUpPage.dart';
import 'package:aplikasi_pertama/feature/auth/view/userListPage.dart';
import 'package:aplikasi_pertama/model/userModel.dart';
import 'package:aplikasi_pertama/view-model/mainProvider.dart';
import 'package:aplikasi_pertama/view-model/themeProvider.dart';
import 'package:aplikasi_pertama/welcomepage.dart';
import 'package:aplikasi_pertama/widget/MaterialScreen.dart';
import 'package:aplikasi_pertama/view/contactScreen.dart';
import 'package:aplikasi_pertama/widget/galeryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var path = Directory.current.path;
    Hive
      ..init(path)
      ..registerAdapter(UserModelAdapter());
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<TextBloc>(create: (context) => TextBloc()),
      BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
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
    //  final counter = Provider.of<Counter>(context);
    return MaterialApp(
      // theme: counter.isDarkMode?ThemeData.dark():ThemeData.light(),
      title: 'Material App',
      home: BlocProvider(
        create: (context) => TextBloc(),
        child: const LoginPage(),
      ),
      routes: {
        '/contact': (context) => const FormCOntact(),
        '/gallery': (context) => GalleryScreen(),
        '/SingUp': (context) => SignUpPage(),
        '/userList': (context) => UserListPage()
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
