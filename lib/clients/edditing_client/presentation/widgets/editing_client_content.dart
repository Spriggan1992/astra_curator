import 'package:astra_curator/clients/edditing_client/application/editing_client_actor/editing_client_actor_bloc.dart';
import 'package:astra_curator/clients/edditing_client/presentation/constants/editing_client_texts.dart';
import 'package:astra_curator/clients/edditing_client/presentation/widgets/app_bar_action_icon.dart';
import 'package:astra_curator/core/domain/models/child_status_model.dart';
import 'package:astra_curator/core/domain/models/city_model.dart';
import 'package:astra_curator/core/domain/models/country_model.dart';
import 'package:astra_curator/core/domain/models/gender_model.dart';
import 'package:astra_curator/core/domain/models/martial_status_model.dart';
import 'package:astra_curator/core/domain/models/new_client_model.dart';
import 'package:astra_curator/core/presentation/routes/app_router.gr.dart';
import 'package:astra_curator/core/presentation/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_curator/core/presentation/widgets/date_picker/platform_date_picker.dart';
import 'package:astra_curator/core/presentation/widgets/images/photos.dart';
import 'package:astra_curator/core/presentation/widgets/popup/text_field_pop_up_menu.dart';
import 'package:astra_curator/core/presentation/widgets/text_fields/core/validators.dart';
import 'package:astra_curator/core/presentation/widgets/text_fields/lost_focus_text_field.dart';
import 'package:astra_curator/core/presentation/widgets/texts/adding_photo_sign.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent content of editing client screen.
class EditingClientContent extends StatefulWidget {
  /// new client model.
  final NewClientModel client;

  /// Cities to display.
  final List<CityModel> cities;

  /// Countries to display.
  final List<CountryModel> countries;

  /// Whether the form is can be submitted
  final bool canSubmit;

  /// Whether the form is valid.
  final bool formIsValid;

  /// The client identifier.
  final int userId;

  const EditingClientContent({
    Key? key,
    required this.client,
    required this.cities,
    required this.countries,
    required this.canSubmit,
    required this.formIsValid,
    required this.userId,
  }) : super(key: key);

  @override
  State<EditingClientContent> createState() => _EditingClientContentState();
}

