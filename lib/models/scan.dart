import 'dart:convert';

class Scan {
  Scan({
    required this.content,
    this.id = 0,
    this.type = 0
  }) {
    type = content.contains('http') ? 1 : 2;
  }

  int id;
  int type;
  String content;

  factory Scan.fromJson(String str) => Scan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Scan.fromMap(Map<String, dynamic> json) => Scan(
    id: json["id"],
    type: json["type"],
    content: json["content"]
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "content": content
  };
}
