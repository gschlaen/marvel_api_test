import 'package:flutter/material.dart';

class CustomFloatinActionButton extends StatelessWidget {
  const CustomFloatinActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.star_border_outlined),
      onPressed: () => Navigator.pushNamed(context, 'favorites'),
    );
  }
}
