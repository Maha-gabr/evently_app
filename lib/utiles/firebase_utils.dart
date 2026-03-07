import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event.dart';
import '../models/user.dart';
class FirebaseUtils {

static CollectionReference<Event> eventCollectionRef(String uid){
  return  usersCollectionRef().doc(uid).collection(Event.collectionName).withConverter<Event>(
      fromFirestore: (snapshot, options) => Event.fromFireStore(snapshot.data()!),
      toFirestore: (value, options) => value.toFireStore(),);
}
static Future<void> addEventToFireStore(Event event,String uid) async {
  DocumentReference<Event> docRef = eventCollectionRef(uid).doc();
  event.id =docRef.id;
  return await docRef.set(event);
}
// get user collection
 static CollectionReference<MyUser>usersCollectionRef(){
  return FirebaseFirestore.instance.collection(MyUser.collectionName).withConverter(
      fromFirestore: (snapshot, options) => MyUser.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),);
}
static Future<void> addUsersToFireStore(MyUser user) async {
  return await usersCollectionRef().doc(user.id).set(user);
}
}