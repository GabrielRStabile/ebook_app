import 'package:ebook_app/presentation/controllers/favorite_controller/favorite_controller.dart';
import 'package:ebook_app/presentation/controllers/home_controller/home_controller.dart';
import 'package:ebook_app/presentation/pages/shared/bookshelf_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();
  final favoriteController = Modular.get<FavoriteController>();

  @override
  void initState() {
    super.initState();

    favoriteController.getAllFavorites();
    homeController.fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: homeController.books,
            builder: (context, book, _) {
              if (book.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
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
