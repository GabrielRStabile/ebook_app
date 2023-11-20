import 'package:dio/dio.dart';

class EscriboBaseApi extends BaseOptions {
  @override
  String get baseUrl => 'https://escribo.com/books.json';
}
