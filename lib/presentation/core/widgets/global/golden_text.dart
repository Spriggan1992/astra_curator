import 'package:astra_curator/presentation/core/theming/gradients.dart';
import 'package:flutter/material.dart';

/// Golden gradient text widget. 
class GoldenText extends StatelessWidget {
  const GoldenText({
    Key? key,
    required this.text,
    required this.style,
  }) : super(key: key);
  
  /// A text 
  final String text;
  /// TextStyle which will be overrided.
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: Gradients.goldenGradient,
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
          ).createShader(
            const Rect.fromLTWH(0.0, 0.0, 0.0, 10),
          ),
      ),
    );
  }
}
