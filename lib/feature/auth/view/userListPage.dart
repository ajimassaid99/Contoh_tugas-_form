import 'dart:io';

import 'package:aplikasi_pertama/core/database/UserLocaldatabase.dart';
import 'package:aplikasi_pertama/model/userModel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<UserModel>> _userListFuture;

  @override
  void initState() {
    super.initState();
    _userListFuture = UserLocalDatasource.instance.getAllUsers();

    openHive();
    print("INI DATA JALAN");
  }

  var data;
  void openHive() async {
    
    await Hive.openBox('my_box');
    var box = await Hive.box('my_box');
    box.put('user', [UserModel(username: "AJi", password: "massaid")]);
    List<UserModel> user = box.get('user');
    // UserModel userData = user[0];
    print("INI DATA ${user[0].username}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _userListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final userList = snapshot.data!;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                return ListTile(
                  title: Text(user.username),
                  subtitle: Text(user
                      .password), // Gunakan informasi yang sesuai untuk tampilan ListTile
                  trailing: ElevatedButton(
                      onPressed: () async {
                        await UserLocalDatasource.instance
                            .deleteAccount(user.id ?? 0);
                      },
                      child: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }
}
