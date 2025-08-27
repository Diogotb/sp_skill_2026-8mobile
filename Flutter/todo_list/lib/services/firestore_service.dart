import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final _firestoreService = FirebaseFirestore.instance;

  DocumentReference getDocumentReference(String path) {
    return  _firestoreService.doc(path);
  }

  Future<DocumentReference> addDocument(String collection, Map<String, dynamic> data)  {
    return _firestoreService.collection(collection).add(data);
  }

  void updateDocument(String path, Map<String, dynamic> data) {
     _firestoreService.doc(path).update(data).then((value) => log("[FIRESTORE SERVICE] Document updated"),);
  }

  void deleteDocument(String path)  {
     _firestoreService.doc(path).delete();
  }
}