import 'dart:convert';

enum StratagemTypesEnum {
  mission,
  defenses,
  orbital,
  eagle,
  weapons,
  backpacks
}

class StratagemModel {
  String id;
  String name;
  StratagemTypesEnum type;
  String icon;
  List<String> keysCode;
  double cooldown;

  StratagemModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.keysCode,
    required this.type,
    required this.cooldown,
  });

  factory StratagemModel.fromJson(String str) =>
      StratagemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StratagemModel.fromMap(Map<String, dynamic> json) => StratagemModel(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        type: getTypeFromString(json["type"]),
        keysCode: List<String>.from(json["keysCode"].map((x) => x)),
        cooldown: double.parse(json["cooldown"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "icon": icon,
        "type": type,
        "keysCode": List<dynamic>.from(keysCode.map((x) => x)),
      };

  static StratagemTypesEnum getTypeFromString(String stringValue) {
    switch (stringValue) {
      case "backpacks":
        return StratagemTypesEnum.backpacks;

      case "defenses":
        return StratagemTypesEnum.defenses;

      case "eagle":
        return StratagemTypesEnum.eagle;

      case "orbital":
        return StratagemTypesEnum.orbital;

      case "weapons":
        return StratagemTypesEnum.weapons;

      case "mission":
        return StratagemTypesEnum.mission;

      default:
        throw Exception(
            "Error en StratagemsModel.getTypeFromString: no existe el tipo de StratagemTypesEnum seleccionado.");
    }
  }
}
