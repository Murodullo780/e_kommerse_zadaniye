import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'https://www.themealdb.com/api/json/v1/1/';
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options:
            Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      print('Dio error: $e');
      rethrow;
    } catch (e) {
      print('Xatolik: $e');
      rethrow;
    }
  }
}
