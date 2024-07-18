import 'package:animated_3d_card/animated_3d_card.dart';
import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({super.key});

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF191C29),
        body: Center(
          child: Wrap(
            runSpacing: 45,
            spacing: 200,
            children: [
              CustomAnimated3DCard(
                onHover: (x) {
                  setState(() {
                    isHovered = x;
                  });
                },
                withShadow: true,
                titleImage:
                    'https://ggayane.github.io/css-experiments/cards/dark_rider-title.png',
                characterImage:
                    'https://ggayane.github.io/css-experiments/cards/dark_rider-character.webp',
                coverImage:
                    'https://ggayane.github.io/css-experiments/cards/dark_rider-cover.jpg',
                targetUrl: 'https://www.mythrillfiction.com/the-dark-rider',
              ),
              CustomAnimated3DCard(
                onHover: (x) {
                  setState(() {
                    isHovered = x;
                  });
                },
                withShadow: true,
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
