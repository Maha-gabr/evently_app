import 'package:evently_app/utiles/app_colors.dart';
import 'package:evently_app/utiles/app_styles.dart';
import 'package:flutter/material.dart';
class AppTheme{
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.whiteBgColor,),
      scaffoldBackgroundColor: AppColors.whiteBgColor,
      textTheme: TextTheme(
        headlineLarge: AppStyles.semi20Black,
        headlineMedium: AppStyles.reg14Grey,
        headlineSmall: AppStyles.med16Black,
        titleSmall: AppStyles.med16White,
        labelLarge: AppStyles.semi24main,
        bodySmall: AppStyles.semi14Main,
        labelSmall: AppStyles.med16main,
        bodyMedium: AppStyles.semi14White,
        titleLarge: AppStyles.med20black,
        labelMedium: AppStyles.semi16Main,
        titleMedium: AppStyles.med14Black,
        displaySmall: AppStyles.reg16grey,
        displayMedium: AppStyles.med18main
      ),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.whiteBgColor,
          indicatorColor:Colors.transparent,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppStyles.reg12main;
            }else
            {
              return AppStyles.reg12grey;
            }
          }),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)){
              return IconThemeData(color:AppColors.mainColor,size: 24,);
            }else
            {
              return IconThemeData(color:AppColors.lightGreyColor,size: 24);
            }
          }
            ,)
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(50)
        ),
        iconSize: 24,
        backgroundColor: AppColors.mainColor,
        extendedPadding: EdgeInsetsGeometry.all(12),
        elevation: 8,
        foregroundColor: AppColors.whiteBgColor,

      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(
            fontSize: 16,
            fontWeight: .w500,
            decoration: TextDecoration.none
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
        hintStyle: AppStyles.reg14Grey,
        prefixIconColor: AppColors.greyColor,
        suffixIconColor: AppColors.greyColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: AppColors.strokeWhiteColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: AppColors.strokeWhiteColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: AppColors.redColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: AppColors.redColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity,35),
              backgroundColor: AppColors.mainColor,
              padding: EdgeInsetsGeometry.symmetric(vertical: 9),
              textStyle: AppStyles.med20white,
              foregroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16))
          )
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
          shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16),
          ),
          minimumSize: Size(double.infinity, 50),
          textStyle: AppStyles.med18main,
          foregroundColor: AppColors.mainColor,
        ),
      ),
      colorScheme: ColorScheme.light(
          primary: AppColors.mainColor,
          primaryContainer: AppColors.whiteColor,
          secondary: AppColors.whiteColor,
          onPrimary: AppColors.whiteBgColor,
          surface: AppColors.strokeWhiteColor,
          tertiary: AppColors.mainColor,
        onSecondary: AppColors.mainColor
      )
  );

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryDarkColor,),
      scaffoldBackgroundColor: AppColors.primaryDarkColor,
      textTheme: TextTheme(
        headlineLarge: AppStyles.semi20White,
        headlineMedium: AppStyles.reg14White,
        headlineSmall: AppStyles.med16White,
        titleSmall: AppStyles.med16White,
        labelLarge: AppStyles.semi24white,
        bodySmall: AppStyles.semi14MainDark,
        labelSmall: AppStyles.med16mainDark,
        bodyMedium: AppStyles.semi14White,
        titleLarge: AppStyles.med20white,
        labelMedium: AppStyles.semi16MainDark,
        titleMedium: AppStyles.med14White,
        displaySmall: AppStyles.reg16whiteDark,
          displayMedium: AppStyles.med18White


      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.primaryDarkColor,
        indicatorColor:Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppStyles.reg12mainDark;
          }else
          {
            return AppStyles.reg12grey;
          }
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)){
            return IconThemeData(color:AppColors.mainDarkColor,size: 24);
          }else
          {
            return IconThemeData(color:AppColors.lightGreyColor,size: 24);
          }
        }

        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(50)
          ),
          iconSize: 24,

          elevation: 8,
          foregroundColor: AppColors.whiteBgColor,
          extendedPadding: EdgeInsetsGeometry.all(12),
          backgroundColor: AppColors.mainDarkColor
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(
          fontSize: 16,
          fontWeight: .w500,
          decoration: TextDecoration.none,
        ),

        filled: true,
        fillColor: AppColors.fillDarkColor,
        hintStyle: AppStyles.reg14whiteDark,
        prefixIconColor: AppColors.whiteDarkColor,
        suffixIconColor: AppColors.whiteDarkColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: AppColors.strokeDarkColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: AppColors.strokeDarkColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: AppColors.redColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: AppColors.redColor
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainDarkColor,
              minimumSize: Size(double.infinity,35),
              foregroundColor: AppColors.whiteColor,
              padding: EdgeInsetsGeometry.symmetric(vertical: 9),
              textStyle: AppStyles.med20white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16))
          )
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.fillDarkColor,
            shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16),
                side: BorderSide(color: AppColors.strokeDarkColor,width: 2)
            ),
            minimumSize: Size(double.infinity, 50),
            textStyle: AppStyles.med18mainDark,
            foregroundColor: AppColors.mainColor,

          )
      ),
      colorScheme: ColorScheme.light(
          primary: AppColors.mainDarkColor,
          primaryContainer: AppColors.fillDarkColor,
          secondary: AppColors.whiteColor,
          onPrimary: AppColors.primaryDarkColor,
          surface: AppColors.strokeDarkColor,
          tertiary: AppColors.whiteBgColor,
          onSecondary: AppColors.whiteColor




      )
  );
}
