import 'package:evently_app/utiles/app_colors.dart';
import 'package:evently_app/utiles/app_styles.dart';
import 'package:flutter/material.dart';
class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.semi20Black,
      headlineMedium: AppStyles.reg14Grey,
      headlineSmall: AppStyles.med16Black
    )
  );

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryDarkColor,
      textTheme: TextTheme(
          headlineLarge: AppStyles.semi20White,
          headlineMedium: AppStyles.reg14White,
          headlineSmall: AppStyles.med16White

      )
  );
}
