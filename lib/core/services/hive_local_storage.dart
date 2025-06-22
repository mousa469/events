import 'package:events/core/services/local_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveLocalStorage extends LocalStorage {
  static late Box hiveBox;

  static Future<void> hiveConfig() async {
    await Hive.initFlutter();

    hiveBox = await Hive.openBox('storageBox');
  }

  @override
  void setBool({required bool value, required String key}) async {
    await hiveBox.put(key, value);
  }

  @override
  bool getBool({required String key}) {
    return hiveBox.get(key);
  }
}
