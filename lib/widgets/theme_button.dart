import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:marvel_api_test/providers/theme_provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    if (themeProvider.isLightMode) {
      return IconButton(
        icon: const Icon(Icons.nightlight_outlined),
        onPressed: () => themeProvider.setDarkMode(),
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.wb_sunny_outlined),
        onPressed: () => themeProvider.setLightMode(),
      );
    }
  }
}
