import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:astra_curator/presentation/core/widgets/buttons/astra_borderred_button.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class WithdrawDialog extends StatelessWidget {
  const WithdrawDialog({Key? key, required this.controller, this.onSendQwery}) : super(key: key);
  final TextEditingController controller;
  final VoidCallback? onSendQwery; 
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
              'Укажите сумму для вывода',
              style: _textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: _textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
                onChanged: (value) {},
                decoration: const InputDecoration(
                  suffixText: '₽',
                  border: UnderlineInputBorder(
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
                title: 'Отправить запрос',
                isEnableButton: controller.text.isNotEmpty,
                onTap: onSendQwery,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}


