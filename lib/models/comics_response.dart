import 'dart:convert';

import 'package:marvel_api_test/models/models.dart';

class ComicsResponse {
  ComicsResponse({
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
  List<Comic> results;

  factory ComicsResponse.fromJson(String str) => ComicsResponse.fromMap(json.decode(str));

  factory ComicsResponse.fromMap(Map<String, dynamic> json) => ComicsResponse(
        offset: json["data"]["offset"],
        limit: json["data"]["limit"],
        total: json["data"]["total"],
        count: json["data"]["count"],
        results: List<Comic>.from(json["data"]["results"].map((x) => Comic.fromMap(x))),
      );
}
