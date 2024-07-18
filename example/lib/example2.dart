import 'dart:ui';

import 'package:animated_3d_card/animated_3d_card.dart';
import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  bool isHoveredJett = false;
  bool isHoveredFenix = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF191C29),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                reverseDuration: const Duration(milliseconds: 800),
                child: Image.network(
                  isHoveredJett
                      ? "https://w0.peakpx.com/wallpaper/28/428/HD-wallpaper-jett-valorant-fps-game-jett-riot-riotbrasil-riotgames-valorant-valorantbrasil-wiwferr.jpg"
                      : isHoveredFenix
                          ? "https://wallpaperaccess.com/full/3909941.png"
                          : "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/d9227692-9ff9-4abd-98e1-4889a24cd232/df2wiqo-f5cf2cd3-3107-443c-b220-3c7c32e58919.png/v1/fill/w_1280,h_721/valorant_wallpaper_hd_neon_sign_by_eclipsewideedit_df2wiqo-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzIxIiwicGF0aCI6IlwvZlwvZDkyMjc2OTItOWZmOS00YWJkLTk4ZTEtNDg4OWEyNGNkMjMyXC9kZjJ3aXFvLWY1Y2YyY2QzLTMxMDctNDQzYy1iMjIwLTNjN2MzMmU1ODkxOS5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.zRI_Mal_md0fr8R6U5pa0rWXR1jn9im3_dg_z01PDes",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  key: ValueKey(isHoveredJett || isHoveredFenix),
                ),
              ),
            ),
            Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 2.0),
                duration: const Duration(milliseconds: 800),
                builder: (_, value, child) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: value, sigmaY: value, tileMode: TileMode.clamp),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 45,
                      spacing: 250,
                      children: [
                        CustomAnimated3DCard(
                          height: 400,
                          widthCharacter: 450,
                          heightCharacter: 500,
                          titleBottomPadding: 40,
                          titleImage: const Center(
                              child: Text(
                            "P H O E N I X",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                          characterImage:
                              'https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltf0200e1821b5b39f/5eb7cdc144bf8261a04d87f9/V_AGENTS_587x900_Phx.png',
                          coverImage:
                              'https://i.pinimg.com/474x/f2/63/0e/f2630e4a0e3e29b37973256f7c854715.jpg',
                          targetUrl:
                              'https://www.mythrillfiction.com/the-dark-rider',
                          onHover: (isHovering) {
                            setState(() {
                              isHoveredJett = false;
                              isHoveredFenix = !isHovering;
                            });
                          },
                        ),
                        CustomAnimated3DCard(
                          height: 400,
                          widthCharacter: 450,
                          heightCharacter: 500,
                          titleBottomPadding: 40,
                          titleImage: const Center(
                            child: Text(
                              "J E T T",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          characterImage:
                              'https://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/bltceaa6cf20d328bd5/5eb7cdc1b1f2e27c950d2aaa/V_AGENTS_587x900_Jett.png',
                          coverImage:
                              'https://www.valorantinfo.gg/wp-content/uploads/2021/10/valorant-mirrored-edge-player-card.jpg',
                          targetUrl:
                              'https://www.mythrillfiction.com/force-mage',
                          onHover: (isHovering) {
                            setState(() {
                              isHoveredFenix = false;
                              isHoveredJett = !isHovering;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
