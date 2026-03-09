import 'package:evently_app/providers/app_lang_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/event_provider.dart';
import 'package:evently_app/providers/userProvider.dart';
import 'package:evently_app/ui/add_event_screen/add_event_screen.dart';
import 'package:evently_app/ui/authentication/login_screen/login_screen.dart';
import 'package:evently_app/ui/authentication/register_screen/register_screen.dart';
import 'package:evently_app/ui/on_boarding/shared_prefs.dart';
import 'package:evently_app/ui/on_boarding/views/on_boarding_screen.dart';
import 'package:evently_app/ui/root_screen.dart';
import 'package:evently_app/ui/tabs/home_tap/home_tap.dart';
import 'package:evently_app/utiles/app_constant.dart';
import 'package:evently_app/utiles/app_routes.dart';
import 'package:evently_app/utiles/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await AppPreference.init();
  bool onBoarding = await AppPreference.instance().getData(AppConstant.appOnBoardingKey) ?? true;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLangProvider(),),
        ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
        ChangeNotifierProvider(create: (context) => EventProvider(),),
        ChangeNotifierProvider(create: (context) => Userprovider(),)
      ],
      child: MyApp(onBoarding: onBoarding,)));
}
class MyApp extends StatelessWidget {
  final bool onBoarding ;
  const MyApp({super.key,required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    var appLangProvider = Provider.of<AppLangProvider>(context);
    var appThemeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:AppTheme.lightTheme ,
      darkTheme: AppTheme.darkTheme,
      themeMode: appThemeProvider.appTheme,
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appLangProvider.appLang),
      routes: {
        AppRoutes.homeRouteName : (context)=> HomeTap(),
        AppRoutes.addEventRouteName : (context)=> AddEventScreen(),
        AppRoutes.routeScreenRouteName : (context)=> RootScreen(),
        AppRoutes.registerScreenRouteName : (context)=> RegisterScreen(),
        AppRoutes.loginScreenRouteName : (context)=> LoginScreen(),
        AppRoutes.onBoardingScrenRouteName : (context)=>OnBoardingScreen()
      },
      initialRoute:onBoarding?AppRoutes.onBoardingScrenRouteName:AppRoutes.registerScreenRouteName,
       // home:OnBoardingScreen(),
    );
  }
}
