import 'package:shared_preferences/shared_preferences.dart';
class AppPreference{
  static String onBoardingKey = 'seenOnboarding';
  static Future<void> markOnboardingComplete ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(onBoardingKey, true);
  }
  static Future<bool> isOnboardingComplete ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onBoardingKey) ?? false;
  }
}