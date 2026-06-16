// Path: lib/features/ea_engine/presentation/pages/ea_dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/ea_providers.dart';
import 'ea_logs_page.dart';

class EaDashboardPage extends ConsumerWidget {
  const EaDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final easAsync = ref.watch(eaInstancesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expert Advisors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add EA
            },
          )
        ],
      ),
      backgroundColor: const Color(0xFF121212),
      body: easAsync.when(
        data: (eas) {
          if (eas.isEmpty) {
            return const Center(child: Text('No EAs installed'));
          }
          return ListView.builder(
            itemCount: eas.length,
            itemBuilder: (context, index) {
              final ea = eas[index];
              return Card(
                color: const Color(0xFF1E1E1E),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(ea.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle:
                      Text('${ea.symbol} - ${ea.timeframe.name.toUpperCase()}'),
                  trailing: Switch(
                    value: ea.isRunning,
                    onChanged: (val) {
                      ref
                          .read(eaControllerProvider.notifier)
                          .toggleEaStatus(ea);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EaLogsPage(
                          eaId: ea.id,
                          eaName: ea.name,
                        ),
                      ),
                    );
                  },
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
