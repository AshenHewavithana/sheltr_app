import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(),
          foregroundColor: SecondaryColor,
          side: BorderSide(color: SecondaryColor),
          padding: EdgeInsets.symmetric(vertical: ButtonHeight)));

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(),
          foregroundColor: WhiteColor,
          side: BorderSide(color: WhiteColor),
          padding: EdgeInsets.symmetric(vertical: ButtonHeight)));
}
