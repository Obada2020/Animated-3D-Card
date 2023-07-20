import 'package:animated_3d_card/animated_3d_card.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF191C29),
        body: Center(
          child: Wrap(
            runSpacing: 45,
            children: [
              CustomAnimated3DCard(
                titleImage:
                    'https://ggayane.github.io/css-experiments/cards/dark_rider-title.png',
                characterImage:
                    'https://ggayane.github.io/css-experiments/cards/dark_rider-character.webp',
                coverImage:
                    'https://ggayane.github.io/css-experiments/cards/dark_rider-cover.jpg',
                targetUrl: 'https://www.mythrillfiction.com/the-dark-rider',
              ),
              CustomAnimated3DCard(
                titleImage:
                    'https://ggayane.github.io/css-experiments/cards/force_mage-title.png',
                characterImage:
                    'https://ggayane.github.io/css-experiments/cards/force_mage-character.webp',
                coverImage:
                    'https://ggayane.github.io/css-experiments/cards/force_mage-cover.jpg',
                targetUrl: 'https://www.mythrillfiction.com/force-mage',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
