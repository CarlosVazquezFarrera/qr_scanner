import 'package:flutter/material.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/tables/tables.dart';

class ScansProvider extends ChangeNotifier {
  ScansProvider() {
    loadSccandByType(1);
  }
  List<Scan> scans = [];
  DbProvier dbProvier = DbProvier();
  int _currentPageIndex = 0;

  ///When navigation provider updates, this is triggeted and updated the value isntance
  void update(int currentPageSelected) {
    _currentPageIndex = currentPageSelected;
  }

  ///It generates a new row into database
  void newScan(String valor) async {
    final newScan = Scan(content: valor);
    final newId = await dbProvier.insert(Tables.scan, newScan);
    newScan.id = newId;
    final pageOpened = _currentPageIndex + 1;
    if (pageOpened == newScan.type) {
      scans.add(newScan);
      
      notifyListeners();
    }
  }

  ///Gets from data base all rows with type attribute 1 or 2
  void loadSccandByType(int type) async {
    final scandFroomData =
        await dbProvier.getAllByWhereClause(Tables.scan, 'type = ?', [type]);
    scans = [...scandFroomData];
    notifyListeners();
  }
}
