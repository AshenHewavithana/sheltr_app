import 'package:flutter/material.dart';
import 'package:sheltr_flutter/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:sheltr_flutter/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:sheltr_flutter/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:sheltr_flutter/src/utils/theme/widget_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: AppTextTheme.lightTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: TextFormFieldTheme.lightInputDecorationTheme);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: AppTextTheme.darkTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: TextFormFieldTheme.darkInputDecorationTheme);
}
