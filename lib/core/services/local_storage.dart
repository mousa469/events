abstract class LocalStorage {
  void setBool({required bool value, required String key});
  bool? getBool({required String key});
  Future<void> setValueInList<T>({required String key, required T value});
  Future<List<T>> getList<T>({required String key});
  Future<void> setList<T>({required String key , required List<T> value});
}
