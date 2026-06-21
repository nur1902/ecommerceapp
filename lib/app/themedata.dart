import 'package:flutter/material.dart';

import 'colors.dart';

class Themedata {
  static ThemeData _lightThemeData= ThemeData(
    colorSchemeSeed: AppColors.themecolor,
    scaffoldBackgroundColor: Colors.white,
    progressIndicatorTheme: _progressIndicatorThemeData,

  );
  static ThemeData _darkThemeData= ThemeData(
    colorSchemeSeed: AppColors.themecolor,
    brightness: Brightness.dark,
    progressIndicatorTheme: _progressIndicatorThemeData,

  );

   static ProgressIndicatorThemeData  get _progressIndicatorThemeData{
     return ProgressIndicatorThemeData(color: AppColors.themecolor);
   }


  static ThemeData  get lightTheme => _lightThemeData;
  static ThemeData  get darkTheme => _darkThemeData;

}