import 'package:bank/themes/color_palettes.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  final int currentIndex;
  final List listData;
  final Color? lightColor;
  final Color? darkColor;
  final double? width;
  final double? height;
  const IndicatorWidget(
      {super.key,
      required this.currentIndex,
      required this.listData,
      this.darkColor,
      this.height,
      this.width,
      this.lightColor});

  @override
  Widget build(BuildContext context) {
    return _indicators(context);
  }

  Widget _indicators(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listData.asMap().entries.map((entry) {
          return Container(
            width: width ?? 8.0,
            height: height ?? 8.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? lightColor ?? (ColorPalettes.indicatorDBB789)
                        : darkColor ?? (ColorPalettes.indicatorC33C29))
                    .withOpacity(currentIndex == entry.key ? 0.9 : 0.4)),
          );
        }).toList());
  }
}
