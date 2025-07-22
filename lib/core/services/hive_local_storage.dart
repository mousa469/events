import 'dart:developer';

import 'package:events/core/services/local_storage.dart';
import 'package:events/features/layout/create_event/data/models/event.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveLocalStorage extends LocalStorage {
  static late Box hiveBox;

  static Future<void> hiveConfig() async {
    await Hive.initFlutter();

    Hive.registerAdapter(EventAdapter());

    hiveBox = await Hive.openBox('EventsBox');
  }

  @override
  void setBool({required bool value, required String key}) async {
    await hiveBox.put(key, value);
  }

  @override
  bool getBool({required String key}) {
    return hiveBox.get(key);
  }

  Future<void> setValueInList<T>({
    required String key,
    required T value,
  }) async {
    try {
      List<T> oldList = await getList<T>(key: key);
      if (!oldList.contains(value)) {
        oldList.add(value);
      }
      await hiveBox.put(key, oldList);
    } catch (e) {
      log(
        "exception caught in the setValueInList from   HiveLocalStorage and the message is : ${e.toString()}",
      );
    }
  }

  Future<List<T>> getList<T>({required String key}) async {
    return await (hiveBox.get(key) as List?)?.cast<T>() ?? <T>[];
  }

  static Future<void> clearAllValues() async {
    await hiveBox.clear();
  }

  static Future<void> clearSpecficValues({required String key}) async {
    await hiveBox.delete(key);
  }

  @override
  Future<void> setList<T>({required String key, required List<T> value}) async {
    await hiveBox.put(key, value);
  }

  @override
  Future<String> getString({required String key}) async {
  return  await hiveBox.get(key);
  }

  @override
  Future<void> setString({required String key, required String value}) async {
    await hiveBox.put(key, value);
  }
}
