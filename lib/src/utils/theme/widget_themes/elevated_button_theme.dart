import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: WhiteColor,
        backgroundColor: SecondaryColor,
        side: BorderSide(color: SecondaryColor),
        padding: EdgeInsets.symmetric(vertical: ButtonHeight)),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        foregroundColor: SecondaryColor,
        backgroundColor: WhiteColor,
        side: BorderSide(color: SecondaryColor),
        padding: EdgeInsets.symmetric(vertical: ButtonHeight)),
  );
}
