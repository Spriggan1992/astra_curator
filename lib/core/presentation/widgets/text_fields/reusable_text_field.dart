import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:flutter/material.dart';

/// Represent reusable text field.
class ReusableTextField extends StatefulWidget {
  /// Text that suggests what sort of input the field accepts.
  final String hint;

  /// Initial value of text field to
  final String? initialTextValue;

  /// Change [value] event handler.
  final Function(String value)? onChanged;

  /// If false the text field is "disabled".
  final bool isEnabled;
  const ReusableTextField({
    Key? key,
    required this.hint,
    this.initialTextValue,
    this.onChanged,
    this.isEnabled = true,
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
      enabled: widget.isEnabled,
      controller: _controller,
      decoration: InputDecoration(
        label: Text(
          widget.hint,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AstraColors.black04),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
