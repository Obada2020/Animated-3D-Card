library animated_3d_card;

import 'package:flutter/material.dart';

class CustomAnimated3DCard extends StatefulWidget {
  final dynamic titleImage;
  final String characterImage;
  final String coverImage;
  final String targetUrl;
  final Function(bool isHovered)? onHover;
  final double? width;
  final double? height;
  final double? widthCharacter;
  final double? heightCharacter;
  final double? titleBottomPadding;
  final bool? withShadow;

  const CustomAnimated3DCard({
    super.key,
    required this.titleImage,
    required this.characterImage,
    required this.coverImage,
    required this.targetUrl,
    this.onHover,
    this.width,
    this.height,
    this.widthCharacter,
    this.heightCharacter,
    this.withShadow,
    this.titleBottomPadding,
  });

  @override
  CustomAnimated3DCardState createState() => CustomAnimated3DCardState();
}

class CustomAnimated3DCardState extends State<CustomAnimated3DCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      lowerBound: 0.0,
      upperBound: 0.7,
      value: 0.0,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onHover != null) {
          widget.onHover!(isHovered);
        }
        setState(() {
          isHovered = !isHovered;
          if (isHovered) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },
      onHover: (hovered) {
        if (widget.onHover != null) {
          widget.onHover!(isHovered);
        }
        setState(() {
          isHovered = hovered;
          if (isHovered) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      },
      child: Container(
        width: widget.width ?? 200,
        height: widget.height ?? 300,
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: isHovered && (widget.withShadow ?? false)
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.75),
                    blurRadius: 32,
                    offset: const Offset(2, 35),
                  ),
                ]
              : [],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0001)
                  ..rotateX(_controller.value * -1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.coverImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            if (widget.withShadow ?? false) ...[
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        const Color(0xFF0C0D13).withOpacity(0.5),
                        const Color(0xFF0C0D13),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: isHovered ? 120 : 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        const Color(0xFF0C0D13).withOpacity(0.5),
                        const Color(0xFF0C0D13),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: isHovered ? 70 : 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: widget.widthCharacter ?? 300,
                height: widget.heightCharacter ?? 300,
                child: AnimatedOpacity(
                  opacity: isHovered ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Image.network(
                    widget.characterImage,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: !isHovered ? 0 : widget.titleBottomPadding ?? 20,
              left: 0,
              right: 0,
              child: SizedBox(
                  width: 100,
                  height: 50,
                  child: widget.titleImage is String
                      ? Image.network(
                          widget.titleImage,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        )
                      : widget.titleImage),
            ),
          ],
        ),
      ),
    );
  }
}
