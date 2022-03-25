import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:marvel_api_test/models/models.dart';
import 'package:marvel_api_test/providers/providers.dart';

class FavoriteButton extends StatelessWidget {
  final Character character;

  const FavoriteButton({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    if (!favoritesProvider.getFavorites().any((element) => element.id == character.id)) {
      return IconButton(
        icon: const Icon(Icons.star_border_outlined),
        onPressed: () => favoritesProvider.addFavorite(character),
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.star),
        onPressed: () => favoritesProvider.removeFavorite(character),
      );
    }
  }
}
