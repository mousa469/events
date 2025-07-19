import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/core/errors/firebase%20firestore%20errors/firebase_firestore_exception_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/database_services.dart';

class FirestoreServices extends DatabaseServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addRecord({
    required String path,
    String? id,
    required Map<String, dynamic> data,
    String? subCollectionPath,
    String? subCollectionID,
  }) async {
    try {
      if (subCollectionPath != null && subCollectionID != null) {
        await firebaseFirestore
            .collection(path)
            .doc(id)
            .collection(subCollectionPath)
            .doc(subCollectionID)
            .set(data);
      } else {
        if (id != null) {
          await firebaseFirestore.collection(path).doc(id).set(data);
        } else {
          await firebaseFirestore.collection(path).add(data);
        }
      }
    } on FirebaseException catch (e) {
      log(
        "firebase exception come from FirestoreServices.addRecord and its message is : ${e.toString()}",
      );
      CustomFirebaseFirestoreException.handle(e);
      rethrow;
    } catch (e) {
      log(
        "general exception come from FirestoreServices.addRecord and its message is : ${e.toString()}",
      );
      throw UnExpectedException();
    }
  }

  Future<bool> checkIfTheRecordExistedBefore({
    required String path,
    required String? id,
    String? subCollectionPath,
    String? subCollectionID,
  }) async {
    try {
      if (subCollectionPath != null && subCollectionID != null) {
        var record = await firebaseFirestore
            .collection(path)
            .doc(id)
            .collection(subCollectionPath)
            .doc(subCollectionID)
            .get();

        return record.exists;
      } else {
        var record = await firebaseFirestore.collection(path).doc(id).get();
        return record.exists;
      }
    } on FirebaseException catch (e) {
      log(
        "firebase exception come from FirestoreServices.checkIfTheRecordExistedBefore and its message is : ${e.toString()}",
      );
      CustomFirebaseFirestoreException.handle(e);
      rethrow;
    } catch (e) {
      log(
        "general exception come from FirestoreServices.checkIfTheRecordExistedBefore and its message is : ${e.toString()}",
      );
      throw UnExpectedException();
    }
  }

  Future<Map<String, dynamic>> fetchRecord({
    required String path,
    required String id,
    String? subCollectionPath,
    String? subCollectionID,
  }) async {
    try {
      if (subCollectionPath != null && subCollectionID != null) {
        var record = await firebaseFirestore
            .collection(path)
            .doc(id)
            .collection(subCollectionPath)
            .doc(subCollectionID)
            .get();

        return record.data()!;
      } else {
        var record = await firebaseFirestore.collection(path).doc(id).get();
        return record.data()!;
      }
    } on FirebaseException catch (e) {
      log(
        "firebase exception come from FirestoreServices.fetchRecord and its message is : ${e.toString()}",
      );
      CustomFirebaseFirestoreException.handle(e);
      rethrow;
    } catch (e) {
      log(
        "general exception come from FirestoreServices.fetchRecord and its message is : ${e.toString()}",
      );
      throw UnExpectedException();
    }
  }

  Future<List<Map<String, dynamic>>> fetchGroupOfRecords({
    required String path,
    required String id,
    String? subCollectionPath,
  }) async {
    try {
      if (subCollectionPath == null) {
        var records = await firebaseFirestore
            .collection(path)
            .get()
            .then((value) => value.docs.map((e) => e.data()).toList());

        return records;
      } else {
        var records = await firebaseFirestore
            .collection(path)
            .doc(id)
            .collection(subCollectionPath)
            .get()
            .then((value) => value.docs.map((e) => e.data()).toList());
        return records;
      }
    } on FirebaseException catch (e) {
      log(
        "firebase exception come from FirestoreServices.fetchGroupOfRecords and its message is : ${e.toString()}",
      );
      CustomFirebaseFirestoreException.handle(e);
      rethrow;
    } catch (e) {
      log(
        "general exception come from FirestoreServices.fetchGroupOfRecords and its message is : ${e.toString()}",
      );
      throw UnExpectedException();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchGroupOfRecordsSorted({
    required String path,
    required String id,
    required String sortBy,
    String? subCollectionPath,
    required bool isDescending,
  }) async {
    try {
      if (subCollectionPath == null) {
        Query<Map<String, dynamic>> query = firebaseFirestore
            .collection(path)
            .orderBy(sortBy, descending: isDescending);

        var records = await query.get().then(
          (value) => value.docs.map((e) => e.data()).toList(),
        );

        return records;
      } else {
        Query<Map<String, dynamic>> query = firebaseFirestore
            .collection(path)
            .doc(id)
            .collection(subCollectionPath)
            .orderBy(sortBy, descending: isDescending);

        var records = await query.get().then(
          (value) => value.docs.map((e) => e.data()).toList(),
        );

        return records;
      }
    } on FirebaseException catch (e) {
      log("firebase exception from fetchGroupOfRecordsSorted: ${e.toString()}");
      CustomFirebaseFirestoreException.handle(e);
      rethrow;
    } catch (e) {
      log("general exception from fetchGroupOfRecordsSorted: ${e.toString()}");
      throw UnExpectedException();
    }
  }

  @override
  Future<void> updateRecord({
    required String path,
    String? id,
    required Map<String,dynamic> data,
    String? subCollectionPath,
    String? subCollectionID,
  }) async {
    try {
      if (subCollectionPath == null && subCollectionID == null) {
        await firebaseFirestore.collection(path).doc(id).update(data);
      } else {
        await firebaseFirestore
            .collection(path)
            .doc(id)
            .collection(subCollectionPath!)
            .doc(subCollectionID)
            .update(data);
      }
    } on FirebaseException catch (e) {
      log("firebase exception from fetchGroupOfRecordsSorted: ${e.toString()}");
      CustomFirebaseFirestoreException.handle(e);
      rethrow;
    } catch (e) {
      log("general exception from fetchGroupOfRecordsSorted: ${e.toString()}");
      throw UnExpectedException();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchGroupOfDataEqualTo({
    required String path,
    required String id,
    String? subCollectionPath,
    required String key,
    dynamic isEqualTo,
  }) async {
    try {
      if (subCollectionPath == null) {
        var records = await firebaseFirestore
            .collection(path)
            .where(key, isEqualTo: isEqualTo)
            .get()
            .then((value) => value.docs.map((e) => e.data()).toList());

        return records;
      } else {
        var records = await firebaseFirestore
            .collection(path)
            .doc(id)
            .collection(subCollectionPath)
            .where(key, isEqualTo: isEqualTo)
            .get()
            .then((value) => value.docs.map((e) => e.data()).toList());
        return records;
      }
    } on FirebaseException catch (e) {
      log("firebase exception from fetchGroupOfRecordsSorted: ${e.toString()}");
      CustomFirebaseFirestoreException.handle(e);
      rethrow;
    } catch (e) {
      log("general exception from fetchGroupOfRecordsSorted: ${e.toString()}");
      throw UnExpectedException();
    }
  }
}
