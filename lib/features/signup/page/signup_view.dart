import 'package:bank/features/login/widget/common_textfield.dart';
import 'package:bank/features/signup/bloc/signup_bloc.dart';
import 'package:bank/features/signup/widget/button_widget.dart';
import 'package:bank/features/signup/widget/country_picker_text_field.dart';
import 'package:bank/themes/color_palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.5),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  AppLocalizations.of(context)
                          ?.signupPageCreateYourAccountLabel ??
                      '',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: ColorPalettes.color000000,
                      ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CommonTextField(
                  attributes: CommonTextFieldAttributes(
                      hint: AppLocalizations.of(context)?.signupNameHintText,
                      topLabel: AppLocalizations.of(context)?.signupNameLabel,
                      onSubmitted: (value) {},
                      textfieldType: TextFieldType.email,
                      prefixIconPath: ''),
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  attributes: CommonTextFieldAttributes(
                      hint: AppLocalizations.of(context)?.signupEmailHintText,
                      topLabel: AppLocalizations.of(context)?.signupEmailLabel,
                      onSubmitted: (value) {},
                      textfieldType: TextFieldType.email,
                      prefixIconPath: ''),
                ),
                const SizedBox(
                  height: 20,
                ),
                CountryPickerTextField(
                  attributes: CountryPickerTextFieldAttributes(
                    topLabel:
                        AppLocalizations.of(context)?.signupPagePhoneLabel ??
                            '',
                    onSubmitted: (value) {},
                    countries: [],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  attributes: CommonTextFieldAttributes(
                      hint:
                          AppLocalizations.of(context)?.signupPasswordHintText,
                      topLabel:
                          AppLocalizations.of(context)?.signupPasswordLabel,
                      onSubmitted: (value) {},
                      textfieldType: TextFieldType.password,
                      prefixIconPath: ''),
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  attributes: CommonTextFieldAttributes(
                      hint: AppLocalizations.of(context)
                          ?.signupVerifyPasswordHintText,
                      topLabel: AppLocalizations.of(context)
                          ?.signupVerifyPasswordLabel,
                      onSubmitted: (value) {},
                      textfieldType: TextFieldType.password,
                      prefixIconPath: ''),
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  attributes: CommonTextFieldAttributes(
                      hint: AppLocalizations.of(context)
                          ?.signupAccountNumberHintText,
                      topLabel: AppLocalizations.of(context)
                          ?.signupAccountNumberLabel,
                      onSubmitted: (value) {},
                      textfieldType: TextFieldType.email,
                      prefixIconPath: ''),
                ),
                const SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                  attributes: ButtonWidgetAttributes(
                    title: AppLocalizations.of(context)
                            ?.signupCreateAccountCtaText ??
                        '',
                    width: MediaQuery.of(context).size.width,
                    backgroundColor: ColorPalettes.color75A29F,
                    borderRadius: 10,
                    buttonTextStyle:
                        Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: ColorPalettes.colorFFFFFF,
                            ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
