import 'package:bank/themes/color_palettes.dart';
import 'package:flutter/material.dart';

enum TextFieldType {
  password,
  email,
}

class CommonTextFieldAttributes {
  final String? topLabel;
  final TextStyle? topLabelStyle;
  final String? hint;
  final Function(String text) onSubmitted;
  final Function(String text)? onChange;
  final TextFieldType textfieldType;
  final String? errorMessage;
  final String? sufficIconPath;
  final String? prefixIconPath;
  final Function? sufficIconTap;
  final TextEditingController? controller;

  CommonTextFieldAttributes({
    required this.topLabel,
    required this.onSubmitted,
    this.onChange,
    this.hint,
    this.topLabelStyle,
    this.errorMessage,
    required this.textfieldType,
    required this.prefixIconPath,
    this.sufficIconPath,
    this.sufficIconTap,
    this.controller,
  });
}

class CommonTextField extends StatefulWidget {
  final CommonTextFieldAttributes attributes;
  const CommonTextField({super.key, required this.attributes});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _obscurePassword = false;

  @override
  void initState() {
    _obscurePassword =
        widget.attributes.textfieldType == TextFieldType.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.attributes.topLabel ?? '',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: ColorPalettes.color000000),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          onChanged: (val) {
            widget.attributes.onChange?.call(val);
          },
          onSubmitted: (val) {
            widget.attributes.onSubmitted.call(val);
          },
          controller: widget.attributes.controller,
          decoration: InputDecoration(
            errorText: widget.attributes.errorMessage,
            errorStyle: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: ColorPalettes.colorC33C29),
            suffixIcon: GestureDetector(
              onTap: () {
                widget.attributes.sufficIconTap?.call();
              },
              child: Image.asset(
                widget.attributes.sufficIconPath ?? '',
              ),
            ),
            prefix: Image.asset(widget.attributes.prefixIconPath ?? ''),
            fillColor: ColorPalettes.colorF6F6F6,
            hintText: widget.attributes.hint,
          ),
        ),
      ],
    );
  }

  bool obscureText() {
    if (widget.attributes.textfieldType == TextFieldType.password) {
      return _obscurePassword;
    }
    return false;
  }
}
