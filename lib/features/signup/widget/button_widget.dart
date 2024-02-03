import 'package:flutter/widgets.dart';

class ButtonWidget extends StatelessWidget {
  final ButtonWidgetAttributes attributes;
  
  const ButtonWidget({super.key,required this.attributes});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15,bottom: 15),
      width: attributes.width,
      height: attributes.height,
      decoration: BoxDecoration(
        color: attributes.backgroundColor,
        borderRadius: BorderRadius.circular(attributes.borderRadius ?? 0),
      ),
      child: Text(attributes.title, style: attributes.buttonTextStyle,textAlign: TextAlign.center,),
    );
  }
}

class ButtonWidgetAttributes {
  String title;
  void Function()? onPressed;
  Color? backgroundColor;
  double? borderRadius;
  double? height;
  double? width;
  TextStyle? buttonTextStyle;

  ButtonWidgetAttributes({
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.height,
    this.width,
    this.buttonTextStyle,
  });
}
