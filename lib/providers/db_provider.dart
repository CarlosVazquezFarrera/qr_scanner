import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbProvier {
  DbProvier._();
  
  factory DbProvier() {
    return _dbProvier;
  }
  static final DbProvier _dbProvier = DbProvier._();

  Database? _database;

  ///it provides current database
  Future<Database> get currentDataBase async {
    if (_database != null) return _database!;

    _database = await initDb();
    return _database!;
  }

  ///it creates the Db if it not created yet
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'ScansDB.db');
    print(path);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, _) async {
      await db.execute('''
        CREATE TABLE Scan(
          Id INTEGER PRIMARY KEY,
          tipo INTEGER,
          content TEXT)''');
    });
  }
}
