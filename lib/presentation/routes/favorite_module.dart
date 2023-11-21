import 'package:ebook_app/domain/data/idelete_favorite_book.dart';
import 'package:ebook_app/domain/data/iget_books_data.dart';
import 'package:ebook_app/domain/data/ipost_favorite_book.dart';
import 'package:ebook_app/infra/repositories/hive_favorite_book_repository.dart';
import 'package:ebook_app/presentation/controllers/favorite_controller/favorite_controller.dart';
import 'package:ebook_app/presentation/pages/favorite_page/favorite_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FavoriteModule extends Module {
  @override
  void binds(i) {
    //Repositories
    i.add<IGetBooksData>(HiveFavoriteBookRepository.new);
    i.add<IPostFavoriteBook>(HiveFavoriteBookRepository.new);
    i.add<IDeleteFavoriteBook>(HiveFavoriteBookRepository.new);
  }

  @override
  void exportedBinds(i) {
    i.addSingleton<FavoriteController>(FavoriteController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const FavoritePage());
  }
}
