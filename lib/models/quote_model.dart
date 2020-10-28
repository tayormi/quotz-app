// To parse this JSON data, do
//
//     final quoteModel = quoteModelFromJson(jsonString);

import 'dart:convert';

List<QuoteModel> quoteModelFromJson(List<dynamic> str) =>
    List<QuoteModel>.from(str.map((x) => QuoteModel.fromJson(x)));

String quoteModelToJson(List<QuoteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuoteModel {
  QuoteModel({
    this.id,
    this.createdAt,
    this.quote,
    this.author,
  });

  int id;
  int createdAt;
  String quote;
  String author;

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        quote: json["quote"] == null ? null : json["quote"],
        author: json["author"] == null ? null : json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt,
        "quote": quote == null ? null : quote,
        "author": author == null ? null : author,
      };
}
