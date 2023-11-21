import 'package:ebook_app/domain/entities/book_entity.dart';

abstract interface class IFavoriteController {
  Future<void> getAllFavorites();
  Future<void> toggleFavorite(BookEntity book);
}
