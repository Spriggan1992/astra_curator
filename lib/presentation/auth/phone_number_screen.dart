import 'package:astra_curator/presentation/auth/widgets/screen_content.dart';
import 'package:astra_curator/presentation/core/buttons/astra_elevated_button.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/global/shader_mask.dart';
import 'package:flutter/material.dart';

/// Phone number entry screen.
class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenContent(
      title: "Мой номер телефона",
      textFieldContent: TextFormField(
        style: Theme.of(context).textTheme.displayMedium,
        autofocus: true,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(hintText: "Введите номер телефона"),
        onChanged: (value) {},
        autovalidateMode: AutovalidateMode.disabled,
      ),
      termContent: const Text(
        "Нажимая кнопку “продолжить” я соглашаюсь с",
      ),
      termsTextButton: InkWell(
        onTap: () {},
        child: Text(
          'пользовательским соглашением.',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AstraColors.textLinkColor,
                decoration: TextDecoration.underline,
              ),
        ),
      ),
      button: MaskShader(
        child: AstraElevatedButton(
          onClick: () {},
          title: 'Продолжить',
          titleColor: AstraColors.white,
        ),
      ),
      notificationMessageContent: const Text(
        "Вам придёт сообщение с кодом.\nНикому его не говорите.",
      ),
    );
  }
}
