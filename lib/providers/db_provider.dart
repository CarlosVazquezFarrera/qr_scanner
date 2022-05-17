import 'dart:io';
import 'package:path/path.dart';

import 'package:qr_scanner/enum/tables.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  DbProvider._();

  factory DbProvider() {
    return _dbProvier;
  }
  static final DbProvider _dbProvier = DbProvider._();

  Database? _database;

  ///it provides current database
  Future<Database> get _currentDataBase async {
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
  Future<int> insert(String table, Map<String, dynamic> mapData) async {
    final db = await _currentDataBase;
    int newRow;
    try {
      newRow = await db.insert(table, mapData);
    } catch (e) {
      newRow = -1;
    }
    return newRow;
  }

  ///Base on table paramether it retuns an element that match with de id paramether
  Future<Map<String, dynamic>> getById(String table, int id) async {
    final db = await _currentDataBase;
    final List<Map<String, dynamic>> res =
        await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (res.isEmpty) {}
    return res.first;
  }

  ///base on table paramether it returns a list of specific elements
  Future<List<Map<String, dynamic>>> getAll(String table) async {
    final db = await _currentDataBase;
    final List<Map<String, dynamic>> res = await db.query(table);
    if (res.isEmpty) return [];
    return res;
  }

  ///It returns elements base on where clause
  Future<List<Map<String, dynamic>>> getAllByWhereClause(
      String table, String where, List<dynamic> whereArgs) async {
    if (where.isEmpty || whereArgs.isEmpty) {
      throw Exception(['No paramethers provides']);
    }
    final db = await _currentDataBase;
    final List<Map<String, dynamic>> res =
        await db.query(table, where: where, whereArgs: whereArgs);
    if (res.isEmpty) return [];

    return res;
  }

  ///it updates an specific element on an specific table base on id parameter and table parameter
  Future<int> updateById(
      String table, Map<String, dynamic> mapData, int id) async {
    final bd = await _currentDataBase;
    int update;
    try {
      update =
          await bd.update(table, mapData, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      update = -1;
    }
    return update;
  }

  ///Drop one element from and specific table
  Future<int> deleteById(String table, int id) async {
    final bd = await _currentDataBase;
    int update;
    try {
      update = await bd.delete(table, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      update = -1;
    }
    return update;
  }

  ///Removes all elemento from table
  Future<int> deleteAll(String table) async {
    final db = await _currentDataBase;
    int delete;
    try {
      delete = await db.delete(table);
    } catch (e) {
      delete = -1;
    }
    return delete;
  }
}
