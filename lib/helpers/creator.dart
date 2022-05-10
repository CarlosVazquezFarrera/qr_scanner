import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/tables/tables.dart';

class Creator {
  ///Base on table
  static T createInstance<T>(String table, Map<String, dynamic> mapData) {
    switch (table) {
      case Tables.scan:
        return Scan.fromMap(mapData) as T;
      default:
        return Object() as T;
    }
  }
}
