// Path: lib/core/network/client/dio_client.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api_constants.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/error_interceptor.dart';
import '../interceptors/logging_interceptor.dart';
import '../interceptors/retry_interceptor.dart';
import '../../security/credential_storage.dart';

Dio createDioClient(Ref ref, {bool isStreaming = false}) {
  final isLive = ref.watch(isLiveAccountProvider);
  final baseUrl = isStreaming
      ? (isLive ? ApiConstants.liveStreamUrl : ApiConstants.practiceStreamUrl)
      : (isLive ? ApiConstants.liveBaseUrl : ApiConstants.practiceBaseUrl);

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: isStreaming
        ? null
        : const Duration(milliseconds: ApiConstants.connectTimeoutMs),
    receiveTimeout: isStreaming
        ? null
        : const Duration(milliseconds: ApiConstants.receiveTimeoutMs),
    sendTimeout: isStreaming
        ? null
        : const Duration(milliseconds: ApiConstants.sendTimeoutMs),
    responseType: isStreaming ? ResponseType.stream : ResponseType.json,
    headers: {
      ApiConstants.acceptDatetimeFormatHeader: ApiConstants.datetimeFormatUnix,
    },
  );

  final dio = Dio(options);

  final authInterceptor = AuthInterceptor(ref.read(credentialStorageProvider));
  final retryInterceptor = RetryInterceptor(dio);
  final errorInterceptor = ErrorInterceptor();
  final loggingInterceptor = CustomLoggingInterceptor();

  dio.interceptors.addAll([
    authInterceptor,
    if (!isStreaming) retryInterceptor,
    errorInterceptor,
    loggingInterceptor,
  ]);

  return dio;
}

final dioClientProvider = Provider<Dio>((ref) {
  return createDioClient(ref, isStreaming: false);
});

final streamingDioProvider = Provider<Dio>((ref) {
  return createDioClient(ref, isStreaming: true);
});
