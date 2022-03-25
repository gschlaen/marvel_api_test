import 'dart:convert';

class Character {
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  int id;
  String name;
  String description;
  String thumbnail;

  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        description: json["description"] != "" ? json["description"] : "Description not available",
        thumbnail: json["thumbnail"]["path"] + "." + json["thumbnail"]["extension"],
      );
}
