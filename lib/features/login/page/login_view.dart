import 'package:bank/features/login/bloc/login_bloc.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: ((ctx, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 83,left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              _title(context), 
              Align(
                alignment: Alignment.center,
                child:  _buttons(ctx),)
             ],
            ),
          );
        }),
      ),
    );
  }

  _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 10),
      child: Text(
        AppLocalizations.of(context)!.loginPageTitle,
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: ColorPalettes.color000000),
      ),
    );
  }

  _credentials(BuildContext ctx) {
    return Column(
      children: [
        _textField(),
        _textField(),
      ],
    );
  }

  _buttons(BuildContext ctx) {
    return Column(
      children: [
        GestureDetector(
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
