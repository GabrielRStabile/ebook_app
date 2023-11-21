import 'package:ebook_app/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

part 'hive_favorite_book_model.g.dart';

@HiveType(typeId: 0)
class HiveFavoriteBookModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String author;

  @HiveField(3)
  String coverUrl;

  @HiveField(4)
  String downloadUrl;

  HiveFavoriteBookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.downloadUrl,
  });

  BookEntity toEntity() => BookEntity(
        id: id,
        title: title,
        author: author,
        coverUrl: coverUrl,
        downloadUrl: downloadUrl,
      );
}
