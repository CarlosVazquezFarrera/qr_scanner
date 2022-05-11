import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/tables/tables.dart';

class Creator {
  ///Base on table
  static dynamic createInstance(String table, Map<String, dynamic> mapData) {
    switch (table) {
      case Tables.scan:
        return Scan.fromMap(mapData);
      default:
        return null;
    }
  }
}
