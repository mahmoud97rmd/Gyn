// Path: lib/core/network/interceptors/retry_interceptor.dart
import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Random _random = Random();

  RetryInterceptor(this.dio, {this.maxRetries = 3});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final extra = err.requestOptions.extra;
    final retries = extra['retries'] ?? 0;

    if (_shouldRetry(err) && retries < maxRetries) {
      extra['retries'] = retries + 1;

      final backoff = Duration(
          milliseconds: pow(2, retries).toInt() * 1000 + _random.nextInt(1000));
      await Future.delayed(backoff);

      try {
        final response = await dio.request(
          err.requestOptions.path,
          cancelToken: err.requestOptions.cancelToken,
          data: err.requestOptions.data,
          onReceiveProgress: err.requestOptions.onReceiveProgress,
          onSendProgress: err.requestOptions.onSendProgress,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
            extra: err.requestOptions.extra,
            responseType: err.requestOptions.responseType,
            contentType: err.requestOptions.contentType,
            validateStatus: err.requestOptions.validateStatus,
            receiveDataWhenStatusError:
                err.requestOptions.receiveDataWhenStatusError,
            followRedirects: err.requestOptions.followRedirects,
            maxRedirects: err.requestOptions.maxRedirects,
            requestEncoder: err.requestOptions.requestEncoder,
            responseDecoder: err.requestOptions.responseDecoder,
            listFormat: err.requestOptions.listFormat,
          ),
        );
        return handler.resolve(response);
      } catch (e) {
        if (e is DioException) {
          return handler.next(e);
        }
      }
    }
    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError) {
      return true;
    }
    if (err.response != null) {
      final statusCode = err.response!.statusCode;
      if (statusCode == 429 ||
          statusCode == 500 ||
          statusCode == 502 ||
          statusCode == 503 ||
          statusCode == 504) {
        return true;
      }
    }
    return false;
  }
}
