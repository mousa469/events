import 'package:events/core/utilies/keys.dart';

class UserModel {
  final String userID;
  final String email;
  final String name;

  UserModel({required this.userID, required this.email, required this.name});

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      userID: json[Keys.userID],
      email: json[Keys.userEmail],
      name: json[Keys.userName],
    );
  }

  Map<String, dynamic> toJson() {
    return {Keys.userID: userID,Keys.userEmail: email, Keys.userName: name};
  }




}
