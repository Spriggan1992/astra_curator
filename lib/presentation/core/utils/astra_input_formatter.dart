import 'package:flutter/services.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Astra phone input formatter. Bans deleting value +7 at the begining.
///
/// Must work with [MaskTextInputFormatter] with format '+7 (###) ### #####'.
class AstraPhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String result = newValue.text;

    if (result.isEmpty) {
      result = '+7';
    }

    return TextEditingValue(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}
