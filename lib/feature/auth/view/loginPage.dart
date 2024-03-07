import 'package:aplikasi_pertama/core/reusabel_widget/custom_text_field.dart';
import 'package:aplikasi_pertama/feature/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {}, child: const Text("Login"));
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/SingUp");
                },
                child: const Text("SingUp")),
            ElevatedButton(
                onPressed: () {
                   Navigator.pushNamed(context, "/userList");
                }, child: const Text("Lihat Data User"))
          ],
        ),
      ),
    ));
  }
}
