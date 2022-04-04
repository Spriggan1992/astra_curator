import 'package:astra_curator/core/application/enums/loading_state_with_failures.dart';
import 'package:astra_curator/core/domain/models/child_status_model.dart';
import 'package:astra_curator/core/domain/models/city_model.dart';
import 'package:astra_curator/core/domain/models/country_model.dart';
import 'package:astra_curator/core/domain/models/gender_model.dart';
import 'package:astra_curator/core/domain/models/martial_status_model.dart';
import 'package:astra_curator/core/presentation/constants/app_texts.dart';
import 'package:astra_curator/core/presentation/routes/app_router.gr.dart';
import 'package:astra_curator/core/presentation/widgets/bars/appbar/main_app_bar.dart';
import 'package:astra_curator/core/presentation/widgets/buttons/astra_gradient_button.dart';
import 'package:astra_curator/core/presentation/widgets/date_picker/platform_date_picker.dart';
import 'package:astra_curator/core/presentation/widgets/images/photos.dart';
import 'package:astra_curator/core/presentation/widgets/popup/text_field_pop_up_menu.dart';
import 'package:astra_curator/core/presentation/widgets/text_fields/core/validators.dart';
import 'package:astra_curator/core/presentation/widgets/text_fields/lost_focus_text_field.dart';
import 'package:astra_curator/core/presentation/widgets/texts/adding_photo_sign.dart';
import 'package:astra_curator/new_client/adding_client/application/adding_client_bloc.dart';


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represent adding client screen.
class AddingClientScreenContent extends StatefulWidget {
  /// Cities to display.
  final List<CityModel> cities;

  /// Countries to display.
  final List<CountryModel> countries;

  const AddingClientScreenContent({
    Key? key,
    required this.cities,
    required this.countries,
  }) : super(key: key);

  @override
  State<AddingClientScreenContent> createState() =>
      _AddingClientScreenContentState();
}

