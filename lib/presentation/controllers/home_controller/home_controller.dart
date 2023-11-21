import 'package:ebook_app/domain/data/iget_books_data.dart';
import 'package:ebook_app/domain/entities/book_entity.dart';
import 'package:ebook_app/presentation/controllers/home_controller/ihome_controller.dart';
import 'package:flutter/foundation.dart';

class HomeController implements IHomeController {
  HomeController({
    required IGetBooksData getBooksData,
  }) : _getBooksData = getBooksData;

  final IGetBooksData _getBooksData;

  ValueNotifier<List<BookEntity>> books = ValueNotifier([]);
  ValueNotifier<List<BookEntity>> filteredBooks = ValueNotifier([]);

  @override
  Future<void> fetchBooks() async {
    final booksData = await _getBooksData.getBooks();
    books.value = booksData;
  }
}
