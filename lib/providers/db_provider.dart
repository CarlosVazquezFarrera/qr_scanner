import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/helpers/creator.dart';
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
  Future<int> insert(String table, SqlModelBase newData) async {
    final db = await currentDataBase;
    final Map<String, dynamic> mapData = newData.toMap();
    int newRow;
    try {
      newRow = await db.insert(table, mapData);
    } catch (e) {
      newRow = -1;
    }
    return newRow;
  }

  ///Base on table paramether it retuns an element that match with de id paramether
  Future<T> getById<T>(String table, int id) async {
    final db = await currentDataBase;
    final List<Map<String, dynamic>> res =
        await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (res.isEmpty) return null as T;

    final Map<String, dynamic> mapRow = res.first;
    final dataRow = Creator.createInstance(table, mapRow);
    return dataRow;
  }

  ///base on table paramether it returns a list of specific elements
  Future<List<dynamic>> getAll(String table) async {
    final db = await currentDataBase;
    final List<Map<String, dynamic>> res = await db.query(table);
    if (res.isEmpty) return null as List;

    final listData =
        res.map((data) => Creator.createInstance(table, data)).toList();
    return listData;
  }

  Future<List<dynamic>> getAllByWhereClause(
      String table, String where, List<dynamic> whereArgs) async {
    if (where.isEmpty || whereArgs.isEmpty) {
      throw Exception(['No paramethers provides']);
    }

    final db = await currentDataBase;
    final List<Map<String, dynamic>> res =
        await db.query(table, where: where, whereArgs: whereArgs);
    if (res.isEmpty) return null as List;

    final listData =
        res.map((data) => Creator.createInstance(table, data)).toList();
    return listData;
  }
}
