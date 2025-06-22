abstract class DatabaseServices {
  void addRecord({
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
    required String,
    String? subCollectionPath,
    String? subCollectionID,
  });

  Future<List<Map<String, dynamic>>> fetchGroupOfRecords({
    required String path,
    required String id,
    String? subCollectionPath,
  });
}
