import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ebook_app/domain/data/idownload_file_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DioDownloaderRepository implements IDownloadFileData {
  Dio dio = Dio();

  @override
  Future<File> downloadFile(String url, String fileName) async {
    final hasPermission = await _getPermission();

    if (!hasPermission) {
      throw Exception('Permissão Negada');
    }

    final appDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    String path = '${appDirectory!.path}/$fileName.epub';
    File file = File(path);

    if (!File(path).existsSync()) {
      await file.create();
      await dio.download(url, path, deleteOnError: true);
    }

    return file;
  }

  Future<bool> _getPermission() async {
    final status = await Permission.manageExternalStorage.request();

    return status.isGranted;
  }
}
