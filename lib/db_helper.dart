import 'package:pasindu_bhanuka/location.dart';
import 'package:pasindu_bhanuka/permission.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'user_data');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_display_name TEXT,
      user_email TEXT,
      user_company_code TEXT,
      user_employee_code TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE permissions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      permission_name TEXT,
      permission_status TEXT,
      user_id INTEGER,
      FOREIGN KEY (user_id) REFERENCES users (id)
    )
  ''');

    await db.execute('''
    CREATE TABLE locations (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      location_code TEXT,
      user_id INTEGER,
      FOREIGN KEY (user_id) REFERENCES users (id)
    )
  ''');
  }




  Future<int> insertUser(User user) async {
    Database db = await instance.db;
    return await db.insert('users', user.toMap());
  }

  Future<int> insertPermission(Permission permission) async {
    Database db = await instance.db;
    return await db.insert('permissions', permission.toMap());
  }

  Future<int> insertLocation(Location location) async {
    Database db = await instance.db;
    return await db.insert('locations', location.toMap());
  }


}
