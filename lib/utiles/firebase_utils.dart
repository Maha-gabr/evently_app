import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/event.dart';
class FirebaseUtils {

static CollectionReference<Event> collectionRef(){
  return FirebaseFirestore.instance.collection(Event.collectionName).withConverter<Event>(
      fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => value.toFireStore(),);
}

static Future<void> addEventToFireStore(Event event){
  DocumentReference<Event> docRef = collectionRef().doc();
  event.id =docRef.id;
  return docRef.set(event);
}
}