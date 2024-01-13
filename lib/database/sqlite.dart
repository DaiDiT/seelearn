import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:seelearn/models/user.dart';

class DatabaseHelper {
  final databaseName = "seelearn.db";

  String users =
      "create table users (user_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, school TEXT, email TEXT, password TEXT, role TEXT)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
    });
  }

  Future<bool> login(User user) async {
    final Database db = await initDB();

    var result = await db.rawQuery(
        "select * from users where email = '${user.email}' AND password = '${user.password}'");

    return (result.isEmpty) ? false : true;
  }

  Future<int> register(User user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }
}
