class Event {
  static const String collectionName ='Events';
  String id;
  String eventImage ;
  String eventName ;
  String eventTitle ;
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
    this.isFav =false,
  });



}