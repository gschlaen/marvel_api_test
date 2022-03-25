import 'package:flutter/material.dart';

import 'package:marvel_api_test/models/models.dart';
import 'package:marvel_api_test/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Character character = ModalRoute.of(context)!.settings.arguments as Character;

    return Scaffold(
      appBar: AppBar(
        actions: [
          FavoriteButton(character: character),
        ],
        title: Text(character.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image(image: NetworkImage(character.thumbnail)),
          _Description(character: character),
          ComicsSlider(characterId: character.id),
        ]),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        character.description,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
