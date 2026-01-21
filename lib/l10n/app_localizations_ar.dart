// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحبا';

  @override
  String get language => 'اللغات';

  @override
  String get english => 'الانجليزيه';

  @override
  String get arabic => 'عربي';

  @override
  String get theme => 'الشكل';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'غامق';

  @override
  String get dark_mode => 'الوضع الليلي';

  @override
  String get logout => 'تسجيل الخروج';
}
