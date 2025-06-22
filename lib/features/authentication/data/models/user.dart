class UserModel {
  final String userID;
  final String email;
  final String name;

  UserModel({required this.userID, required this.email, required this.name});

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      userID: json["userID"],
      email: json["email"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"userID": userID, "email": email, "name": name};
  }




}