class _EditingClientContentState extends State<EditingClientContent> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (MediaQuery.of(context).viewInsets.bottom == 0) {
        FocusScope.of(context).unfocus();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void lostFocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => lostFocus(),
      child: Scaffold(
        appBar: ReusableAppBar(
          onPressed: () {
            context.popRoute();
          },
          title: '${widget.client.firstName} ${widget.client.lastName}',
          actions: [
            AppBarActionIcon(
              canSubmit: widget.canSubmit,
              formIsValid: widget.formIsValid,
              onSubmit: () {
                context.read<EditingClientActorBloc>().add(
                      const EditingClientActorEvent.updatedClientSubmitted(),
                    );
              },
              onToggled: () {
                context.read<EditingClientActorBloc>().add(
                      const EditingClientActorEvent.editingModeToggled(),
                    );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(height: 32),
                // Phone number.
                LostFocusTextField(
                  isDisabled: !widget.canSubmit,
                  keyboardType: TextInputType.phone,
                  initialTextValue: widget.client.phoneNumber,
                  hint: EditingClientTexts.phoneNumber,
                  onSubmit: (value) => context
                      .read<EditingClientActorBloc>()
                      .add(EditingClientActorEvent.phoneNumberChanged(value)),
                  validator: [
                    Validator.requiredField,
                  ],
                ),
                // First name.
                LostFocusTextField(
                  isDisabled: !widget.canSubmit,
                  hint: EditingClientTexts.firstName,
                  textCapitalization: TextCapitalization.words,
                  initialTextValue: widget.client.firstName,
                  onChanged: (value) {
                    context.read<EditingClientActorBloc>().add(
                          EditingClientActorEvent.firstNameChanged(value),
                        );
                  },
                  validator: [
                    Validator.requiredField,
                  ],
                ),
                // Last name.
                LostFocusTextField(
                  isDisabled: !widget.canSubmit,
                  hint: EditingClientTexts.lastName,
                  textCapitalization: TextCapitalization.words,
                  initialTextValue: widget.client.lastName,
                  onChanged: (value) {
                    context
                        .read<EditingClientActorBloc>()
                        .add(EditingClientActorEvent.lastNameChanged(value));
                  },
                  validator: [
                    Validator.requiredField,
                  ],
                ),
                // Birthday.
                PlatformDatePicker(
                  isDisabled: !widget.canSubmit,
                  hint: EditingClientTexts.birthday,
                  initialDate: widget.client.birthday,
                  onSubmitDate: (dateTime) => context
                      .read<EditingClientActorBloc>()
                      .add(EditingClientActorEvent.birthdayChanged(dateTime)),
                ),
                const SizedBox(height: 50),
                // City.
                TextFieldPopUpMenu<CityModel>(
                  isDisabled: !widget.canSubmit,
                  initialValue: widget.client.city,
                  isFullSize: true,
                  hint: EditingClientTexts.city,
                  items: widget.cities.map((e) => e).toList(),
                  onDisplay: (item) => item.title,
                  onSelected: (selectedItem) =>
                      context.read<EditingClientActorBloc>().add(
                            EditingClientActorEvent.cityChanged(
                              selectedItem,
                            ),
                          ),
                ),
                // Country.
                TextFieldPopUpMenu<CountryModel>(
                  isDisabled: !widget.canSubmit,
                  initialValue: widget.client.country,
                  isFullSize: true,
                  hint: EditingClientTexts.country,
                  onDisplay: (item) => item.title,
                  items: widget.countries
                      .map((countryModel) => countryModel)
                      .toList(),
                  onSelected: (selectedItem) =>
                      context.read<EditingClientActorBloc>().add(
                            EditingClientActorEvent.countryChanged(
                              selectedItem,
                            ),
                          ),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    // Gender.
                    Expanded(
                      child: TextFieldPopUpMenu<GenderModel>(
                        isDisabled: !widget.canSubmit,
                        initialValue: widget.client.gender,
                        isFullSize: true,
                        hint: EditingClientTexts.gender,
                        onDisplay: (item) => item.title,
                        items: const [
                          GenderModel(
                            title: EditingClientTexts.genderMale,
                            value: 1,
                          ),
                          GenderModel(
                            title: EditingClientTexts.genderFemale,
                            value: 2,
                          ),
                        ],
                        onSelected: (selectedItem) =>
                            context.read<EditingClientActorBloc>().add(
                                  EditingClientActorEvent.genderChanged(
                                    selectedItem,
                                  ),
                                ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      // Height.
                      child: LostFocusTextField(
                        isDisabled: !widget.canSubmit,
                        keyboardType: TextInputType.number,
                        initialTextValue: widget.client.height,
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        hint: EditingClientTexts.height,
                        onChanged: (value) =>
                            context.read<EditingClientActorBloc>().add(
                                  EditingClientActorEvent.heightChanged(value),
                                ),
                        validator: [
                          Validator.requiredField,
                        ],
                      ),
                    ),
                  ],
                ),
                // MartialStatus.
                TextFieldPopUpMenu<MartialStatusModel>(
                  isDisabled: !widget.canSubmit,
                  initialValue: widget.client.martialStatus,
                  hint: EditingClientTexts.martialStatus,
                  onDisplay: (item) => item.title,
                  items: const [
                    MartialStatusModel(
                      title: EditingClientTexts.martialStatusSingle,
                      value: 0,
                    ),
                    MartialStatusModel(
                      title: EditingClientTexts.martialStatusDivorced,
                      value: 1,
                    ),
                  ],
                  onSelected: (selectedItem) =>
                      context.read<EditingClientActorBloc>().add(
                            EditingClientActorEvent.martialStatusChanged(
                              selectedItem,
                            ),
                          ),
                ),
                // Child status.
                TextFieldPopUpMenu<ChildStatusModel>(
                  isDisabled: !widget.canSubmit,
                  initialValue: widget.client.haveChild,
                  hint: EditingClientTexts.haveChild,
                  onDisplay: (item) => item.title,
                  items: const [
                    ChildStatusModel(
                      title: EditingClientTexts.haveChildFalse,
                      value: false,
                    ),
                    ChildStatusModel(
                      title: EditingClientTexts.haveChildTrue,
                      value: true,
                    ),
                  ],
                  onSelected: (selectedItem) =>
                      context.read<EditingClientActorBloc>().add(
                            EditingClientActorEvent.childStatusChanged(
                              selectedItem,
                            ),
                          ),
                ),
                // Short description.
                SizedBox(
                  height: 150,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: LostFocusTextField(
                      isDisabled: !widget.canSubmit,
                      initialTextValue: widget.client.shortDescription,
                      textInputAction: TextInputAction.newline,
                      hint: EditingClientTexts.shortDescription,
                      textCapitalization: TextCapitalization.sentences,
                      onSubmit: (value) =>
                          context.read<EditingClientActorBloc>().add(
                                EditingClientActorEvent.shortDescriptionChanged(
                                  value,
                                ),
                              ),
                      validator: [
                        Validator.requiredMin80Symbols,
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Photos(
                  isDisabled: !widget.canSubmit,
                  images: widget.client.photos,
                  onPickImage: () => context.read<EditingClientActorBloc>().add(
                        const EditingClientActorEvent.photosAdded(),
                      ),
                  onShowImage: () {
                    context.navigateTo(
                      ClientsPhotosRouter(images: widget.client.photos),
                    );
                  },
                ),
                const SizedBox(height: 16),
                AddingPhotoSign(
                  widget.client.photos.length,
                  isDisabled: !widget.canSubmit,
                  onTap: () => context.read<EditingClientActorBloc>().add(
                        const EditingClientActorEvent.photosAdded(),
                      ),
                ),
                const SizedBox(height: 32),
                AstraGradientButton(
                  isEnableButton: !widget.canSubmit,
                  title: EditingClientTexts.buttonTitle,
                  onClick: () => context.navigateTo(
                    EditingDetailedClientInfoRouter(userId: widget.userId),
                  ),
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
