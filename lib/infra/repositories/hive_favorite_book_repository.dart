import 'package:ebook_app/domain/data/idelete_favorite_book.dart';
import 'package:ebook_app/domain/data/iget_books_data.dart';
import 'package:ebook_app/domain/data/ipost_favorite_book.dart';
import 'package:ebook_app/domain/entities/book_entity.dart';
import 'package:ebook_app/infra/models/hive_favorite_book_model.dart';
import 'package:hive/hive.dart';

class HiveFavoriteBookRepository
    implements IGetBooksData, IDeleteFavoriteBook, IPostFavoriteBook {
  static const boxName = 'favorites';

  static void registerAdapter() {
    Hive.registerAdapter(HiveFavoriteBookModelAdapter());
  }

  @override
  Future<void> deleteBook(int id) async {
    final favoriteBox = await Hive.openBox<HiveFavoriteBookModel>(boxName);

    await favoriteBox.delete(id);
  }

  @override
  Future<List<BookEntity>> getBooks() async {
    final favoriteBox = await Hive.openBox<HiveFavoriteBookModel>(boxName);

    final books = favoriteBox.values.map((e) => e.toEntity()).toList();

    return books;
  }

  @override
  Future<void> saveBook(BookEntity book) async {
    final favoriteBox = await Hive.openBox<HiveFavoriteBookModel>(boxName);

    final hiveBook = HiveFavoriteBookModel(
      id: book.id,
      title: book.title,
      author: book.author,
      coverUrl: book.coverUrl,
      downloadUrl: book.downloadUrl,
    );

    await favoriteBox.put(book.id, hiveBook);
  }
}
