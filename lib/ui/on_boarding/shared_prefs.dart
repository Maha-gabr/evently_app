import 'package:shared_preferences/shared_preferences.dart';
class AppPreference{
  static SharedPreferences? _prefs;
  static AppPreference? _instance;
  AppPreference._();
  static AppPreference instance(){
    _instance ??= AppPreference._();
    return _instance!;
  }

  static Future<void> init () async {
    _prefs ??= await SharedPreferences.getInstance();

  }

  Future<bool> saveData(String key , dynamic value)async{
    if(value is String){
     return await _prefs!.setString(key, value);
    }else if(value is int){
     return await _prefs!.setInt(key, value);
    }else if(value is bool){
     return await _prefs!.setBool(key, value);
    }
     return false;

  }

  dynamic getData(String key){
    return _prefs!.get(key);
  }



}