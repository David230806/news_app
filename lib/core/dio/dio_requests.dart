import 'package:dio/dio.dart';
import 'package:news_app/core/configs/base_urls.dart';

class DioRequests {
  final _dio = Dio();

  Future<Response<dynamic>> get({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final res = _dio.get("${BaseUrls.baseUrl}$path?api-key=${BaseUrls.apiKey}",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        queryParameters: query);

    return res;
  }

  Future<Response<dynamic>> post({
    required String path,
    required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? contentType,
    FormData? formData,
  }) async {
    assert(formData == null || data == null);

    final res = _dio.post("${BaseUrls.baseUrl}$path?api-key=${BaseUrls.apiKey}",
        data: formData ?? data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        queryParameters: query);
    return res;
  }

  Future<Response<dynamic>> patch(
      {required String path,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query}) async {
    final res = _dio.patch("${BaseUrls.baseUrl}$path?api-key=${BaseUrls.apiKey}",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        queryParameters: query);
    return res;
  }

  Future<Response<dynamic>> delete(
      {required String path, Map<String, dynamic>? data, Map<String, dynamic>? query}) async {
    final res = _dio.delete("${BaseUrls.baseUrl}$path?api-key=${BaseUrls.apiKey}",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        queryParameters: query);

    return res;
  }

  Future<Response<dynamic>> put(
      {required String path,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query}) async {
    final res = _dio.put(
      "${BaseUrls.baseUrl}$path?api-key=${BaseUrls.apiKey}",
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      queryParameters: query,
    );

    return res;
  }
}
