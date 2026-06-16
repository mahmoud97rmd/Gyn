// Path: lib/features/ea_engine/presentation/pages/ea_logs_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ea_providers.dart';

class EaLogsPage extends ConsumerWidget {
  final String eaId;
  final String eaName;

  const EaLogsPage({Key? key, required this.eaId, required this.eaName})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(eaLogsProvider(eaId));

    return Scaffold(
      appBar: AppBar(
        title: Text('$eaName Logs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref.read(eaControllerProvider.notifier).clearLogs(eaId);
            },
          )
        ],
      ),
      backgroundColor: const Color(0xFF121212),
      body: logsAsync.when(
        data: (logs) {
          if (logs.isEmpty) {
            return const Center(child: Text('No logs available'));
          }
          return ListView.builder(
            itemCount: logs.length,
            itemBuilder: (context, index) {
              final log = logs[index];
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.white10)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${DateTime.fromMicrosecondsSinceEpoch(log.timestampUs).toString().substring(11, 19)}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'monospace',
                          fontSize: 12),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        log.message,
                        style: TextStyle(
                          color: log.isErrorLog
                              ? Colors.red
                              : (log.isTradeLog ? Colors.green : Colors.white),
                          fontFamily: 'monospace',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
