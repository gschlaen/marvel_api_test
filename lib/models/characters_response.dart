import 'dart:convert';

import 'package:marvel_api_test/models/models.dart';

class CharactersResponse {
  CharactersResponse({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  int offset;
  int limit;
  int total;
  int count;
  List<Character> results;

  factory CharactersResponse.fromJson(String str) => CharactersResponse.fromMap(json.decode(str));

  factory CharactersResponse.fromMap(Map<String, dynamic> json) => CharactersResponse(
        offset: json["data"]["offset"],
        limit: json["data"]["limit"],
        total: json["data"]["total"],
        count: json["data"]["count"],
        results: List<Character>.from(json["data"]["results"].map((x) => Character.fromMap(x))),
      );
}
