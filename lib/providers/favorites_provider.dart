import 'package:flutter/material.dart';

import 'package:marvel_api_test/models/models.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Character> _favorites = [];

  List<Character> getFavorites() => _favorites;

  void addFavorite(Character character) {
    if (!_favorites.any((element) => element.id == character.id)) {
      _favorites.add(character);
      notifyListeners();
    }
  }

  void removeFavorite(Character character) {
    _favorites.removeWhere((element) => element.id == character.id);
    notifyListeners();
  }
}
