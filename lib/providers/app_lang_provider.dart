import 'package:flutter/foundation.dart';

class AppLangProvider extends ChangeNotifier{
  String appLang ='en';
  void changLang(String newLang){
    if(appLang == newLang){
      return;
    }
    appLang = newLang;
    notifyListeners();
  }

  bool  isSelected (String lang){
    return appLang == lang;
  }
}