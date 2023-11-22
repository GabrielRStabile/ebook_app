import 'package:ebook_app/domain/data/iview_epub_data.dart';
import 'package:ebook_app/presentation/app_theme.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

class VocsyEpubViewerRepository implements IViewEpubData {
  @override
  Future<void> openBook(String path) async {
    VocsyEpub.setConfig(
      themeColor: const AppTheme().primaryColor,
      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
      allowSharing: true,
      enableTts: true,
    );

    VocsyEpub.open(path);
  }
}
