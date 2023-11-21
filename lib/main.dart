import 'package:ebook_app/infra/repositories/hive_favorite_book_repository.dart';
import 'package:ebook_app/presentation/app_theme.dart';
import 'package:ebook_app/presentation/routes/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();

  runApp(const EBookApp());
}

class EBookApp extends StatefulWidget {
  const EBookApp({super.key});

  @override
  State<EBookApp> createState() => _EBookAppState();
}

class _EBookAppState extends State<EBookApp> {
  @override
  void initState() {
    super.initState();
    HiveFavoriteBookRepository.registerAdapter();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');

    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        title: 'eBook',
        theme: const AppTheme().toThemeData(),
        routerConfig: Modular.routerConfig,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
