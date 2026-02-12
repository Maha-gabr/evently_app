import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/event.dart';
class FirebaseUtils {

static CollectionReference<Event> eventCollectionRef(){
  return FirebaseFirestore.instance.collection(Event.collectionName).withConverter<Event>(
      fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => value.toFireStore(),);
}

static Future<void> addEventToFireStore(Event event){
  DocumentReference<Event> docRef = eventCollectionRef().doc();
  event.id =docRef.id;
  return docRef.set(event);
}
}