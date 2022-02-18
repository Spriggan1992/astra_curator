import 'dart:developer';

import 'package:astra_curator/presentation/core/theming/colors.dart';
import 'package:astra_curator/presentation/core/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/presentation/core/widgets/date_picker/platform_date_picker.dart';
import 'package:astra_curator/presentation/core/widgets/popup/core/text_field_popup_menu_item.dart';
import 'package:astra_curator/presentation/core/widgets/popup/text_field_pop_up_menu.dart';
import 'package:astra_curator/presentation/core/widgets/text_fields/core/validators.dart';
import 'package:astra_curator/presentation/core/widgets/text_fields/lost_focus_text_field.dart';
import 'package:flutter/material.dart';

/// Represent adding client screen.
class AddingClientScreen extends StatelessWidget {
  const AddingClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('check', name: 'check');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const MainAppBar(
          title: 'Добавление клиента',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          style: Theme.of(context).textTheme.titleSmall,
                          decoration: const InputDecoration(
                            isDense: true,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      VerticalDivider(
                          endIndent: 6,
                          indent: 6,
                          color: Theme.of(context)
                              .dividerTheme
                              .copyWith(color: AstraColors.black)
                              .color),
                      Expanded(
                        child: TextFormField(
                          style: Theme.of(context).textTheme.titleSmall,
                          decoration: const InputDecoration(
                            isDense: true,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Text('Отправить повторно'),
                LostFocusTextField(
                  hint: 'Имя',
                  onSubmit: (value) => log(value, name: 'value1'),
                  validator: [
                    Validator.requiredField,
                  ],
                ),
                LostFocusTextField(
                  hint: 'Фамилия',
                  onSubmit: (value) => log(value, name: 'value2'),
                  validator: [
                    Validator.requiredField,
                  ],
                ),
                PlatformDatePicker(
                  hint: 'Дата рождения',
                  onSubmitDate: ((dateTime) {
                    log(dateTime.toString(), name: 'value3');
                  }),
                ),
                const SizedBox(height: 50),
                LostFocusTextField(
                  hint: 'Город проживания',
                  onSubmit: (value) => log(value, name: 'value2'),
                  validator: [
                    Validator.requiredField,
                  ],
                ),
                LostFocusTextField(
                  hint: 'Страна',
                  onSubmit: (value) => log(value, name: 'value2'),
                  validator: [
                    Validator.requiredField,
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: TextFieldPopUpMenu(
                        isFullSize: true,
                        hint: 'Пол',
                        items: [
                          TextFieldPopUpMenuItem(title: 'Мужской', value: 0),
                          TextFieldPopUpMenuItem(title: 'Женский', value: 1),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: LostFocusTextField(
                        hint: 'Страна',
                        onSubmit: (value) => log(value, name: 'value2'),
                        validator: [
                          Validator.requiredField,
                        ],
                      ),
                    ),
                  ],
                ),
                TextFieldPopUpMenu(
                  hint: 'Семейное положение',
                  items: [
                    TextFieldPopUpMenuItem(title: 'Холост', value: 0),
                    TextFieldPopUpMenuItem(title: 'Пазведён', value: 1),
                  ],
                ),
                TextFieldPopUpMenu(
                  hint: 'Наличие детей',
                  items: [
                    TextFieldPopUpMenuItem(title: 'Детей нет', value: 0),
                    TextFieldPopUpMenuItem(title: 'Дети есть', value: 1),
                  ],
                ),
                const SizedBox(height: 50),
                LostFocusTextField(
                  hint: 'Краткая информация',
                  onSubmit: (value) => log(value, name: 'value2'),
                  validator: [
                    Validator.requiredField,
                    Validator.requiredMin80Symbols,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
