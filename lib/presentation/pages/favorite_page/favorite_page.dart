import 'package:ebook_app/presentation/controllers/favorite_controller/favorite_controller.dart';
import 'package:ebook_app/presentation/pages/shared/bookshelf_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final favoriteController = Modular.get<FavoriteController>();

  @override
  void initState() {
    super.initState();

    favoriteController.getAllFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: favoriteController.books,
            builder: (context, book, _) {
              if (book.isEmpty) {
                return const Center(
                  child: Text('Você não tem livros favoritos :('),
                );
              }
              return Expanded(
                child: BookshelfWidget(books: book),
              );
            },
          ),
        ],
      ),
    );
  }
}
