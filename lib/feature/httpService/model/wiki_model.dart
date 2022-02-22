// To parse this JSON data, do
//
//     final wikiModel = wikiModelFromJson(jsonString);

import 'dart:convert';

WikiModel wikiModelFromJson(String str) => WikiModel.fromJson(json.decode(str));

String wikiModelToJson(WikiModel data) => json.encode(data.toJson());

class WikiModel {
  WikiModel({
    this.items,
  });

  List<Item>? items;

  factory WikiModel.fromJson(Map<String, dynamic> json) => WikiModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items?.map((x) => x.toJson()) ?? {}),
      };
}

class Item {
  Item({
    this.project,
    this.article,
    this.granularity,
    this.timestamp,
    this.access,
    this.agent,
    this.views,
  });

  String? project;
  String? article;
  String? granularity;
  String? timestamp;
  String? access;
  String? agent;
  int? views;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        project: json["project"],
        article: json["article"],
        granularity: json["granularity"],
        timestamp: json["timestamp"],
        access: json["access"],
        agent: json["agent"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "project": project,
        "article": article,
        "granularity": granularity,
        "timestamp": timestamp,
        "access": access,
        "agent": agent,
        "views": views,
      };
}
