import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:marvel_api_test/providers/providers.dart';
import 'package:marvel_api_test/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final charactersProvider = Provider.of<CharactersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Characters'),
        centerTitle: true,
        actions: const [ThemeButton()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _HomeHeader(),
            CharactersSwiper(characters: charactersProvider.characters),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatinActionButton(),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Image.asset(
          'assets/logo-marvel.png',
          width: 70,
        ),
        const SizedBox(height: 20),
        const Text('Choose your character', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
