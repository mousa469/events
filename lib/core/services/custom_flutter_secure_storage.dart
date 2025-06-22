import 'dart:developer';

import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/keys.dart';
import 'package:events/features/authentication/data/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomFlutterSecureStorage extends SecureLocalStorage {
  final storage = FlutterSecureStorage();

  @override
  void addUserInfoToLocalStorage({required UserModel user}) async {
    await storage.write(key: Keys.userEmail, value: user.email);
    await storage.write(key: Keys.userID, value: user.userID);
    await storage.write(key: Keys.userName, value: user.name);
    log("adding user data to secure storage successfully");
    log("  email is :${user.email}");
    log("  name  is :${user.name}");
    log("  id   is :${user.userID}");
  }

  Future<UserModel> getUserInfo() async {
    String userID = await storage.read(key: Keys.userID) ?? "no data available";
    String userEmail =
        await storage.read(key: Keys.userEmail) ?? "no data available";
    String userName =
        await storage.read(key: Keys.userName) ?? "no data available";

    log("get user data from secure storage successfully");
    log("  email is :${storage.read(key: Keys.userEmail)}");
    log("  name  is :${storage.read(key: Keys.userName)}");
    log("  id   is :${storage.read(key: Keys.userName)}");

    return UserModel(userID: userID, email: userEmail, name: userName);
  }

  @override
  Future<String> getData({required String key}) async {
    String? value = await storage.read(key: key);
    if (value != null) {
      return value;
    } else {
      return "No data available";
    }
  }

  @override
  void setData({required String key, required value}) async {
    await storage.write(key: key, value: value);
  }

  void cleanStorage() {
    storage.deleteAll();
  }

  @override
  void cleanAllStorage() async {
    await storage.deleteAll();
  }

  @override
  void cleanData({required String key}) async {
    await storage.delete(key: key);
  }
}
