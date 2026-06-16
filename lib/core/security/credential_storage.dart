// Path: lib/core/security/credential_storage.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CredentialStorage {
  final FlutterSecureStorage _storage;

  static const _keyApiKey = 'oanda_api_key';
  static const _keyAccountId = 'oanda_account_id';
  static const _keyIsLive = 'oanda_is_live';
  static const _keyAccountCurrency = 'oanda_account_currency';
  static const _keyAccountAlias = 'oanda_account_alias';

  CredentialStorage()
      : _storage = const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
        );

  Future<void> saveApiKey(String key) =>
      _storage.write(key: _keyApiKey, value: key);
  Future<String?> getApiKey() => _storage.read(key: _keyApiKey);
  Future<void> deleteApiKey() => _storage.delete(key: _keyApiKey);

  Future<void> saveAccountId(String id) =>
      _storage.write(key: _keyAccountId, value: id);
  Future<String?> getAccountId() => _storage.read(key: _keyAccountId);

  Future<void> setIsLiveAccount(bool isLive) =>
      _storage.write(key: _keyIsLive, value: isLive.toString());
  Future<bool> getIsLiveAccount() async {
    final val = await _storage.read(key: _keyIsLive);
    return val == 'true';
  }

  Future<void> saveAccountMetadata(String currency, String? alias) async {
    await _storage.write(key: _keyAccountCurrency, value: currency);
    if (alias != null) {
      await _storage.write(key: _keyAccountAlias, value: alias);
    }
  }

  Future<String?> getAccountCurrency() =>
      _storage.read(key: _keyAccountCurrency);
  Future<String?> getAccountAlias() => _storage.read(key: _keyAccountAlias);

  Future<bool> isConfigured() async {
    final key = await getApiKey();
    final id = await getAccountId();
    return key != null && key.isNotEmpty && id != null && id.isNotEmpty;
  }

  Future<void> clearAll() => _storage.deleteAll();
}

final credentialStorageProvider =
    Provider<CredentialStorage>((ref) => CredentialStorage());

final isLiveAccountProvider = StateProvider<bool>((ref) => false);

final isCredentialsConfiguredProvider = FutureProvider<bool>((ref) async {
  final storage = ref.read(credentialStorageProvider);
  final configured = await storage.isConfigured();
  if (configured) {
    ref.read(isLiveAccountProvider.notifier).state =
        await storage.getIsLiveAccount();
  }
  return configured;
});
