import 'package:ebook_app/domain/data/idownload_file_data.dart';
import 'package:ebook_app/domain/data/iview_epub_data.dart';
import 'package:ebook_app/domain/entities/book_entity.dart';
import 'package:ebook_app/presentation/controllers/epub_controller/iepub_controller.dart';

class EpubController implements IEpubController {
  final IDownloadFileData _downloadFile;
  final IViewEpubData _viewEpub;

  EpubController({
    required IDownloadFileData downloadFile,
    required IViewEpubData viewEpub,
  })  : _downloadFile = downloadFile,
        _viewEpub = viewEpub;

  @override
  Future<void> openBook(BookEntity book) async {
    final file = await _downloadFile.downloadFile(book.downloadUrl, book.title);
    await _viewEpub.openBook(file.path);
  }
}
