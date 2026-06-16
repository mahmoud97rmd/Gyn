// Path: lib/core/network/interceptors/error_interceptor.dart
import 'package:dio/dio.dart';
import '../../domain/failures/failures.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Failure failure;

    if (err.error is Failure) {
      failure = err.error as Failure;
    } else {
      switch (err.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          failure = TimeoutFailure(err.message ?? 'Timeout');
          break;
        case DioExceptionType.connectionError:
          failure = NetworkFailure(err.message ?? 'Connection error');
          break;
        case DioExceptionType.badResponse:
          failure = _mapStatusCodeToFailure(err.response);
          break;
        default:
          failure =
              UnexpectedFailure(err.message ?? 'Unexpected network error');
      }
    }

    final newErr = err.copyWith(error: failure);
    handler.next(newErr);
  }

  Failure _mapStatusCodeToFailure(Response? response) {
    if (response == null) return const NetworkFailure();

    final statusCode = response.statusCode ?? 0;
    String errorMessage = 'Server Error';
    String? rejectReason;

    try {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        errorMessage = data['errorMessage'] ?? errorMessage;
        if (data.containsKey('orderRejectTransaction')) {
          rejectReason = data['orderRejectTransaction']['rejectReason'];
        }
      }
    } catch (_) {}

    final msg =
        rejectReason != null ? '$errorMessage ($rejectReason)' : errorMessage;

    switch (statusCode) {
      case 400:
        return ParseFailure(msg);
      case 401:
        return AuthFailure(msg);
      case 403:
        return PermissionFailure(msg);
      case 404:
        return NotFoundFailure(msg);
      default:
        if (rejectReason != null) {
          if (rejectReason.contains('MARGIN'))
            return InsufficientMarginFailure(msg);
          if (rejectReason.contains('MARKET_HALTED'))
            return MarketClosedFailure(msg);
          return OrderRejectedFailure(msg);
        }
        return ServerFailure(msg);
    }
  }
}
