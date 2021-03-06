import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// Pin code entry text field.
class PinCodeField extends StatelessWidget {
  /// Obscure input text to display.
  final bool obscureText;

  /// Returns the typed text when all pins are set.
  final Function(String) onChanged;

  /// Returns the typed text when all pins are set.
  final Function(String)? onCompleted;

  /// The flag, responsible for display error.
  final bool isError;
  const PinCodeField({
    Key? key,
    this.obscureText = false,
    required this.onChanged,
    this.onCompleted,
    required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      onChanged: onChanged,
      onCompleted: onCompleted,
      appContext: context,
      autoFocus: true,
      obscureText: obscureText,
      keyboardType: TextInputType.number,
      animationType: AnimationType.none,
      obscuringCharacter: "*",
      autoDismissKeyboard: false,
      pinTheme: PinTheme(
        fieldWidth: 60,
        activeColor: isError ? AstraColors.errorColor : AstraColors.black04,
        inactiveFillColor: AstraColors.black04,
        selectedColor: isError ? AstraColors.errorColor : AstraColors.black04,
        inactiveColor: AstraColors.black04,
      ),
    );
  }
}
