import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:marvel_api_test/models/models.dart';

class CharactersProvider extends ChangeNotifier {
  final String _baseUrl = 'gateway.marvel.com';
  final String _ts = "1";
  final String _apiKey = 'cb0dfeba7296ce0f45990bf513cc27a5';
  final String _hash = "946fbbacc4cef01582cf801c1ae78feb";
  int _offset = 0;

  List<Character> characters = [];

  Map<int, List<Comic>> charactersComics = {};

  CharactersProvider() {
    getCharacters();
  }

  getCharacters() async {
    try {
      var url = Uri.https(_baseUrl, '/v1/public/characters', {
        'ts': _ts,
        'apikey': _apiKey,
        'hash': _hash,
        'offset': _offset.toString(),
      });

      final resp = await http.get(url);
      final charactersResponse = CharactersResponse.fromJson(resp.body);
      characters.addAll(charactersResponse.results);

      _offset += 20;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Comic>> getComicsByCharacter(int characterId) async {
    if (charactersComics.containsKey(characterId)) return charactersComics[characterId]!;
    try {
      var url = Uri.https(_baseUrl, '/v1/public/characters/$characterId/comics', {
        'ts': _ts,
        'apikey': _apiKey,
        'hash': _hash,
      });

      final resp = await http.get(url);
      final comicsResponse = ComicsResponse.fromJson(resp.body);
      charactersComics[characterId] = comicsResponse.results;
      return comicsResponse.results;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
