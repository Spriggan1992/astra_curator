import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/text_fields/core/submitting_text_status.dart';
import 'package:astra_curator/presentation/core/widgets/text_fields/core/validators.dart';
import 'package:flutter/material.dart';

/// Represent custom text field that submit data on lost focus.
class LostFocusTextField extends StatefulWidget {
  /// Input string value validators.
  ///
  /// If null, will be used [DefaultValidator].
  final List<Validator>? validator;

  /// Submit [value] event handler.
  final Function(String value)? onSubmit;

  /// Initial value of text field to
  final String initialTextValue;

  /// Text that suggests what sort of input the field accepts.
  final String hint;

  /// Whether the text can be changed.
  final bool readOnly;

  /// Text field click event handler.
  ///
  /// Disabled if [readOnly] is false.
  final VoidCallback? onTap;

  /// The flag responsible for showing or not the icon responsible for status submitting text input value.
  ///
  /// By default [true].
  final bool isShowSuffixIcon;

  const LostFocusTextField({
    Key? key,
    required this.hint,
    this.validator,
    this.onSubmit,
    this.onTap,
    this.initialTextValue = '',
    this.isShowSuffixIcon = true,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<LostFocusTextField> createState() => _LostFocusTextFieldState();
}

class _LostFocusTextFieldState extends State<LostFocusTextField> {
  String _errorMessage = '';
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  var _submittingStatus = SubmittingTextStatus.initial;
  List<Validator> _validators = [];

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialTextValue;
    _validators = widget.validator ?? [Validator.defaultValidator];
    focusListener();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void focusListener() {
    _focusNode.addListener(() {
      setSubmittingStatus();
      if (_submittingStatus == SubmittingTextStatus.success) {
        widget.onSubmit!(_controller.text);
      }
    });
  }

  bool validateInputValue() {
    bool isValid = true;
    for (final validator in _validators) {
      if (validator.validateInputValue(_controller.text)) {
        _errorMessage = validator.errorMessage ?? '';
        isValid = false;
        break;
      }
    }
    return isValid;
  }

  void setSubmittingStatus() {
    setState(() {
      if (_focusNode.hasFocus) {
        _submittingStatus = SubmittingTextStatus.initial;
      } else if (validateInputValue()) {
        _submittingStatus = SubmittingTextStatus.failure;
      } else {
        _submittingStatus = SubmittingTextStatus.success;
      }
    });
  }

  Widget showErrorIcon() {
    if (_submittingStatus == SubmittingTextStatus.failure &&
        widget.isShowSuffixIcon) {
      return Icon(
        Icons.close,
        color: Theme.of(context).errorColor,
      );
    } else if (_submittingStatus == SubmittingTextStatus.success &&
        widget.isShowSuffixIcon) {
      return const Icon(
        Icons.done,
        color: Colors.green,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.readOnly,
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AstraColors.black04),
        suffixIcon: showErrorIcon(),
        errorStyle: TextStyle(height: _errorMessage.isNotEmpty ? null : 0),
        errorText: _submittingStatus == SubmittingTextStatus.failure
            ? _errorMessage
            : null,
      ),
      onTap: widget.readOnly ? widget.onTap : null,
    );
  }
}
