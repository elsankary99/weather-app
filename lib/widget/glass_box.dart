import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final double width;
  final double hight;
  final Widget child;
  const GlassBox(
      {super.key,
      required this.width,
      required this.hight,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: width,
        height: hight,
        child: Stack(children: [
          //! blur effect
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 2,
              sigmaX: 2,
            ),
            child: const SizedBox(),
          ),
          //! Gradient effect
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.07),
                ),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.07)
                    ])),
          ),
          //! child
          child
        ]),
      ),
    );
  }
}
