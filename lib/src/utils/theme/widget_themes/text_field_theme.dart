import 'package:flutter/material.dart';
import 'package:sheltr_flutter/src/constants/colors.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: SecondaryColor,
          floatingLabelStyle: TextStyle(color: SecondaryColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: SecondaryColor)));

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
          border: OutlineInputBorder(),
          prefixIconColor: PrimaryColor,
          floatingLabelStyle: TextStyle(color: PrimaryColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: PrimaryColor)));
}
