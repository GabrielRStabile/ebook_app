import 'dart:io';

abstract interface class IDownloadFileData {
  Future<File> downloadFile(String url, String fileName);
}
