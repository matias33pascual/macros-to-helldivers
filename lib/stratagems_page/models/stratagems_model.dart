import 'dart:convert';

class StratagemModel {
  String id;
  String name;
  String icon;
  List<String> keysCode;

  StratagemModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.keysCode,
  });

  factory StratagemModel.fromJson(String str) =>
      StratagemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StratagemModel.fromMap(Map<String, dynamic> json) => StratagemModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        keysCode: List<String>.from(json["keysCode"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "icon": icon,
        "keysCode": List<dynamic>.from(keysCode.map((x) => x)),
      };
}
