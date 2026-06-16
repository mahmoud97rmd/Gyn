// Path: lib/features/ea_engine/data/repositories/ea_repository_impl.dart
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/ea_instance_entity.dart';
import '../../../../core/domain/entities/ea_log_entity.dart';
import '../../../../core/domain/repositories/repositories.dart';
import '../../../../core/database/database_providers.dart';
import '../../../../core/database/daos/ea_dao.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import 'package:drift/drift.dart';

class EaRepositoryImpl implements IEaRepository {
  final EaDao _eaDao;

  EaRepositoryImpl(this._eaDao);

  @override
  Future<List<EaInstanceEntity>> getAllEaInstances() async {
    final instances = await _eaDao.getAllEaInstances();
    return instances.map(_mapInstance).toList();
  }

  @override
  Stream<List<EaInstanceEntity>> watchEaInstances() {
    return _eaDao
        .watchAllEaInstances()
        .map((list) => list.map(_mapInstance).toList());
  }

  @override
  Future<void> saveEaInstance(EaInstanceEntity instance) async {
    await _eaDao.insertEaInstance(EaInstancesTableCompanion(
      name: Value(instance.name),
      scriptPath: Value(instance.scriptPath),
      scriptFilename: Value(instance.scriptPath.split('/').last),
      scriptHash: const Value(''),
      scriptSizeBytes: const Value(0),
      symbol: Value(instance.symbol),
      magicNumber: Value(instance.magicNumber),
      fixedLotSize: const Value(0.1),
      maxPositions: const Value(1),
      customParameters: const Value(''),
      status: Value(instance.isRunning ? 'RUNNING' : 'STOPPED'),
      autoStart: Value(instance.isAutoStart),
      killOnDisconnectSeconds: const Value(60),
      maxDailyLossLimit: Value(instance.dailyLossLimit),
      totalTrades: const Value(0),
      totalNetProfit: const Value(0.0),
      winRate: const Value(0.0),
      createdAtUs: Value(DateTime.now().microsecondsSinceEpoch),
    ));
  }

  @override
  Future<void> updateEaInstance(EaInstanceEntity instance) async {
    // Basic update
  }

  @override
  Future<void> deleteEaInstance(String id) async {
    await _eaDao.deleteEaInstance(int.parse(id));
  }

  @override
  Future<void> startEa(String id) async {
    await _eaDao.updateEaStatus(int.parse(id), 'RUNNING');
    await _eaDao.insertLog(EaLogsTableCompanion(
      eaInstanceId: Value(int.parse(id)),
      timestampUs: Value(DateTime.now().microsecondsSinceEpoch),
      message: const Value('EA Started successfully'),
      level: const Value('INFO'),
    ));
  }

  @override
  Future<void> stopEa(String id) async {
    await _eaDao.updateEaStatus(int.parse(id), 'STOPPED');
    await _eaDao.insertLog(EaLogsTableCompanion(
      eaInstanceId: Value(int.parse(id)),
      timestampUs: Value(DateTime.now().microsecondsSinceEpoch),
      message: const Value('EA Stopped manually'),
      level: const Value('INFO'),
    ));
  }

  @override
  Future<List<EaLogEntity>> getEaLogs(String eaId) async {
    final logs = await _eaDao.getLogsForEa(int.parse(eaId));
    return logs.map(_mapLog).toList();
  }

  @override
  Stream<List<EaLogEntity>> watchEaLogs(String eaId) {
    return _eaDao
        .watchLogsForEa(int.parse(eaId))
        .map((list) => list.map(_mapLog).toList());
  }

  @override
  Future<void> clearEaLogs(String eaId) async {
    await _eaDao.clearLogsForEa(int.parse(eaId));
  }

  @override
  Future<String> uploadEaScript(File scriptFile) async {
    final id = 'EA_${DateTime.now().microsecondsSinceEpoch}';
    return id;
  }

  EaInstanceEntity _mapInstance(EaInstancesTableData t) {
    return EaInstanceEntity(
      id: t.id.toString(),
      name: t.name,
      description: 'Imported EA', // Not in DB
      scriptPath: t.scriptPath,
      symbol: t.symbol,
      timeframe: Timeframe.m15, // Not in DB
      status: t.status == 'RUNNING'
          ? EaStatus.running
          : (t.status == 'ERROR' ? EaStatus.error : EaStatus.stopped),
      lastTickTimeUs: t.lastTickReceivedAtUs ?? 0,
      dailyProfitLimit: 0.0,
      dailyLossLimit: t.maxDailyLossLimit,
      maxDrawdownPct: 0.0,
      isAutoStart: t.autoStart,
      magicNumber: t.magicNumber,
      params: const {},
    );
  }

  EaLogEntity _mapLog(EaLogsTableData l) {
    return EaLogEntity(
      id: l.id.toString(),
      eaId: l.eaInstanceId.toString(),
      level: _mapLogLevel(l.level),
      message: l.message,
      timestampUs: l.timestampUs,
    );
  }

  LogLevel _mapLogLevel(String level) {
    switch (level) {
      case 'INFO':
        return LogLevel.info;
      case 'WARN':
        return LogLevel.warn;
      case 'ERROR':
        return LogLevel.error;
      case 'CRITICAL':
        return LogLevel.critical;
      case 'TRADE':
        return LogLevel.trade;
      case 'DEBUG':
        return LogLevel.debug;
      default:
        return LogLevel.info;
    }
  }
}

final eaRepositoryProvider = Provider<IEaRepository>((ref) {
  final eaDao = ref.watch(eaDaoProvider);
  return EaRepositoryImpl(eaDao);
});
