import 'package:flutter/material.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/navigation_provider.dart';

class ScansProvider extends ChangeNotifier {
  List<Scan> scans = [];
  DbProvier dbProvier = DbProvier();
  int _currentPageIndex = 0;

  ///When navigation provider updates, this is triggeted and updated the value isntance
  void update(NavigationProvider navigationProvider) {
    _currentPageIndex = navigationProvider.selectedIndexPage;
  }

  ///It generates a new row into database
  void newScan(String valor) async {
    final newScan = Scan(content: valor);
    // final newId = await dbProvier.insert(Tables.scan, newScan);
    // newScan.id = newId;
    print(_currentPageIndex);
  }

  void loadSccandByType(int idTipo){

  }
}
