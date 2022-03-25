import 'package:flutter/material.dart';
import 'package:marvel_api_test/widgets/theme_button.dart';
import 'package:provider/provider.dart';

import 'package:marvel_api_test/models/models.dart';
import 'package:marvel_api_test/providers/providers.dart';
import 'package:marvel_api_test/themes/app_theme.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favortesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        actions: const [ThemeButton()],
      ),
      body: favortesProvider.getFavorites().isEmpty
          ? const _NoFavoritesBody()
          : Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: ListView.separated(
                itemCount: favortesProvider.getFavorites().length,
                itemBuilder: (_, int index) => _CharacterListTile(character: favortesProvider.getFavorites()[index]),
                separatorBuilder: (_, __) => const Divider(thickness: 1, height: 0),
              ),
            ),
    );
  }
}

class _NoFavoritesBody extends StatelessWidget {
  const _NoFavoritesBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        Text('You have not added favorites yet.', style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w400)),
        SizedBox(
          height: 25.0,
        ),
        Text(
          '¡Start discovering your favorite characters!',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
        ),
      ]),
    );
  }
}

class _CharacterListTile extends StatelessWidget {
  final Character character;

  const _CharacterListTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favortesProvider = Provider.of<FavoritesProvider>(context);

    return Dismissible(
      key: Key(character.id.toString()),
      background: Container(color: AppTheme.primary),
      secondaryBackground: Container(color: AppTheme.primary),
      onDismissed: (direction) {
        favortesProvider.removeFavorite(character);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              '"${character.name}" has been removed from Favorites',
              style: const TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 1.5),
            image: DecorationImage(
              image: NetworkImage(character.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(character.name),
        subtitle: Text(character.description, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () => Navigator.pushNamed(context, 'details', arguments: character),
      ),
    );
  }
}
