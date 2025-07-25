import 'package:events/core/services/local_storage.dart';
import 'package:events/core/services/secure_local_storage.dart';
import 'package:events/core/utilies/keys.dart';

abstract class HomeRepoLocalDataSource {
  Future<String> fetchUserName();
  void updateUserName({required String name});
}

class HomeRepoLocalDataSourceImpl extends HomeRepoLocalDataSource {
  SecureLocalStorage secureLocalStorage;
  LocalStorage localStorage;
  HomeRepoLocalDataSourceImpl({
    required this.secureLocalStorage,
    required this.localStorage,
  });

  @override
  Future<String> fetchUserName() async {
    return await secureLocalStorage.getData(key: Keys.userName);
  }

  @override
  void updateUserName({required String name}) {
    secureLocalStorage.setData(key: Keys.userName, value: name);
  }
}
