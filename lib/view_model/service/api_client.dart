import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:phonecare/view_model/service/api_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static final dio =
      Dio(
          BaseOptions(
            baseUrl: ApiConfig.baseUrl,
            headers: {'Content-Type': 'application/json'},
            validateStatus: (status) =>
                status != null && (status == 200 || status == 201),
          ),
        )
        ..interceptors.addAll([
          PrettyDioLogger(
            requestHeader: true, // Show request headers
            requestBody: true, // Show request body
            responseBody: true, // Show response body
            responseHeader: false, // Optional: hide response headers
            compact: true,
          ),
          InterceptorsWrapper(
            onRequest: (options, handler) {
              final box = Hive.box('authBox');
              final token = box.get('accessToken');
              if (token != null) {
                options.headers['Authorization'] = 'Bearer $token';
              }
              handler.next(options);
            },
            onError: (e, handler) {
              final serverMessage = e.response?.data['message'] ?? e.message;
              handler.reject(
                DioException(
                  requestOptions: e.requestOptions,
                  response: e.response,
                  error: serverMessage,
                  type: e.type,
                ),
              );
            },
          ),
        ]);
}
