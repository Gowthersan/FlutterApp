// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  /// Theme light customisable
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.black),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.black),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.black),
    //
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.black),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.black),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: TColors.black.withOpacity(0.5)),
    //
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.black),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.black),
    //
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.black),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: TColors.black.withOpacity(0.5)),
  );

  /// Theme dark customisable
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: TColors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: TColors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.white),
    //
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: TColors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: TColors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: TColors.white.withOpacity(0.5)),
    //
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: TColors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: TColors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: TColors.white),
    //
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: TColors.white),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: TColors.white.withOpacity(0.5)),
  );
}
