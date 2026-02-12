import 'package:flutter/cupertino.dart';

import '../l10n/app_localizations.dart';

class EventProvider extends ChangeNotifier{
  int selectedIndex = 0;
  List <String> eventNameList = [];
  List<String> getEventNameList(BuildContext context){
    return eventNameList =[
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.meeting
    ];
  }
  void changeIndex (int index){
    selectedIndex =index;
    notifyListeners();
  }

}