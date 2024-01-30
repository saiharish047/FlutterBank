import 'package:bank/themes/color_palettes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemes{
  //! Headline1 is displayLarge
  //! Headline2 is displayMedium
  //! Headline3 is displaySmall
  //! Headline4 is headlineMedium
  //! Headline5 is headlineSmall
  //! Headline6 is titleLarge
  
  final lightTheme = GoogleFonts.getTextTheme('Plus Jakarta Sans',const TextTheme(
    headlineLarge: TextStyle(fontSize: 50,fontWeight: FontWeight.w700,),
    displayLarge: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,),
    displayMedium:  TextStyle(fontSize: 20,fontWeight: FontWeight.w700,),
    displaySmall: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,),
    headlineMedium:TextStyle(fontSize: 14 ,fontWeight: FontWeight.w600,),
    headlineSmall: TextStyle(fontSize: 12 ,fontWeight: FontWeight.w600,),
    titleLarge:TextStyle(fontSize: 12,fontWeight: FontWeight.w500,), 
  ));
  
}