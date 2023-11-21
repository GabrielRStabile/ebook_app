import 'package:ebook_app/domain/data/iget_books_data.dart';
import 'package:ebook_app/infra/providers/escribo_books_provider.dart';
import 'package:ebook_app/presentation/controllers/home_controller/home_controller.dart';
import 'package:ebook_app/presentation/pages/home_page/home_page.dart';
import 'package:ebook_app/presentation/routes/favorite_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    //Providers
    i.add<IGetBooksData>(EscriboBooksProvider.new);

    //Controllers
    i.addSingleton<HomeController>(HomeController.new);
  }

  @override
  List<Module> get imports => [FavoriteModule()];

  @override
  void routes(r) {
    r.child('/', child: (_) => const HomePage());
  }
}
