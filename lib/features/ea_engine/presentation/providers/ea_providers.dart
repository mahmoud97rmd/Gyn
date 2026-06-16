// Path: lib/features/ea_engine/presentation/providers/ea_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/ea_instance_entity.dart';
import '../../../../core/domain/entities/ea_log_entity.dart';
import '../../data/repositories/ea_repository_impl.dart';

final eaInstancesProvider = StreamProvider<List<EaInstanceEntity>>((ref) {
  final repo = ref.watch(eaRepositoryProvider);
  return repo.watchEaInstances();
});

final eaLogsProvider =
    StreamProvider.family<List<EaLogEntity>, String>((ref, eaId) {
  final repo = ref.watch(eaRepositoryProvider);
  return repo.watchEaLogs(eaId);
});

class EaController extends StateNotifier<AsyncValue<void>> {
  final ref;

  EaController(this.ref) : super(const AsyncData(null));

  Future<void> toggleEaStatus(EaInstanceEntity ea) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(eaRepositoryProvider);
      if (ea.isRunning) {
        await repo.stopEa(ea.id);
      } else {
        await repo.startEa(ea.id);
      }
    });
  }

  Future<void> clearLogs(String eaId) async {
    await ref.read(eaRepositoryProvider).clearEaLogs(eaId);
  }
}

final eaControllerProvider =
    StateNotifierProvider<EaController, AsyncValue<void>>((ref) {
  return EaController(ref);
});
