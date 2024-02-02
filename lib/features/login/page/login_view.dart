import 'package:bank/features/core/navigation_manager/navigation_manager.dart';
import 'package:bank/features/login/bloc/login_bloc.dart';
import 'package:bank/features/login/widget/common_textfield.dart';
import 'package:bank/themes/color_palettes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  @override
  void initState() {
    final blocProvider = BlocProvider.of<LoginBloc>(context);
    blocProvider.stream.listen((state) {
      if (state is LoginAPIFailure) {
        _errorPopups(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: ((ctx, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 83, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(context),
                _credentials(ctx),
                Align(
                  alignment: Alignment.center,
                  child: _buttons(ctx),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  _errorPopups(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) {
          return AlertDialog(
              backgroundColor: ColorPalettes.colorFFFFFF,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: SizedBox(
                height: 325,
                width: 360,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/error_popups.png'),
                      Text(AppLocalizations.of(context)!.wrongCredentials,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: ColorPalettes.color000000)),
                      _errorPopUpCta(),
                    ]),
              ));
        }));
  }

  _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Text(
        AppLocalizations.of(context)!.loginPageTitle,
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: ColorPalettes.color000000),
      ),
    );
  }

  String? errorMessageEmailField(BuildContext context) {
    final state = context.read<LoginBloc>().state;
    final errorType = state.errorType;
    switch (errorType) {
      case ErrorType.emptyEmail:
      case ErrorType.wrongEmailFormat:
        return AppLocalizations.of(context)!.emailIdValidationErrorMessage;
      default:
        return null;
    }
  }

  String? errorMessageForPasswordField(BuildContext context) {
    final state = context.read<LoginBloc>().state;
    final errorType = state.errorType;
    switch (errorType) {
      case ErrorType.emptyPassword:
        return AppLocalizations.of(context)!.emptyPasswordErrorMessage;
      default:
        return null;
    }
  }

  _credentials(BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, bottom: 46),
      child: Column(
        children: [
          CommonTextField(
            attributes: CommonTextFieldAttributes(
                hint:
                    AppLocalizations.of(context)!.loginPageEmailTextFieldLabel,
                topLabel: AppLocalizations.of(context)!.loginPageEmailLabel,
                onSubmitted: (val) {
                  ctx.read<LoginBloc>().add(OnTextFieldChangeSubmitEvent(
                      eventType: PossibleTextfields.email,
                      userEnteredText: val));
                },
                onChange: (val) {},
                textfieldType: TextFieldType.email,
                errorMessage: errorMessageEmailField(ctx),
                prefixIconPath: 'assets/images/email.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          CommonTextField(
            attributes: CommonTextFieldAttributes(
                hint: AppLocalizations.of(context)!
                    .loginPagePasswordTextFieldLabel,
                topLabel: AppLocalizations.of(context)!.loginPagePasswordLabel,
                onSubmitted: (val) {
                  ctx.read<LoginBloc>().add(OnTextFieldChangeSubmitEvent(
                      eventType: PossibleTextfields.password,
                      userEnteredText: val));
                },
                onChange: (val) {},
                textfieldType: TextFieldType.password,
                sufficIconPath: 'assets/images/password_icon.png',
                errorMessage: errorMessageForPasswordField(ctx),
                prefixIconPath: 'assets/images/passwordFieldIcon.png'),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  _errorPopUpCta() {
    return GestureDetector(
      onTap: () {
        NavigationManager()
            .navigateTo(routeName: '', navigationType: NavigationType.goBack);
      },
      child: Container(
        width: 66,
        height: 31,
        decoration: const BoxDecoration(
            color: ColorPalettes.color75A29F,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.closeCtaLabel,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: ColorPalettes.colorFFFFFF),
          ),
        ),
      ),
    );
  }

  _buttons(BuildContext ctx) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ctx.read<LoginBloc>().add(OnLoginButtonPressEvent());
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width - 30,
            height: 60,
            decoration: const BoxDecoration(
                color: ColorPalettes.color75A29F,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.loginCtaLabel,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: ColorPalettes.colorFFFFFF),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          child: Container(
            width: MediaQuery.sizeOf(context).width - 30,
            height: 60,
            decoration: BoxDecoration(
                color: ColorPalettes.colorFFFFFF,
                border: Border.all(color: ColorPalettes.color75A29F),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/fingerprint.png'),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.fingerPrintCtaLabel,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: ColorPalettes.color75A29F),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        GestureDetector(
          child: Container(
            width: MediaQuery.sizeOf(context).width - 30,
            height: 60,
            decoration: const BoxDecoration(
                color: ColorPalettes.colorFFFFFF,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.createAccountCtaLabel,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: ColorPalettes.color75A29F),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _textField() {}
}
