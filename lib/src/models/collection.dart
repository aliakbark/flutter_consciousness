// To parse this JSON data, do
//
//     final collection = collectionFromJson(jsonString);

import 'dart:convert';

Collection collectionFromJson(String str) =>
    Collection.fromJson(json.decode(str));

String collectionToJson(Collection data) => json.encode(data.toJson());

class Collection {
  String collectionName;
  String description;
  DateTime createdOn;
  String createdBy;
  List<String> collaborators;

  Collection({
    this.collectionName,
    this.description,
    this.createdOn,
    this.createdBy,
    this.collaborators,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => new Collection(
        collectionName: json["collection_name"],
        description: json["description"],
        createdOn: json["created_on"],
        createdBy: json["created_by"],
        collaborators:
            new List<String>.from(json["collaborators"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "collection_name": collectionName,
        "description": description,
        "created_on": createdOn,
        "created_by": createdBy,
        "collaborators": new List<dynamic>.from(collaborators.map((x) => x)),
      };
}

class Datum {
  String data;
  String dataType;
  String createdBy;
  DateTime createdOn;

  Datum({
    this.data,
    this.dataType,
    this.createdBy,
    this.createdOn,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
        data: json["data"],
        dataType: json["data_type"],
        createdBy: json["created_by"],
        createdOn: json["created_on"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "data_type": dataType,
        "created_by": createdBy,
        "created_on": createdOn,
      };
}
