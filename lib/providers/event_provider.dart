import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';
import '../models/event.dart';
import '../utiles/firebase_utils.dart';

class EventProvider extends ChangeNotifier{
  int selectedIndex = 0;
  List <Event> eventsList =[];
  List <Event> filterList =[];
  List <Event> favList =[];

  bool isLoading = false;
  String? errorMessage;
  StreamSubscription<QuerySnapshot<Event>>? listener ;
  late Stream<QuerySnapshot<Event>> streamSnapShot;

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

void getEventsList(String uid){
     listener?.cancel();
    isLoading = true;
    errorMessage = null;
    notifyListeners();
 streamSnapShot=FirebaseUtils.eventCollectionRef(uid).orderBy("eventDate").snapshots();
 listener= streamSnapShot.listen((event) {
   eventsList = event.docs.map((doc) {
     Event eventData = doc.data();
     eventData.id = doc.id; // <-- VERY IMPORTANT
     return eventData;
   }).toList();
    favList = eventsList.where((e) => e.isFav == true).toList();
    applyFilter();
   //  filterList = [...eventsList];
    isLoading= false;
    notifyListeners();
}
);
  }

  void applyFilter (){
    if (selectedIndex == 0) {
      filterList = eventsList;
    } else {
      filterList = eventsList
          .where((event) =>
      event.eventName == eventNameList[selectedIndex])
          .toList();
    }
  }

  Future<void> applyFav(Event event, String uid) async {
    event.isFav = !event.isFav;
   // notifyListeners();
     await FirebaseUtils
        .eventCollectionRef(uid)
        .doc(event.id)
        .update({
      "isFav": event.isFav
    });
    notifyListeners();

  }
Future<void> deleteEvent(Event event ,MyUser user) async {
   await FirebaseUtils
      .eventCollectionRef(user.id)
      .doc(event.id)
      .delete();

}

  void applySearch(String value) {
    favList = favList.
        where((event) =>
    event.eventTitle.toLowerCase().contains(value.toLowerCase())).toList();
    notifyListeners();
  }

  void stopListening(){
    listener?.cancel();
  }

}





// Event? updatedEvent;
// void changeEvent (Event newEvent){
//     updatedEvent = newEvent;
//     notifyListeners();
// }
// void initEvent(){
//   updatedEvent = null;
//   notifyListeners();
// }
// Future<void> updateEvent(Event oldEvent ,MyUser user, Event newEvent) async {
//     await FirebaseUtils
//       .eventCollectionRef(user.id)
//       .doc(oldEvent.id)
//       .update({
//       "eventTitle": newEvent.eventTitle,
//       "eventDescription": newEvent.eventDescription,
//       "eventDate": newEvent.eventDate,
//       "eventTime": newEvent.eventTime,
//       "eventImage": newEvent.eventImage,
//       "eventName": newEvent.eventName,
//   });
//   notifyListeners();
// }
