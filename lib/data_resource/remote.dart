import 'package:dio/dio.dart';

class Apiprovider {
  final _dio = Dio();

  Future<dynamic> getData(int page) {
    final response = _dio.get(
        'https://dummyjson.com/products/?limit=10&skip=${page == 1 ? 0 : page * 10}');
    return response;
  }
}
