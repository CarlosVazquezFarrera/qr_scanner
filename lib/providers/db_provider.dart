import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/models/sql/sql_model_base.dart';
import 'package:qr_scanner/tables/tables.dart';

import 'package:sqflite/sqflite.dart';

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
    final path = join(directory.path, 'ScansDataBase.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, _) async {
      await db.execute('''
          CREATE TABLE ${Tables.scan} (
          id INTEGER PRIMARY KEY,
          type INTEGER,
          content TEXT)''');
    });
  }

  ///Base on witch table parameter is pass, db provider insert data into an specific table
  Future<int> insert<T>(String table, T newData) async {
    final db = await currentDataBase;
    final Map<String, dynamic> mapData = (newData as SqlModelBase).toMap();
    int newRow;
    try {
      newRow = await db.insert(table, mapData);
    } catch (e) {
      newRow = -1;
    }
    print(newRow);
    return newRow;
  }
}
