import 'package:astra_curator/presentation/core/theming/gradients.dart';
import 'package:flutter/material.dart';

const _defaultGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: Gradients.goldenGradient,
);

/// Represent container with gradient border.
class GradientBorderContainer extends StatelessWidget {
  ///A gradient to use when filling the box.
  final Gradient gradient;

  /// The height of container.
  final double? height;

  /// The width of container.
  final double? width;

  /// The widget that will be passed.
  final Widget child;

  /// A point within a rectangle.
  final Alignment alignment;

  const GradientBorderContainer({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.gradient = _defaultGradient,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: _defaultGradient,
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
