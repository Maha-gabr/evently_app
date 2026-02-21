class MyUser {
  static const String collectionName = 'Users';
  final String name ;
  final String email ;
  final String id ;
  const MyUser({required this.name, required this.id , required this.email});

  // from json
  // map => object
  MyUser.fromJson(Map <String , dynamic> json):this(
    id: json["id"],
    name: json["name"],
    email: json['email']
  );

  // to json
// object => map
  Map<String ,dynamic> toJson(){
    return {
      "name" :name,
      "email": email,
      "id" : id,
    };
  }

}