import 'package:dio/dio.dart';
import 'package:ebook_app/domain/data/iget_books_data.dart';
import 'package:ebook_app/domain/entities/book_entity.dart';
import 'package:ebook_app/infra/bases/escribo_base_api.dart';
import 'package:ebook_app/infra/models/escribo_book_model.dart';

class EscriboBooksProvider implements IGetBooksData {
  Dio api = Dio(EscriboBaseApi());

  @override
  Future<List<BookEntity>> getBooks() async {
    final response = await api.get('');
    final books = response.data as List;

    return books
        .map((book) => EscriboBookModel.fromMap(book).toEntity())
        .toList();
  }
}
