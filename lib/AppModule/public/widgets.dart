import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    required this.size,
  });

  final String text;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text,
          textAlign: TextAlign.center, style: TextStyle(fontSize: size,

          fontWeight: FontWeight.bold)),
    );
  }
}
