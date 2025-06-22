import 'package:events/features/authentication/data/models/user.dart';

abstract class SecureLocalStorage {
  void addUserInfoToLocalStorage({required UserModel user});

  Future<UserModel> getUserInfo();
  Future<String> getData({required String key});
  void setData({required String key, required dynamic value});
  void cleanAllStorage();
  void cleanData({required String key });
}
