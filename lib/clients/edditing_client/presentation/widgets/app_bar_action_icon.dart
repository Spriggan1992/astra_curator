import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/icons/svg_icon.dart';
import 'package:flutter/material.dart';

/// Represent interactive app bar action icon.
class AppBarActionIcon extends StatelessWidget {
  /// Submit click event handler.
  final VoidCallback onSubmit;

  /// Toggle icon click event handler.
  final VoidCallback onToggled;

  /// Whether to show done icon or editing icon.
  final bool canSubmit;

  /// Whether form is valid.
  final bool formIsValid;

  const AppBarActionIcon({
    Key? key,
    required this.onSubmit,
    required this.formIsValid,
    required this.canSubmit,
    required this.onToggled,
  }) : super(key: key);

  Color _setDoneIconColor() =>
      formIsValid ? AstraColors.black : AstraColors.black02;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          _buildDoneIcon(),
        ],
      ),
    );
  }

  Widget _buildDoneIcon() {
    if (canSubmit) {
      return GestureDetector(
        onTap: () => formIsValid ? onSubmit() : null,
        child: Icon(Icons.done, color: _setDoneIconColor()),
      );
    } else {
      return GestureDetector(
        onTap: () {
          onToggled();
        },
        child: const SvgIcon(asset: 'assets/icons/pencil.svg'),
      );
    }
  }
}
