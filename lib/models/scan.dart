import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class Scan {
  Scan({required this.content, this.id}) {
    type = content.contains('http') ? 1 : 2;
  }

  int? id;
  int? type;
  String content;

  factory Scan.fromJson(String str) => Scan.fromMap(json.decode(str));

  factory Scan.fromMap(Map<String, dynamic> json) =>
      Scan(id: json["id"], content: json["content"]);

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {"id": id, "type": type, "content": content};
  
  /// 
  LatLng getLatLng() {
    List<String> latLng =
        content.substring(4).replaceAll(RegExp(r"\s+"), '').split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);
    return LatLng(lat, lng);
  }
}
