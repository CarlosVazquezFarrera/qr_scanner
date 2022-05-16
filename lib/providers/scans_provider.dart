import 'package:flutter/material.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/tables/tables.dart';

class ScansProvider extends ChangeNotifier {
  ScansProvider() {
    loadSccandByType(1);
  }
  List<Scan> scans = [];
  DbProvider dbProvier = DbProvider();
  int _currentPageIndex = 0;

  ///When navigation provider updates, this is triggeted and updated the value isntance
  void update(int currentPageSelected) {
    _currentPageIndex = currentPageSelected + 1;
  }

  ///It generates a new row into database
  void newScan(String valor) async {
    final newScan = Scan(content: valor);
    final newId = await dbProvier.insert(Tables.scan, newScan.toMap());
    newScan.id = newId;
    if (_currentPageIndex == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  ///Gets from data base all rows with type attribute 1 or 2
  void loadSccandByType(int type) async {
    final scanMapData =
        await dbProvier.getAllByWhereClause(Tables.scan, 'type = ?', [type]);
    final scansData = scanMapData.map((s) => Scan.fromMap(s)).toList();
    scans = [...scansData];
    notifyListeners();
  }

  ///It Drops an elemento from datababase
  void deleteScan(int id) async {
    final delete = await dbProvier.deleteById(Tables.scan, id);
    if (delete < 0) return;

    final index = scans.indexWhere((s) => s.id == id);
    if (index < 0) return;

    final scan = scans[index];
    if (_currentPageIndex == scan.type) {
      scans.removeAt(index);
      notifyListeners();
    }
  }
}
