import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_consciousness/src/models/collection.dart';

class DataProvider {
//  Future<LoginResponse> login(LoginRequest loginRequest) async {
//    final response = await ObjectFactory()
//        .apiClient
//        .loginApi(loginRequestToJson(loginRequest));
//    print(response);
//
//    if (response.statusCode == 200 || response.statusCode == 404) {
//      return LoginResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }

  getMyCollectionList() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return await Firestore.instance
        .collection('collections')
        .where('created_by', isEqualTo: user.email)
        .snapshots();
  }

  addCollection(Collection collection) async {
    return Firestore.instance
        .collection('collections')
        .add(collection.toJson());
  }

  addBookmark(String document_id, Datum data) {
    return Firestore.instance
        .collection('collections')
        .document(document_id)
        .collection('data')
        .add(data.toJson());
  }

  getSharedCollectionList() async {
    return await Firestore.instance.collection('collections').snapshots();
  }
}
