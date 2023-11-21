import 'package:ebook_app/domain/entities/book_entity.dart';

abstract interface class IPostFavoriteBookData {
  Future<void> saveBook(BookEntity book);
}
