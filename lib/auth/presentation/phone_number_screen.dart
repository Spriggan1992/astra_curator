import 'package:astra_curator/auth/application/phone/phone_bloc.dart';
import 'package:astra_curator/auth/presentation/constants/constants.dart';
import 'package:astra_curator/auth/presentation/widgets/screen_content.dart';
import 'package:astra_curator/core/presentation/dialogs/snack_bar.dart';
import 'package:astra_curator/core/presentation/routes/app_router.gr.dart';
import 'package:astra_curator/core/presentation/theming/colors.dart';
import 'package:astra_curator/core/presentation/utils/astra_input_formatter.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/dialog_action_button.dart';
import 'package:astra_curator/core/presentation/widgets/dialogs/dialog_one_actions.dart';
import 'package:astra_curator/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Phone number entry screen.
class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhoneBloc>(
          create: (context) =>
              getIt<PhoneBloc>()..add(const PhoneEvent.initialized()),
        ),
      ],
      child: BlocListener<PhoneBloc, PhoneState>(
        listener: (context, listenState) {
          if (listenState.redirectToPasswordScreen) {
            context.router.push(
              PasswordScreenRoute(phoneNumber: listenState.phoneNumber),
            );
          }
          if (listenState.redirectConfirmCode) {
            showDialog(
              context: context,
              builder: (context) => DialogOneAction(
                content: Column(
                  children: const [
                    Text(
                      'Номер в базе\nне зарегистрирован',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Для регистрации обратитесь\nв службу поддержки по номеру',
                      style: TextStyle(
                        color: AstraColors.btnBlueColor,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '+ 7111 111 11 11',
                      style: TextStyle(
                        color: AstraColors.btnBlueColor,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                action: DialogActionButton(
                  title: "Спасибо",
                  onClick: context.router.pop,
                ),
              ),
            );
          }
          if (listenState.isNoConnection) {
            showSnackBar(context);
          }
        },
        child: ScreenContent(
          title: "Мой номер телефона",
          textFieldContent: BlocBuilder<PhoneBloc, PhoneState>(
            builder: (context, state) {
              return TextFormField(
                style: Theme.of(context).textTheme.displayMedium,
                initialValue: '+7',
                autofocus: true,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  maskFormatter,
                  AstraPhoneInputFormatter(),
                ],
                decoration:
                    const InputDecoration(hintText: "Введите номер телефона"),
                onChanged: (value) {
                  context.read<PhoneBloc>().add(
                        PhoneEvent.changedTextValue(value),
                      );
                },
                autovalidateMode: AutovalidateMode.disabled,
              );
            },
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
          button: BlocBuilder<PhoneBloc, PhoneState>(
            builder: (context, state) {
              return AstraGradientButton(
                title: 'Продолжить',
                isEnableButton: state.isEnableBtn,
                isLoading: state.isLoading,
                onClick: () {
                  context.read<PhoneBloc>().add(const PhoneEvent.pressedBtn());
                },
              );
            },
          ),
          notificationMessageContent: Text(
            "Вам придёт сообщение с кодом.\nНикому его не говорите.",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
