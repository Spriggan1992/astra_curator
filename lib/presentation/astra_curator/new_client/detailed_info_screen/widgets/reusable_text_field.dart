import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';

/// Represent reusable text field.
///
class ReusableTextField extends StatefulWidget {
  /// Text that suggests what sort of input the field accepts.
  final String hint;

  /// Initial value of text field to
  final String? initialTextValue;

  /// Change [value] event handler.
  final Function(String value)? onChanged;

  const ReusableTextField({
    Key? key,
    required this.hint,
    this.initialTextValue,
    this.onChanged,
  }) : super(key: key);

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialTextValue ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AstraColors.black04),
      ),
      onChanged: widget.onChanged,
    );
  }
}
