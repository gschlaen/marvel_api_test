import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:marvel_api_test/models/models.dart';
import 'package:marvel_api_test/providers/providers.dart';

class ComicsSlider extends StatelessWidget {
  final int characterId;

  const ComicsSlider({Key? key, required this.characterId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final charactersPovider = Provider.of<CharactersProvider>(context, listen: false);

    return FutureBuilder(
      future: charactersPovider.getComicsByCharacter(characterId),
      builder: (_, AsyncSnapshot<List<Comic>> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            height: 250,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final List<Comic> comics = snapshot.data!;

        if (comics.isEmpty) {
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 250,
              child: const Center(
                child: Text(
                  'Comics not available',
                  style: TextStyle(fontSize: 18),
                ),
              ));
        }

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 380,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: comics.length,
            itemBuilder: (_, int index) => _ComicCard(comic: comics[index]),
          ),
        );
      },
    );
  }
}

class _ComicCard extends StatelessWidget {
  final Comic comic;

  const _ComicCard({
    Key? key,
    required this.comic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(comic.thumbnail),
              height: 300,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            comic.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
