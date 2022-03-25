import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:provider/provider.dart';

import 'package:marvel_api_test/models/models.dart';
import 'package:marvel_api_test/providers/characters_provider.dart';
import 'package:marvel_api_test/widgets/widgets.dart';

class CharactersSwiper extends StatelessWidget {
  const CharactersSwiper({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (characters.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.65,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.65,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Swiper(
          onIndexChanged: (value) {
            if (value == characters.length - 1) {
              Provider.of<CharactersProvider>(context, listen: false).getCharacters();
            }
          },
          physics: const BouncingScrollPhysics(),
          itemCount: characters.length,
          loop: false,
          viewportFraction: 0.80,
          scale: 0.9,
          onTap: (index) => Navigator.pushNamed(context, 'details', arguments: characters[index]),
          itemBuilder: (context, index) {
            return Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/no-image.jpg'),
                          image: NetworkImage(characters[index].thumbnail),
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(characters[index].name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                  ],
                ),
                FavoriteButton(character: characters[index])
              ],
            );
          },
        ),
      ),
    );
  }
}
