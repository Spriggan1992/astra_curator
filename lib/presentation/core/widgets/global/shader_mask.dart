import 'package:astra_curator/presentation/core/theming/gradients.dart';
import 'package:flutter/material.dart';

/// A widget to give gradient effect for this thild
class MaskShader extends StatelessWidget {
  const MaskShader({Key? key, required this.child}) : super(key: key);

  /// Widget which takes gradient effect
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: Gradients.goldenGradient,
          end: Alignment.bottomRight,
          begin: Alignment.topLeft,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
