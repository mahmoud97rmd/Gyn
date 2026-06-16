// Path: lib/features/account/data/repositories/account_repository_impl.dart
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:drift/drift.dart';
import '../../../../core/domain/entities/account_entity.dart';
import '../../../../core/domain/entities/symbol_entity.dart';
import '../../../../core/domain/failures/failures.dart';
import '../../../../core/domain/repositories/repositories.dart';
import '../../../trading/data/datasources/oanda_rest_datasource.dart';
import '../../../trading/data/mappers/oanda_mappers.dart';
import '../../../../core/database/daos/account_dao.dart';
import '../../../../core/database/database_providers.dart';
import '../../../../core/database/app_database.dart';

class AccountRepositoryImpl implements IAccountRepository {
  final OandaRestDataSource _dataSource;
  final AccountDao _accountDao;
  final BehaviorSubject<AccountEntity> _accountSubject = BehaviorSubject();

  AccountRepositoryImpl(this._dataSource, this._accountDao);

  @override
  Future<AccountEntity> getAccount() async {
    try {
      final response = await _dataSource.getAccountSummary();
      final account = AccountMapper.fromDto(response.account);
      _accountSubject.add(account);
      return account;
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }

  @override
  Stream<AccountEntity> watchAccount() {
    if (!_accountSubject.hasValue) {
      getAccount().then((_) {}).catchError((_) {});
    }
    return _accountSubject.stream;
  }

  @override
  Future<List<SymbolEntity>> getInstruments() async {
    try {
      final dbSymbols = await _accountDao.getAllSymbols();
      if (dbSymbols.isNotEmpty) {
        return dbSymbols.map(_symbolFromDb).toList();
      }

      final response = await _dataSource.getInstruments();
      final symbols = SymbolMapper.fromDtoList(response.instruments);

      final companions = symbols.map((s) => _symbolToCompanion(s)).toList();
      await _accountDao.upsertSymbols(companions);

      return symbols;
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }

  @override
  Future<List<SymbolEntity>> getWatchlist() async {
    final list = await _accountDao.getWatchlistedSymbols();
    return list.map(_symbolFromDb).toList();
  }

  @override
  Stream<List<SymbolEntity>> watchWatchlist() {
    return _accountDao
        .watchWatchlistedSymbols()
        .map((list) => list.map(_symbolFromDb).toList());
  }

  @override
  Future<void> toggleWatchlist(String symbol) async {
    final current = await _accountDao.watchWatchlistedSymbols().first;
    final exists = current.any((e) => e.name == symbol);
    await _accountDao.toggleWatchlist(symbol, !exists);
  }

  @override
  Future<void> reorderWatchlist(List<String> symbols) async {
    await _accountDao.reorderWatchlist(symbols);
  }

  SymbolEntity _symbolFromDb(SymbolsTableData data) {
    return SymbolEntity(
      name: data.name,
      displayName: data.displayName,
      displayExPrecision: data.displayExPrecision,
      type: data.type,
      pipLocation: data.pipLocation,
      displayPrecision: data.displayPrecision,
      minimumTradeSize: data.minimumTradeSize,
      marginRate: data.marginRate,
      tradeUnitsPrecision: data.tradeUnitsPrecision,
      isWatchlisted: data.isWatchlisted,
    );
  }

  SymbolsTableCompanion _symbolToCompanion(SymbolEntity entity) {
    return SymbolsTableCompanion.insert(
      name: entity.name,
      displayName: entity.displayName,
      displayExPrecision: entity.displayExPrecision,
      type: entity.type,
      pipLocation: entity.pipLocation,
      displayPrecision: entity.displayPrecision,
      minimumTradeSize: entity.minimumTradeSize,
      marginRate: entity.marginRate,
      tradeUnitsPrecision: entity.tradeUnitsPrecision,
      isWatchlisted: Value(entity.isWatchlisted),
      lastUpdatedUs: DateTime.now().microsecondsSinceEpoch,
    );
  }
}

final accountRepositoryProvider = Provider<IAccountRepository>((ref) {
  final dataSource = ref.watch(oandaRestDataSourceProvider);
  final accountDao = ref.watch(appDatabaseProvider).accountDao;
  return AccountRepositoryImpl(dataSource, accountDao);
});
