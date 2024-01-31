import 'package:bank/themes/color_palettes.dart';
import 'package:flutter/material.dart';

class CommonButtonAttributes {
  final String? text;
  final String? icon;
  final Icon? iconData;
  final Color? containerColor;
  final TextStyle? style;
  final Function? onPressed;

  CommonButtonAttributes(
      {this.text,
      this.icon,
      this.iconData,
      this.containerColor,
      this.style,
      this.onPressed});
}

class CommonButton extends StatelessWidget {
  final CommonButtonAttributes attributes;
  const CommonButton({super.key, required this.attributes});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        attributes.onPressed?.call(context);
      },
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.fromLTRB(13, 7, 13, 7),
          decoration: ShapeDecoration(
              shape: const StadiumBorder(), color: attributes.containerColor),
          child: Row(
            children: [
              Text(
                attributes.text ?? '',
                style: attributes.style ??
                    Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: ColorPalettes.colorFFFFFF),
              ),
              if (attributes.icon?.isNotEmpty ?? false)
                Image.asset(attributes.icon ?? ''),
              if (attributes.iconData != null) attributes.iconData!
            ],
          ),
        ),
      ),
    );
  }
}
