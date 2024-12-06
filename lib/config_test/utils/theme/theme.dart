import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/theme/custom/appbar_theme.dart';
import 'package:mombien_test/config_test/utils/theme/custom/bottom_sheet_theme.dart';
import 'package:mombien_test/config_test/utils/theme/custom/checkbox_theme.dart';
import 'package:mombien_test/config_test/utils/theme/custom/elevated_button_theme.dart';
import 'package:mombien_test/config_test/utils/theme/custom/outlined_button_theme.dart';
import 'package:mombien_test/config_test/utils/theme/custom/text_field_theme.dart';
import 'package:mombien_test/config_test/utils/theme/custom/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: 'Poppins',
    primarySwatch: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: TColors.white,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: 'Poppins',
    primarySwatch: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: TColors.black,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
  );
}
