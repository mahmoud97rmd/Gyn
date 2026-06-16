// Path: lib/core/network/api_constants.dart
class ApiConstants {
  // Base URLs
  static const String liveBaseUrl = 'https://api-fxtrade.oanda.com';
  static const String liveStreamUrl = 'https://stream-fxtrade.oanda.com';
  static const String practiceBaseUrl = 'https://api-fxpractice.oanda.com';
  static const String practiceStreamUrl = 'https://stream-fxpractice.oanda.com';

  static const String version = '/v3';

  // Timeouts
  static const int connectTimeoutMs = 15000;
  static const int receiveTimeoutMs = 30000;
  static const int sendTimeoutMs = 15000;

  // Headers
  static const String authHeader = 'Authorization';
  static const String contentTypeHeader = 'Content-Type';
  static const String acceptDatetimeFormatHeader = 'Accept-Datetime-Format';
  static const String datetimeFormatUnix = 'UNIX';

  // Endpoints
  static String accounts() => '$version/accounts';
  static String accountSummary(String accountId) =>
      '$version/accounts/$accountId/summary';
  static String instruments(String accountId) =>
      '$version/accounts/$accountId/instruments';

  static String pricing(String accountId) =>
      '$version/accounts/$accountId/pricing';
  static String candles(String instrument) =>
      '$version/instruments/$instrument/candles';

  static String orders(String accountId) =>
      '$version/accounts/$accountId/orders';
  static String pendingOrders(String accountId) =>
      '$version/accounts/$accountId/pendingOrders';
  static String cancelOrder(String accountId, String orderSpecifier) =>
      '$version/accounts/$accountId/orders/$orderSpecifier/cancel';

  static String trades(String accountId) =>
      '$version/accounts/$accountId/trades';
  static String openTrades(String accountId) =>
      '$version/accounts/$accountId/openTrades';
  static String tradeDetails(String accountId, String tradeSpecifier) =>
      '$version/accounts/$accountId/trades/$tradeSpecifier';
  static String closeTrade(String accountId, String tradeSpecifier) =>
      '$version/accounts/$accountId/trades/$tradeSpecifier/close';
  static String modifyTradeOrders(String accountId, String tradeSpecifier) =>
      '$version/accounts/$accountId/trades/$tradeSpecifier/orders';

  static String positions(String accountId) =>
      '$version/accounts/$accountId/positions';
  static String openPositions(String accountId) =>
      '$version/accounts/$accountId/openPositions';

  static String transactions(String accountId) =>
      '$version/accounts/$accountId/transactions';
  static String transactionsSince(String accountId) =>
      '$version/accounts/$accountId/transactions/sinceid';

  // Order Constants
  static const String tifGTC = 'GTC';
  static const String tifGTD = 'GTD';
  static const String tifFOK = 'FOK';
  static const String tifIOC = 'IOC';
}
