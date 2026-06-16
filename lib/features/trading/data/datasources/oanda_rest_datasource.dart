// Path: lib/features/trading/data/datasources/oanda_rest_datasource.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/client/dio_client.dart';
import '../../../../core/security/credential_storage.dart';
import '../../../account/data/models/account_dto.dart';
import '../../../account/data/models/instrument_dto.dart';
import '../models/trade_order_dto.dart';
import '../models/transaction_candle_dto.dart';

class OandaRestDataSource {
  final Dio _dio;
  final CredentialStorage _storage;

  OandaRestDataSource(this._dio, this._storage);

  Future<String> _getAccountId() async {
    final id = await _storage.getAccountId();
    if (id == null || id.isEmpty) throw Exception('Account ID not configured');
    return id;
  }

  Future<AccountsListResponseDto> getAccounts() async {
    final response = await _dio.get(ApiConstants.accounts());
    return AccountsListResponseDto.fromJson(response.data);
  }

  Future<AccountSummaryResponseDto> getAccountSummary() async {
    final accountId = await _getAccountId();
    final response = await _dio.get(ApiConstants.accountSummary(accountId));
    return AccountSummaryResponseDto.fromJson(response.data);
  }

  Future<InstrumentsResponseDto> getInstruments() async {
    final accountId = await _getAccountId();
    final response = await _dio.get(ApiConstants.instruments(accountId));
    return InstrumentsResponseDto.fromJson(response.data);
  }

  Future<PricingResponseDto> getPricing(List<String> instruments) async {
    final accountId = await _getAccountId();
    final response = await _dio.get(
      ApiConstants.pricing(accountId),
      queryParameters: {'instruments': instruments.join(',')},
    );
    return PricingResponseDto.fromJson(response.data);
  }

  Future<CandlesResponseDto> getCandles(String instrument, String granularity,
      {int? count,
      DateTime? fromTime,
      DateTime? toTime,
      String price = 'M',
      bool smooth = false,
      bool includeFirst = true}) async {
    final queryParams = <String, dynamic>{
      'granularity': granularity,
      'price': price,
      'smooth': smooth,
      'includeFirst': includeFirst,
    };
    if (count != null) queryParams['count'] = count;
    if (fromTime != null)
      queryParams['from'] = fromTime.toUtc().toIso8601String() + 'Z';
    if (toTime != null)
      queryParams['to'] = toTime.toUtc().toIso8601String() + 'Z';

    final response = await _dio.get(ApiConstants.candles(instrument),
        queryParameters: queryParams);
    return CandlesResponseDto.fromJson(response.data);
  }

  Future<OrderFillResponseDto> createOrder(
      CreateOrderRequestDto request) async {
    final accountId = await _getAccountId();
    final response = await _dio.post(
      ApiConstants.orders(accountId),
      data: request.toJson(),
    );
    return OrderFillResponseDto.fromJson(response.data);
  }

  Future<PendingOrdersResponseDto> getPendingOrders() async {
    final accountId = await _getAccountId();
    final response = await _dio.get(ApiConstants.pendingOrders(accountId));
    return PendingOrdersResponseDto.fromJson(response.data);
  }

  Future<void> cancelOrder(String orderId) async {
    final accountId = await _getAccountId();
    await _dio.put(ApiConstants.cancelOrder(accountId, orderId));
  }

  Future<OpenTradesResponseDto> getOpenTrades() async {
    final accountId = await _getAccountId();
    final response = await _dio.get(ApiConstants.openTrades(accountId));
    return OpenTradesResponseDto.fromJson(response.data);
  }

  Future<dynamic> getTrade(String tradeId) async {
    final accountId = await _getAccountId();
    final response =
        await _dio.get(ApiConstants.tradeDetails(accountId, tradeId));
    return response.data;
  }

  Future<dynamic> closeTrade(String tradeId, String? units) async {
    final accountId = await _getAccountId();
    final response = await _dio.put(
      ApiConstants.closeTrade(accountId, tradeId),
      data: units != null ? {'units': units} : {'units': 'ALL'},
    );
    return response.data;
  }

  Future<ModifyTradeResponseDto> modifyTrade(
      String tradeId, String? tp, String? sl, String timeInForce) async {
    final accountId = await _getAccountId();
    final Map<String, dynamic> data = {};
    if (tp != null)
      data['takeProfit'] = {'price': tp, 'timeInForce': timeInForce};
    if (sl != null)
      data['stopLoss'] = {'price': sl, 'timeInForce': timeInForce};

    final response = await _dio.put(
      ApiConstants.modifyTradeOrders(accountId, tradeId),
      data: data,
    );
    return ModifyTradeResponseDto.fromJson(response.data);
  }

  Future<TransactionsResponseDto> getTransactions(
      DateTime from, DateTime to, List<String> type) async {
    final accountId = await _getAccountId();
    final response = await _dio.get(
      ApiConstants.transactions(accountId),
      queryParameters: {
        'from': from.toUtc().toIso8601String() + 'Z',
        'to': to.toUtc().toIso8601String() + 'Z',
        'type': type.join(','),
      },
    );
    return TransactionsResponseDto.fromJson(response.data);
  }

  Future<TransactionsResponseDto> getTransactionsSince(String lastId) async {
    final accountId = await _getAccountId();
    final response = await _dio.get(
      ApiConstants.transactionsSince(accountId),
      queryParameters: {'id': lastId},
    );
    return TransactionsResponseDto.fromJson(response.data);
  }
}

final oandaRestDataSourceProvider = Provider<OandaRestDataSource>((ref) {
  final dio = ref.watch(dioClientProvider);
  final storage = ref.watch(credentialStorageProvider);
  return OandaRestDataSource(dio, storage);
});
