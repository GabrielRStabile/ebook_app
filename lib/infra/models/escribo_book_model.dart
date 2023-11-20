import 'dart:convert';

import 'package:ebook_app/domain/entities/book_entity.dart';

class EscriboBookModel {
  final int? id;
  final String? title;
  final String? author;
  final String? coverUrl;
  final String? downloadUrl;

  EscriboBookModel({
    this.id,
    this.title,
    this.author,
    this.coverUrl,
    this.downloadUrl,
  });

  factory EscriboBookModel.fromJson(String str) =>
      EscriboBookModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EscriboBookModel.fromMap(Map<String, dynamic> json) =>
      EscriboBookModel(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        coverUrl: json["cover_url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "author": author,
        "cover_url": coverUrl,
        "download_url": downloadUrl,
      };

  BookEntity toEntity() => BookEntity(
        id: id ?? 0,
        title: title ?? '',
        author: author ?? '',
        coverUrl: coverUrl ?? '',
        downloadUrl: downloadUrl ?? '',
      );
}
