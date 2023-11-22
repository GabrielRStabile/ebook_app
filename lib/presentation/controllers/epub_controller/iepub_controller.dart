import 'package:ebook_app/domain/entities/book_entity.dart';

abstract interface class IEpubController {
  Future<void> openBook(BookEntity book);
}
