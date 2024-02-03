import 'package:bank/themes/color_palettes.dart';
import 'package:flutter/material.dart';

class CountryPickerTextField extends StatefulWidget {
  final CountryPickerTextFieldAttributes attributes;

  CountryPickerTextField({
    super.key,
    required this.attributes,
  });

  @override
  State<CountryPickerTextField> createState() => _CountryPickerTextFieldState();
}

class _CountryPickerTextFieldState extends State<CountryPickerTextField> {
  String displayedCode = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ColorPalettes.color000000),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _countryPickerWidget(),
            _countryCode(),
            _textField(context),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    final countries = <CountryImageCodeModel>[
      CountryImageCodeModel(code: '91', imagePath: 'assets/images/ad.png'),
      CountryImageCodeModel(code: '92', imagePath: 'assets/images/ae.png')
    ];
    displayedCode = countries.first.code;
    super.initState();
  }

  Widget _countryCode() {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      color: ColorPalettes.colorF6F6F6,
      //width: 30,
      height: 48,
      child: Text(
        '+$displayedCode',
        textAlign: TextAlign.center,
        style: (Theme.of(context).textTheme.headlineMedium)
            ?.copyWith(color: ColorPalettes.colorA0A0A0),
      ),
    );
  }

  Widget _textField(BuildContext context) {
    return Flexible(
        child: Container(
            decoration: const BoxDecoration(
              color: ColorPalettes.colorF6F6F6,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            height: 48,
            child: TextField(
              decoration: InputDecoration(border: InputBorder.none),
            )));
  }

  Widget _countryPickerWidget() {
    final countries = <CountryImageCodeModel>[
      CountryImageCodeModel(code: '91', imagePath: 'assets/images/ad.png'),
      CountryImageCodeModel(code: '92', imagePath: 'assets/images/ae.png')
    ];
    return Container(
      padding: const EdgeInsets.all(5),
       decoration: const BoxDecoration(
        color: ColorPalettes.colorF6F6F6,
        border: Border(right: BorderSide(color: ColorPalettes.colorC4C4C4)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4),
        ),
      ),
      height: 48,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            icon: Image.asset('assets/images/arrow-down.png'),
            alignment: Alignment.center,
            value: displayedCode,
            items: countries
                .map((e) => DropdownMenuItem<String>(
                    value: e.code,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          e.imagePath,
                          cacheHeight: 20,
                          cacheWidth: 25,
                        ))))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                displayedCode = value ?? '';
              });
              widget.attributes.onCountryChanged?.call(
                  countries.firstWhere((element) => element.code == value));
            }),
      ),
    );
  }
}

class CountryPickerTextFieldAttributes {
  final List<CountryImageCodeModel> countries;
  String topLabel;
  Function(String?)? onSubmitted;
  Function(CountryImageCodeModel?)? onCountryChanged;

  CountryPickerTextFieldAttributes(
      {required this.countries, required this.topLabel,this.onSubmitted,this.onCountryChanged});
}

class CountryImageCodeModel {
  final String code;
  final String imagePath;

  CountryImageCodeModel({required this.code, required this.imagePath});
}
