import 'package:astra_curator/presentation/auth/widgets/screen_content.dart';
import 'package:astra_curator/presentation/core/routes/app_router.gr.dart';
import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/buttons/astra_gradient_button.dart';
import 'package:auto_route/auto_route.dart';
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
      termContent: Text(
        "Нажимая кнопку “продолжить” я соглашаюсь с",
        style: Theme.of(context).textTheme.bodySmall,
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
      button: AstraGradientButton(
       onTap: (){
         context.pushRoute(const HomeScreenRoute());
       },
        title: 'Продолжить',
        type: ButtonType.success,
      ),
      notificationMessageContent: Text(
        "Вам придёт сообщение с кодом.\nНикому его не говорите.",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
