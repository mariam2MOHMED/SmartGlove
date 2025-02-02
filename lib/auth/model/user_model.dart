class UserModel{
  String id;
  String name;
  String email;
  String password;
  UserModel({
    this.id="",
    required this.name,
    required this.email,
    required this.password,
});
  UserModel.fromJson(Map<String,dynamic>json):this(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"]
  );
  Map<String,dynamic>toJson()=>{
    'id':id,
    'name':name,
    'email':email,
    'password':password,
  };
}