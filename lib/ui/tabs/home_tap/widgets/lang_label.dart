import 'package:evently_app/providers/app_lang_provider.dart';
import 'package:evently_app/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';
class LangLabel extends StatelessWidget {
  const LangLabel({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var langProvider = Provider.of<AppLangProvider>(context);
    return GestureDetector(
      onTap: (){
        langProvider.changLang(langProvider.appLang == 'en' ? 'ar' : 'en');
      },
      child: Container(
        padding: EdgeInsetsGeometry.symmetric(vertical: 4,horizontal: 8),
        decoration: BoxDecoration(
            color: themeProvider.isDark() ? AppColors.mainDarkColor :AppColors.mainColor,
            borderRadius: BorderRadiusGeometry.circular(8)
        ),
        child: Text(langProvider.appLang.toUpperCase(),style: Theme.of(context).textTheme.bodyMedium,),
      ),
    );
  }
}
