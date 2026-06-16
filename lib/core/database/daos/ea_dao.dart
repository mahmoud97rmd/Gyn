// Path: lib/core/database/daos/ea_dao.dart
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/ea_instances_table.dart';
import '../tables/ea_logs_table.dart';

part 'ea_dao.g.dart';

@DriftAccessor(tables: [EaInstancesTable, EaLogsTable])
class EaDao extends DatabaseAccessor<AppDatabase> with _$EaDaoMixin {
  EaDao(AppDatabase db) : super(db);

  Future<int> insertEaInstance(EaInstancesTableCompanion ea) =>
      into(eaInstancesTable).insert(ea);
  Future<bool> updateEaInstance(EaInstancesTableCompanion ea) =>
      update(eaInstancesTable).replace(ea);
  Future<int> updateEaStatus(int id, String status) =>
      (update(eaInstancesTable)..where((t) => t.id.equals(id)))
          .write(EaInstancesTableCompanion(status: Value(status)));
  Future<int> updateEaLastTick(int id, int timestampUs) =>
      (update(eaInstancesTable)..where((t) => t.id.equals(id))).write(
          EaInstancesTableCompanion(lastTickReceivedAtUs: Value(timestampUs)));
  Future<int> updateEaPerformance(
      int id, int totalTrades, double totalNetProfit, double winRate) {
    return (update(eaInstancesTable)..where((t) => t.id.equals(id)))
        .write(EaInstancesTableCompanion(
      totalTrades: Value(totalTrades),
      totalNetProfit: Value(totalNetProfit),
      winRate: Value(winRate),
    ));
  }

  Future<int> deleteEaInstance(int id) =>
      (delete(eaInstancesTable)..where((t) => t.id.equals(id))).go();
  Future<List<EaInstancesTableData>> getAllEaInstances() =>
      select(eaInstancesTable).get();
  Stream<List<EaInstancesTableData>> watchAllEaInstances() =>
      select(eaInstancesTable).watch();
  Future<EaInstancesTableData?> getEaInstance(int id) =>
      (select(eaInstancesTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();
  Future<List<EaInstancesTableData>> getAutoStartEas() =>
      (select(eaInstancesTable)..where((t) => t.autoStart)).get();
  Future<List<EaInstancesTableData>> getRunningEas() =>
      (select(eaInstancesTable)..where((t) => t.status.equals('RUNNING')))
          .get();

  Future<int> insertLog(EaLogsTableCompanion log) =>
      into(eaLogsTable).insert(log);
  Future<void> insertLogs(List<EaLogsTableCompanion> logs) =>
      batch((batch) => batch.insertAll(eaLogsTable, logs));
  Future<List<EaLogsTableData>> getLogsForEa(int eaId) => (select(eaLogsTable)
        ..where((t) => t.eaInstanceId.equals(eaId))
        ..orderBy([
          (t) =>
              OrderingTerm(expression: t.timestampUs, mode: OrderingMode.desc)
        ]))
      .get();
  Stream<List<EaLogsTableData>> watchLogsForEa(int eaId) => (select(eaLogsTable)
        ..where((t) => t.eaInstanceId.equals(eaId))
        ..orderBy([
          (t) =>
              OrderingTerm(expression: t.timestampUs, mode: OrderingMode.desc)
        ]))
      .watch();
  Future<List<EaLogsTableData>> getLogsByLevel(int eaId, String level) =>
      (select(eaLogsTable)
            ..where((t) => t.eaInstanceId.equals(eaId) & t.level.equals(level))
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.timestampUs, mode: OrderingMode.desc)
            ]))
          .get();
  Future<int> clearLogsForEa(int eaId) =>
      (delete(eaLogsTable)..where((t) => t.eaInstanceId.equals(eaId))).go();
  Future<int> countLogsForEa(int eaId) async {
    final countExp = eaLogsTable.id.count();
    final query = selectOnly(eaLogsTable)
      ..addColumns([countExp])
      ..where(eaLogsTable.eaInstanceId.equals(eaId));
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }
}
