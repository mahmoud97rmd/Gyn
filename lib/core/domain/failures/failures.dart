// Path: lib/core/domain/failures/failures.dart
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String code;

  const Failure(this.message, this.code);

  @override
  List<Object> get props => [message, code];
}

class NetworkFailure extends Failure {
  const NetworkFailure([String msg = 'Network Error'])
      : super(msg, 'NETWORK_ERR');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([String msg = 'Connection Timeout'])
      : super(msg, 'TIMEOUT_ERR');
}

class ServerFailure extends Failure {
  const ServerFailure([String msg = 'Server Error']) : super(msg, 'SERVER_ERR');
}

class WebSocketFailure extends Failure {
  const WebSocketFailure([String msg = 'WebSocket Error'])
      : super(msg, 'WS_ERR');
}

class AuthFailure extends Failure {
  const AuthFailure([String msg = 'Authentication Failed'])
      : super(msg, 'AUTH_ERR');
}

class PermissionFailure extends Failure {
  const PermissionFailure([String msg = 'Permission Denied'])
      : super(msg, 'PERMISSION_ERR');
}

class InsufficientMarginFailure extends Failure {
  const InsufficientMarginFailure([String msg = 'Insufficient Margin'])
      : super(msg, 'MARGIN_ERR');
}

class InvalidOrderFailure extends Failure {
  const InvalidOrderFailure([String msg = 'Invalid Order'])
      : super(msg, 'INVALID_ORDER_ERR');
}

class OrderRejectedFailure extends Failure {
  const OrderRejectedFailure([String msg = 'Order Rejected'])
      : super(msg, 'ORDER_REJECTED_ERR');
}

class PositionNotFoundFailure extends Failure {
  const PositionNotFoundFailure([String msg = 'Position Not Found'])
      : super(msg, 'POS_NOT_FOUND_ERR');
}

class MarketClosedFailure extends Failure {
  const MarketClosedFailure([String msg = 'Market Closed'])
      : super(msg, 'MARKET_CLOSED_ERR');
}

class SlippageFailure extends Failure {
  const SlippageFailure([String msg = 'Slippage Exceeded'])
      : super(msg, 'SLIPPAGE_ERR');
}

class EaScriptFailure extends Failure {
  const EaScriptFailure([String msg = 'EA Script Error'])
      : super(msg, 'EA_SCRIPT_ERR');
}

class EaKillSwitchFailure extends Failure {
  const EaKillSwitchFailure([String msg = 'EA Kill Switch Activated'])
      : super(msg, 'EA_KILL_SWITCH_ERR');
}

class EaDailyLossLimitFailure extends Failure {
  const EaDailyLossLimitFailure([String msg = 'Daily Loss Limit Reached'])
      : super(msg, 'EA_LOSS_LIMIT_ERR');
}

class CacheFailure extends Failure {
  const CacheFailure([String msg = 'Cache Error']) : super(msg, 'CACHE_ERR');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([String msg = 'Not Found'])
      : super(msg, 'NOT_FOUND_ERR');
}

class ParseFailure extends Failure {
  const ParseFailure([String msg = 'Parse Error']) : super(msg, 'PARSE_ERR');
}

class FileNotFoundFailure extends Failure {
  const FileNotFoundFailure([String msg = 'File Not Found'])
      : super(msg, 'FILE_NOT_FOUND_ERR');
}

class FilePermissionFailure extends Failure {
  const FilePermissionFailure([String msg = 'File Permission Denied'])
      : super(msg, 'FILE_PERM_ERR');
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure([String msg = 'Unexpected Error'])
      : super(msg, 'UNEXPECTED_ERR');
}
