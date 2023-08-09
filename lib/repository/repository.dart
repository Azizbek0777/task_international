import 'package:dio/dio.dart';

class Repository {
  final Dio _dio = Dio()..interceptors.add(LogInterceptor(responseBody: true, requestBody: true, requestHeader: true));
  final String _url = 'https://www.jsonkeeper.com/b';

  Future<Response?> getColors() async {
    try {
      Response response = await _dio.get("$_url/N5M6");
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future<Response?> getDate() async {
    try {
      Response response = await _dio.get("$_url/ADYD");
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
