import 'package:astra_curator/core/presentation/constants/app_texts.dart';
import 'package:astra_curator/core/presentation/extensions/number_string.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/astra_borderred_button.dart';
import 'package:flutter/material.dart';

/// Withdraw dialog to display withdraw sum and send query to withdraw money.
class WithdrawDialog extends StatefulWidget {
  const WithdrawDialog({
    Key? key,
    required this.controller,
    this.onSendQuery,
  }) : super(key: key);

  /// Text controller contains initial value which have gotten from server.
  final TextEditingController controller;

  /// The event handler. 1- validate entered sum. 2-send query to server.
  final VoidCallback? onSendQuery;

  @override
  State<WithdrawDialog> createState() => _WithdrawDialogState();
}

class _WithdrawDialogState extends State<WithdrawDialog> {
  String? errorText = '';

  String initialValue = '';
  @override
  void initState() {
    super.initState();
    initialValue = widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      padding: MediaQuery.of(context).padding,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        elevation: 2,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
            Text(
              AppTexts.specifyTheAmountToWithdraw,
              style: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                controller: widget.controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: _textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
                onFieldSubmitted: (value) {},
                decoration: InputDecoration(
                  errorText: errorText,
                  errorStyle: _textTheme.bodySmall!.copyWith(
                    color: AstraColors.errorColor,
                  ),
                  suffixText: '₽',
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              child: AstraBorderedButton(
                title: AppTexts.sendRequest,
                isEnableButton: widget.controller.text.isNotEmpty,
                onTap: () {
                  validate();
                  if (errorText!.isEmpty) {
                    return widget.onSendQuery!();
                  }
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  /// Compare initial value with entered value.
  /// If initial value less than entered value then shows error text.
  void validate() {
    final _enteredNumber = int.tryParse(
          initialValue.formatStringToNumberString(),
        ) ??
        0;
    final _sum = int.tryParse(
          widget.controller.text.formatStringToNumberString(),
        ) ??
        0;

    if (_enteredNumber < _sum) {
      errorText = AppTexts.theRequestAmountIsMoreThanAllowed;
      setState(() {});
    } else {
      errorText = '';
      setState(() {});
    }
  }
}
