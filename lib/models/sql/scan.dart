import 'dart:convert';
import 'sql_model_base.dart';

class Scan extends SqlModelBase {
  Scan({required this.content, this.id, type}) {
    this.type = content.contains('http') ? 1 : 2;
  }

  int? id;
  int? type;
  String content;

  factory Scan.fromJson(String str) => Scan.fromMap(json.decode(str));

  factory Scan.fromMap(Map<String, dynamic> json) =>
      Scan(id: json["id"], type: json["type"], content: json["content"]);

  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {"id": id, "type": type, "content": content};
}
