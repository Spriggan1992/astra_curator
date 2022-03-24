import 'package:astra_curator/core/presentation/theming/gradients.dart';
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

  /// Whether the container shape is circular.
  final bool isCircular;

  /// Container background color.
  final Color background;

  const GradientBorderContainer({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.gradient = _defaultGradient,
    this.alignment = Alignment.center,
    this.isCircular = false,
    this.background = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular ? null : BorderRadius.circular(16),
        gradient: _defaultGradient,
      ),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircular ? null : BorderRadius.circular(16),
          color: background,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
