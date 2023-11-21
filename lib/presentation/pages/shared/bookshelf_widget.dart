import 'package:ebook_app/domain/entities/book_entity.dart';
import 'package:ebook_app/presentation/pages/shared/book_widget.dart';
import 'package:flutter/material.dart';

class BookshelfWidget extends StatelessWidget {
  final List<BookEntity> books;

  const BookshelfWidget({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: books.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.55,
      ),
      itemBuilder: (context, index) => BookWidget(
        book: books[index],
      ),
    );
  }
}
