import 'package:bank/features/signup/bloc/signup_bloc.dart';
import 'package:bank/features/signup/widget/country_picker_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(40),
            child: CountryPickerTextField(
              attributes: CountryPickerTextFieldAttributes(
                countries: [],
              ),
            ),
          );
        },
      ),
    );
  }
}
