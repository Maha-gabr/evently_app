import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../l10n/app_localizations.dart';
import '../models/event.dart';
import '../utiles/firebase_utils.dart';

class EventProvider extends ChangeNotifier{
  int selectedIndex = 0;
  List <Event> eventsList =[];
  List <Event> filterList =[];
  bool isLoading = false;
  String? errorMessage;
  StreamSubscription<QuerySnapshot<Event>>? listener ;

  List <String> eventNameList = [];
  void changeIndex (int index){
    selectedIndex =index;
    notifyListeners();
  }
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

void getEventsList(){
    isLoading = true;
    errorMessage = null;
    notifyListeners();
  Stream<QuerySnapshot<Event>> streamSnapShot=FirebaseUtils.eventCollectionRef().orderBy("eventDate").snapshots();
 listener= streamSnapShot.listen((event) {
    eventsList = event.docs.map((doc) => doc.data()).toList();
    filterList = [...eventsList];
    isLoading= false;

    notifyListeners();
});

  }

  stopListening(){
    listener?.cancel();
  }
}