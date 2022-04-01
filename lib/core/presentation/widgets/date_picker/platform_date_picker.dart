import 'dart:io';

import 'package:astra_curator/core/presentation/extensions/date_tim_to_string.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/dialog_action_button.dart';
import 'package:astra_curator/core/presentation/widgets/date_picker/android_date_picker.dart';
import 'package:astra_curator/core/presentation/widgets/date_picker/ios_date_picker.dart';
import 'package:astra_curator/core/presentation/widgets/date_picker/selection_date_status.dart';
import 'package:astra_curator/core/presentation/widgets/dialogs/dialog_one_actions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Represent date picker depend on platform.
class PlatformDatePicker extends StatefulWidget {
  /// The hint text for text field where wil be displayed selected date.
  final String hint;

  /// The flag responsible for  showing or not  the icon responsible for status submitting date.
  ///
  /// By default [true].
  final bool isShowSuffixIcon;

  /// Submit [dateTime] event handler.
  final void Function(DateTime dateTime) onSubmitDate;

  /// The initial picked date.
  ///
  /// By default is null.
  final DateTime? initialDate;

  /// Whether the text can be changed.
  final bool isDisabled;
  const PlatformDatePicker({
    Key? key,
    required this.onSubmitDate,
    required this.hint,
    this.initialDate,
    this.isShowSuffixIcon = true,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  State<PlatformDatePicker> createState() => _PlatformDatePickerState();
}

class _PlatformDatePickerState extends State<PlatformDatePicker> {
  final _controller = TextEditingController();
  SelectionDateStatus _selectionDateStatus = SelectionDateStatus.initial;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller.text =
          widget.initialDate?.dateTimeToStringDateTime(context) ?? '';
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Set status of selection date.
  void _setSelectionDateStatus() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _selectionDateStatus = SelectionDateStatus.success;
      }
      if (_controller.text.isEmpty) {
        _selectionDateStatus = SelectionDateStatus.failure;
      }
    });
  }

  // Show status icon.
  Widget _showStatusIcon() {
    if (widget.isDisabled) {
      return const SizedBox.shrink();
    } else {
      if (_selectionDateStatus == SelectionDateStatus.failure &&
          widget.isShowSuffixIcon) {
        return Icon(
          Icons.close,
          color: Theme.of(context).errorColor,
        );
      } else if (_selectionDateStatus == SelectionDateStatus.success &&
          widget.isShowSuffixIcon) {
        return const Icon(
          Icons.done,
          color: Colors.green,
        );
      } else {
        return const SizedBox.shrink();
      }
    }
  }

  // Show IOS date picker.
  Future<void> _showIOSDatePicker() async {
    return showDialog(
      context: context,
      builder: (context) {
        return DialogOneAction(
          content: SizedBox(
            height: MediaQuery.of(context).size.width * 0.35,
            width: double.infinity,
            child: IOSDatePicker(
              initialDate: widget.initialDate,
              onDateTimeChanged: (dateTime) {
                _controller.text =
                    dateTime.dateTimeToStringDateTime(context) ?? '';
                widget.onSubmitDate(dateTime);
              },
            ),
          ),
          action: DialogActionButton(
            title: 'ОК',
            onClick: () {
              FocusScope.of(context).unfocus();
              context.router.pop();
            },
          ),
        );
      },
    ).then((_) => _setSelectionDateStatus());
  }

  // Show android date picker.
  Future<DateTime?> _showAndroidDatePicker() async {
    return showDialog<DateTime>(
      context: context,
      builder: (context) {
        return AndroidDatePicker(
          initialDate: widget.initialDate,
        );
      },
    );
  }

  // Show date picker depend on platform.
  Future<void> _showPlatformDatePick() async {
    if (Platform.isIOS) {
      await _showIOSDatePicker();
    }
    if (Platform.isAndroid) {
      final pickedDate = await _showAndroidDatePicker();
      if (pickedDate != null) {
        _controller.text = pickedDate.dateTimeToStringDateTime(context) ?? '';
        widget.onSubmitDate(pickedDate);
      }
      _setSelectionDateStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisabled
          ? null
          : () async {
              await _showPlatformDatePick();
            },
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          suffixIcon: _showStatusIcon(),
          hintText: widget.hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AstraColors.black04),
        ),
        enabled: false,
        onTap: widget.isDisabled
            ? null
            : () async {
                await _showPlatformDatePick();
              },
      ),
    );
  }
}
