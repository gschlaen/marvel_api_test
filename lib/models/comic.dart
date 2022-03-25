import 'dart:convert';

class Comic {
  Comic({
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  int id;
  String title;
  String thumbnail;

  factory Comic.fromJson(String str) => Comic.fromMap(json.decode(str));

  factory Comic.fromMap(Map<String, dynamic> json) => Comic(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"]["path"] + "." + json["thumbnail"]["extension"],
      );
}
