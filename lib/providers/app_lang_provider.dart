import 'package:evently_app/ui/on_boarding/shared_prefs.dart';
import 'package:evently_app/utiles/app_constant.dart';
import 'package:flutter/foundation.dart';

class AppLangProvider extends ChangeNotifier{
  //String appLang ='en';
  String appLang =AppPreference.instance().getData(AppConstant.appLangKey) ??" en";

  void changLang(String newLang){
    if(appLang == newLang){
      return;
    }
    appLang = newLang;
    AppPreference.instance().saveData(AppConstant.appLangKey, newLang);
    notifyListeners();
  }

  bool  isSelected (String lang){
    return appLang == lang;
  }
}