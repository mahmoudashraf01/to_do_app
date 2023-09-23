import 'package:flutter/material.dart';
import 'package:to_do/themes/colors.dart';
import 'package:to_do/themes/text.dart';

var appBarTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: appBarColor,
    titleTextStyle: h5Bold,
    titleSpacing: 0,
  ),
  scaffoldBackgroundColor: appColor,
  textTheme: TextTheme(
    displayLarge: h1,
    displayMedium: h2,
    displaySmall: h3,
    headlineMedium: h4,
    headlineSmall: h5,
    titleLarge: title1,
    titleSmall: title2,
    bodySmall: caption,
    bodyLarge: body,
  ),
);
