import 'package:evently_app/ui/on_boarding/shared_prefs.dart';
import 'package:evently_app/utiles/app_constant.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode appTheme = ThemeMode.values[AppPreference.instance().getData(AppConstant.appThemeKey)];

  void changeTheme(ThemeMode newTheme){
    if(appTheme == newTheme ){
      return;
    }
     appTheme = newTheme;
    AppPreference.instance().saveData(AppConstant.appThemeKey, newTheme.index);
    notifyListeners();
  }

  bool  isSelected (ThemeMode themeMode){
    return appTheme == themeMode;
  }

  bool isDark(){
    return appTheme == ThemeMode.dark;


  }
}