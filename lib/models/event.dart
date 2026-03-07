import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  static const String collectionName = 'Events';
  String id;
  String eventImage;
  String eventName;
  String eventTitle;
  String eventDescription;
  DateTime eventDate;
  String eventTime;
  bool isFav;

  Event({
    this.id = '',
    required this.eventTime,
    required this.eventDate,
    required this.eventDescription,
    required this.eventImage,
    required this.eventTitle,
    required this.eventName,
    this.isFav = false,
  });


  // to firestore
   Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'eventImage': eventImage,
      'eventName': eventName,
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
     // 'eventDate': eventDate.microsecondsSinceEpoch,
      'eventDate': Timestamp.fromDate(eventDate),
      'eventTime': eventTime,
      'isFav': isFav,
    };
  }

  //from FireStore

  Event.fromFireStore(Map<String, dynamic> data) : this(
    id:  data['id'] ?? '',
    eventImage: data['eventImage'],
    eventName: data['eventName'],
    eventTitle: data['eventTitle'],
    eventDescription: data['eventDescription'],
     eventDate: data['eventDate'] is Timestamp
         ? (data['eventDate'] as Timestamp).toDate()        // ✅ new docs
         : DateTime.fromMicrosecondsSinceEpoch(data['eventDate'] as int),
    //eventDate: DateTime.fromMicrosecondsSinceEpoch(data['eventDate']) ,
    eventTime: data['eventTime'],
    isFav: data['isFav'],
  );



}



