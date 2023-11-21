import 'package:ebook_app/domain/data/idelete_favorite_book.dart';
import 'package:ebook_app/domain/data/iget_books_data.dart';
import 'package:ebook_app/domain/data/ipost_favorite_book.dart';
import 'package:ebook_app/domain/entities/book_entity.dart';
import 'package:ebook_app/presentation/controllers/favorite_controller/ifavorite_controller.dart';
import 'package:flutter/foundation.dart';

class FavoriteController implements IFavoriteController {
  final IGetBooksData _getBooksData;
  final IDeleteFavoriteBook _deleteFavoriteBook;
  final IPostFavoriteBook _postFavoriteBook;

  FavoriteController({
    required IGetBooksData getBooksData,
    required IDeleteFavoriteBook deleteFavoriteBook,
    required IPostFavoriteBook postFavoriteBook,
  })  : _getBooksData = getBooksData,
        _deleteFavoriteBook = deleteFavoriteBook,
        _postFavoriteBook = postFavoriteBook;

  ValueNotifier<List<BookEntity>> books = ValueNotifier([]);

  @override
  Future<void> getAllFavorites() async {
    final booksData = await _getBooksData.getBooks();
    books.value = booksData;
  }

  @override
  Future<void> toggleFavorite(BookEntity book) async {
    if (books.value.any((b) => b.id == book.id)) {
      await removeFavorite(book.id);
    } else {
      await addFavorite(book);
    }
  }

  @visibleForTesting
  Future<void> addFavorite(BookEntity book) async {
    await _postFavoriteBook.saveBook(book);
    books.value = [...books.value, book.copyWith(isFavorited: true)];
  }

  @visibleForTesting
  Future<void> removeFavorite(int id) async {
    await _deleteFavoriteBook.deleteBook(id);
    books.value = books.value.where((book) => book.id != id).toList();
  }
}
