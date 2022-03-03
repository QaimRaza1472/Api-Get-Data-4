// To parse this JSON data, do
//
//     final albumModel = albumModelFromJson(jsonString);

import 'dart:convert';

List<AlbumModel> albumModelFromJson(String str) => List<AlbumModel>.from(json.decode(str).map((x) => AlbumModel.fromJson(x)));

String albumModelToJson(List<AlbumModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumModel {
  AlbumModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String? body;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
