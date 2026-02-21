import 'package:evently_app/providers/app_lang_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/providers/event_provider.dart';
import 'package:evently_app/providers/userProvider.dart';
import 'package:evently_app/ui/add_event_screen/add_event_screen.dart';
import 'package:evently_app/ui/authentication/login_screen/login_screen.dart';
import 'package:evently_app/ui/authentication/register_screen/register_screen.dart';
import 'package:evently_app/ui/root_screen.dart';
import 'package:evently_app/ui/tabs/home_tap/home_tap.dart';
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
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLangProvider(),),
        ChangeNotifierProvider(create: (context) => AppThemeProvider(),),
        ChangeNotifierProvider(create: (context) => EventProvider(),),
        ChangeNotifierProvider(create: (context) => Userprovider(),)

      ],
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

      },
      initialRoute:AppRoutes.registerScreenRouteName,
      // home: RegisterScreen(),
    );
  }
}
