import 'package:ebook_app/domain/entities/book_entity.dart';

abstract interface class IGetBooksData {
  Future<List<BookEntity>> getBooks();
}
