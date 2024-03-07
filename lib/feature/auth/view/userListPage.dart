import 'package:aplikasi_pertama/core/database/UserLocaldatabase.dart';
import 'package:aplikasi_pertama/model/userModel.dart';
import 'package:flutter/material.dart';

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