class _AddingClientScreenContentState extends State<AddingClientScreenContent> {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const ReusableAppBar(
          title: AppTexts.addingClient,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: BlocBuilder<AddingClientBloc, AddingClientState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(height: 32),
                    // Phone number.
                    LostFocusTextField(
                      keyboardType: TextInputType.phone,
                      initialTextValue: state.client.phoneNumber,
                      hint: AppTexts.phoneNumber,
                      onSubmit: (value) => context
                          .read<AddingClientBloc>()
                          .add(AddingClientEvent.phoneNumberChanged(value)),
                      validator: [
                        Validator.requiredField,
                      ],
                    ),
                    // First name
                    LostFocusTextField(
                      hint: AppTexts.firstName,
                      textCapitalization: TextCapitalization.words,
                      initialTextValue: state.client.firstName,
                      onSubmit: (value) => context
                          .read<AddingClientBloc>()
                          .add(AddingClientEvent.firstNameChanged(value)),
                      validator: [
                        Validator.requiredField,
                      ],
                    ),
                    // Last name
                    LostFocusTextField(
                      hint: AppTexts.lastName,
                      textCapitalization: TextCapitalization.words,
                      initialTextValue: state.client.lastName,
                      onSubmit: (value) => context
                          .read<AddingClientBloc>()
                          .add(AddingClientEvent.lastNameChanged(value)),
                      validator: [
                        Validator.requiredField,
                      ],
                    ),
                    // Birthday.
                    PlatformDatePicker(
                      hint: AppTexts.birthday,
                      initialDate: state.client.birthday,
                      onSubmitDate: (dateTime) => context
                          .read<AddingClientBloc>()
                          .add(AddingClientEvent.birthdayChanged(dateTime)),
                    ),
                    const SizedBox(height: 50),
                    // City.
                    TextFieldPopUpMenu<CityModel>(
                      initialValue: widget.cities.first,
                      isFullSize: true,
                      onDisplay: (item) => item.title,
                      hint: AppTexts.city,
                      items: widget.cities.map((e) => e).toList(),
                      onSelected: (selectedItem) =>
                          context.read<AddingClientBloc>().add(
                                AddingClientEvent.cityChanged(
                                  selectedItem,
                                ),
                              ),
                    ),
                    // Country.
                    TextFieldPopUpMenu<CountryModel>(
                      initialValue: widget.countries.first,
                      isFullSize: true,
                      hint: AppTexts.country,
                      items: widget.countries
                          .map((countryModel) => countryModel)
                          .toList(),
                      onSelected: (selectedItem) =>
                          context.read<AddingClientBloc>().add(
                                AddingClientEvent.countryChanged(
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
                            initialValue: state.client.gender,
                            isFullSize: true,
                            hint: AppTexts.gender,
                            onDisplay: (item) => item.title,
                            items: const [
                              GenderModel(
                                title: AppTexts.genderMale,
                                value: 1,
                              ),
                              GenderModel(
                                title: AppTexts.genderFemale,
                                value: 2,
                              ),
                            ],
                            onSelected: (selectedItem) =>
                                context.read<AddingClientBloc>().add(
                                      AddingClientEvent.genderChanged(
                                        selectedItem,
                                      ),
                                    ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          // Height.
                          child: LostFocusTextField(
                            keyboardType: TextInputType.number,
                            initialTextValue: state.client.height,
                            textInputFormatter: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]'),
                              )
                            ],
                            hint: AppTexts.height,
                            onSubmit: (value) =>
                                context.read<AddingClientBloc>().add(
                                      AddingClientEvent.heightChanged(value),
                                    ),
                            validator: [
                              Validator.requiredField,
                            ],
                          ),
                        ),
                      ],
                    ),
                    // MartialStatus
                    TextFieldPopUpMenu<MartialStatusModel>(
                      initialValue: state.client.martialStatus,
                      hint: AppTexts.martialStatus,
                      items: const [
                        MartialStatusModel(
                          title: AppTexts.martialStatusSingle,
                          value: 0,
                        ),
                        MartialStatusModel(
                          title: AppTexts.martialStatusDivorced,
                          value: 1,
                        ),
                      ],
                      onDisplay: (item) => item.title,
                      onSelected: (selectedItem) =>
                          context.read<AddingClientBloc>().add(
                                AddingClientEvent.martialStatusChanged(
                                  selectedItem,
                                ),
                              ),
                    ),
                    // Child status.
                    TextFieldPopUpMenu<ChildStatusModel>(
                      initialValue: state.client.haveChild,
                      hint: AppTexts.haveChild,
                      onDisplay: (item) => item.title,
                      items: const [
                        ChildStatusModel(
                          title: AppTexts.haveChildFalse,
                          value: false,
                        ),
                        ChildStatusModel(
                          title: AppTexts.haveChildTrue,
                          value: true,
                        ),
                      ],
                      onSelected: (selectedItem) =>
                          context.read<AddingClientBloc>().add(
                                AddingClientEvent.childStatusChanged(
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
                          initialTextValue: state.client.shortDescription,
                          textInputAction: TextInputAction.newline,
                          hint: AppTexts.shortDescription,
                          textCapitalization: TextCapitalization.sentences,
                          onSubmit: (value) =>
                              context.read<AddingClientBloc>().add(
                                    AddingClientEvent.shortDescriptionChanged(
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
                      images: state.client.photos,
                      onPickImage: () => context.read<AddingClientBloc>().add(
                            const AddingClientEvent.photosAdded(),
                          ),
                      onShowImage: () {
                        context
                            .pushRoute(
                              NewClientPhotosRouter(
                                images: state.client.photos,
                              ),
                            )
                            .then(
                              (_) => context
                                  .read<AddingClientBloc>()
                                  .add(const AddingClientEvent.formIsFilled()),
                            );
                      },
                    ),
                    const SizedBox(height: 16),
                    AddingPhotoSign(
                      state.client.photos.length,
                      onTap: () => context.read<AddingClientBloc>().add(
                            const AddingClientEvent.photosAdded(),
                          ),
                    ),
                    const SizedBox(height: 32),
                    BlocBuilder<AddingClientBloc, AddingClientState>(
                      buildWhen: (p, c) =>
                          p.formIsFilled != c.formIsFilled ||
                          p.registerLoadingStates != c.registerLoadingStates,
                      builder: (
                        context,
                        state,
                      ) {
                        return AstraGradientButton(
                          // isEnableButton: formIsFilled,
                          isLoading: state.registerLoadingStates ==
                              LoadingStatesWithFailure.loading,
                          title: AppTexts.continueText,
                          onClick: () {
                            context
                                .read<AddingClientBloc>()
                                .add(const AddingClientEvent.buttonPressed());
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 64),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
