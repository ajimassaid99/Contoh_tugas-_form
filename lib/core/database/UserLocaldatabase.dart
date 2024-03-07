import 'package:aplikasi_pertama/model/userModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserLocalDatasource {
  UserLocalDatasource._init();

  static final UserLocalDatasource instance = UserLocalDatasource._init();

  late final String tableUsers = 'users';
  static Database? _database;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUsers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT
      )
    ''');
  }

  // Signup user
  Future<int> signupUser(UserModel user) async {
    final db = await instance.database;
    return await db.insert(tableUsers, user.toMap());
  }

  // Login user
  Future<UserModel?> loginUser(String username, String password) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> users = await db.query(tableUsers,
        where: 'username = ? AND password = ?',
        whereArgs: [username, password]);

    if (users.isNotEmpty) {
      return UserModel.fromMap(users.first);
    } else {
      return null;
    }
  }

  // // Logout user (dummy implementation)
  // Future<void> logoutUser() async {
  //   // No actual action needed for logout in local database
  //   // You may handle any token or session clearing here if needed
  // }

  // Delete account (dummy implementation)
  Future<void> deleteAccount(int userId) async {
    final db = await instance.database;
    await db.delete(tableUsers, where: 'id = ?', whereArgs: [userId]);
    // Additional actions such as clearing user data may be done here
  }

  // Tambahkan metode berikut ke dalam kelas UserLocalDatasource

  Future<List<UserModel>> getAllUsers() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> users = await db.query(tableUsers);

    return users.map((user) => UserModel.fromMap(user)).toList();
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user_database.db');
    return _database!;
  }
}
