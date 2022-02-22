import 'dart:convert';

IdModel idModelFromJson(String str) => IdModel.fromJson(json.decode(str));

String idModelToJson(IdModel data) => json.encode(data.toJson());

class IdModel {
  IdModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory IdModel.fromJson(Map<String, dynamic> json) => IdModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
