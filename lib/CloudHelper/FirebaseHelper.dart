import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/AuthorModel.dart';

class AuthHelper {
  static AuthHelper instance = AuthHelper();
  CollectionReference author = FirebaseFirestore.instance.collection('Author');

  insertData(Author authorData) async {
    return author
        .add(authorData.toMap())
        .then((value) => print("Author Added.."))
        .catchError((error) => print("Failed to add Author: $error"));
  }

  updateData({required int index, required Author authorData}) async {
    var docSnap = await author.get();
    var doc_id = docSnap.docs;
    return author
        .doc(doc_id[index].id)
        .update(authorData.toMap())
        .then((value) => print("note Updated.."))
        .catchError((error) => print("Failed to update note: $error"));
  }

  deleteData({required int index}) async {
    var docSnap = await author.get();
    var doc_id = docSnap.docs;
    return author
        .doc(doc_id[index].id)
        .delete()
        .then((value) => print("author Deleted.."))
        .catchError((error) => print("Failed to delete author: $error"));
  }
}
