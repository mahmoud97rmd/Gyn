// Path: lib/core/network/interceptors/auth_interceptor.dart
import 'package:dio/dio.dart';
import '../../security/credential_storage.dart';
import '../api_constants.dart';
import '../../domain/failures/failures.dart';

class AuthInterceptor extends Interceptor {
  final CredentialStorage _storage;

  AuthInterceptor(this._storage);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.getApiKey();
    if (token == null || token.isEmpty) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: const AuthFailure('No API key configured'),
        ),
      );
    }
    options.headers[ApiConstants.authHeader] = 'Bearer $token';
    handler.next(options);
  }
}
