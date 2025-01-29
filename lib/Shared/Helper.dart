import 'package:dio/dio.dart';
import 'package:quran_app/Shared/ApiConst.dart';

class ApiHelper {
  // Singleton pattern
  ApiHelper._();
  static ApiHelper instance = ApiHelper._();

  // Dio
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: Apiconst.BaseUrl,
  ));

  Future<Response> PostData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, String>? Quiryparams,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
        queryParameters: Quiryparams,
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  Future<Response> GetData({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? Quiryparams,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: Quiryparams,
        options: Options(
          headers: headers,
          // queryParameters: Quiryparams,
        ),
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }
}
