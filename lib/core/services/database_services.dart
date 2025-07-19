abstract class DatabaseServices {
  Future<void> addRecord({
    required String path,
    String? id,
    required Map<String, dynamic> data,
    String? subCollectionPath,
    String? subCollectionID,
  });

  Future<bool> checkIfTheRecordExistedBefore({
    required String path,
    required String? id,
    String? subCollectionPath,
    String? subCollectionID,
  });

  Future<Map<String, dynamic>> fetchRecord({
    required String path,
    required String id,
    String? subCollectionPath,
    String? subCollectionID,
  });

  Future<List<Map<String, dynamic>>> fetchGroupOfRecords({
    required String path,
    required String id,
    String? subCollectionPath,
  });

  Future<List<Map<String, dynamic>>> fetchGroupOfRecordsSorted({
    required String path,
    required String id,
    String? subCollectionPath,
    required String sortBy,
    required bool isDescending,
  });

  Future<void> updateRecord({
    required String path,
    String? id,
    required Map<String,dynamic> data,
    String? subCollectionPath,
    String? subCollectionID,
  });

  Future<List<Map<String, dynamic>>> fetchGroupOfDataEqualTo({
    required String path,
    required String id,
    String? subCollectionPath,
    required String key,
    dynamic isEqualTo,
  });
}
