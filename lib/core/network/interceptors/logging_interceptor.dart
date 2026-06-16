// Path: lib/core/network/interceptors/logging_interceptor.dart
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class CustomLoggingInterceptor extends Interceptor {
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final authHeader = options.headers['Authorization'] as String?;
    String redactedAuth = '';
    if (authHeader != null && authHeader.length > 15) {
      redactedAuth = '${authHeader.substring(0, 15)}...';
    }

    _logger.d(
        'REQ [${options.method}] ${options.uri}\nAuth: $redactedAuth\nData: ${_truncate(options.data?.toString())}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
        'RES [${response.statusCode}] ${response.requestOptions.uri}\nData: ${_truncate(response.data?.toString())}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
        'ERR [${err.response?.statusCode}] ${err.requestOptions.uri}\nMessage: ${err.message}\nData: ${_truncate(err.response?.data?.toString())}');
    handler.next(err);
  }

  String? _truncate(String? input) {
    if (input == null) return null;
    if (input.length > 500) {
      return '${input.substring(0, 500)}... (truncated)';
    }
    return input;
  }
}
