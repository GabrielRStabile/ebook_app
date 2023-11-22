import 'package:ebook_app/domain/data/idownload_file_data.dart';
import 'package:ebook_app/domain/data/iview_epub_data.dart';
import 'package:ebook_app/infra/repositories/dio_downloader_repository.dart';
import 'package:ebook_app/infra/repositories/vocsy_epub_viewer_repository.dart';
import 'package:ebook_app/presentation/controllers/epub_controller/epub_controller.dart';
import 'package:ebook_app/presentation/pages/shared/app_scaffold.dart';
import 'package:ebook_app/presentation/routes/favorite_module.dart';
import 'package:ebook_app/presentation/routes/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    //Repositories
    i.add<IDownloadFileData>(DioDownloaderRepository.new);
    i.add<IViewEpubData>(VocsyEpubViewerRepository.new);

    //Controllers
    i.addSingleton<EpubController>(EpubController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const AppScaffold(),
      children: [
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/favorite', module: FavoriteModule()),
      ],
    );
  }
}
