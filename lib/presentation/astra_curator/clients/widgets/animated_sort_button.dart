import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Sort animated button.
class AnimatedSortIcon extends StatefulWidget {
  const AnimatedSortIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedSortIcon> createState() => _AnimatedSortIconState();
}

class _AnimatedSortIconState extends State<AnimatedSortIcon> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InkWell(
        onTap: () {
          _isTapped = true;
          setState(() {});
        },
        child: const Icon(Icons.sort, color: AstraColors.black),
      ),
      secondChild: InkWell(
        onTap: () {
          setState(() {
            _isTapped = false;
          });
        },
        child: const Icon(Icons.arrow_back_sharp, color: AstraColors.black),
      ),
      crossFadeState:
          _isTapped ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 200),
    );
  }
}
