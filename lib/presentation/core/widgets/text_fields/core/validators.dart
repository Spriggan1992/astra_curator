/// Describes how to validate an input string value entered from the keyboard.
abstract class Validator {
  /// Validate the input text value.
  ///
  /// If the [value] satisfy validation rules
  /// returns true otherwise return false.
  bool validateInputValue(String value);

  /// The error message to display.
  String? errorMessage;

  /// The input string value cannot be empty.
  static final requiredField = RequiredFiled();

  /// The input string value always be valid.
  static final defaultValidator = DefaultValidator();

  /// The input string value cannot be less then 80 characters.
  static final requiredMin80Symbols = RequiredMin80Symbols();
}

/// Represent validation rules object that field is required.
class RequiredFiled implements Validator {
  @override
  String? errorMessage;

  @override
  bool validateInputValue(String value) {
    return value.isNotEmpty;
  }
}

/// Represent validation rules object that string should be at least 80 characters.
class RequiredMin80Symbols implements Validator {
  @override
  String? errorMessage = 'Минимум 80 символов';

  @override
  bool validateInputValue(String value) {
    return value.length <= 80;
  }
}

/// Represent default validation rules.
///
/// The input string value always be valid.
class DefaultValidator implements Validator {
  @override
  String? errorMessage;

  @override
  bool validateInputValue(String value) => true;
}
