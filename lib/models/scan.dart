import 'dart:convert';

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
}
