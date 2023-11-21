import 'package:ebook_app/presentation/routes/favorite_module.dart';
import 'package:ebook_app/presentation/routes/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(
      '/home',
      module: HomeModule(),
    );
    r.module(
      '/favorite',
      module: FavoriteModule(),
    );
  }
}
