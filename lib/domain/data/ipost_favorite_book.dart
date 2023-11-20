import 'package:ebook_app/domain/entities/book_entity.dart';

abstract interface class IPostFavoriteBook {
  Future<void> saveBook(BookEntity book);
}
