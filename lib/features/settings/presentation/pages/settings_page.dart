// Path: lib/features/settings/presentation/pages/settings_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../core/security/credential_storage.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void _showApiConfigDialog(BuildContext context, WidgetRef ref) {
    final keyController = TextEditingController();
    final accountController = TextEditingController();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.bottomSlide,
      title: 'Configure Oanda API',
      desc: 'Enter your API Key and Account ID',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              controller: keyController,
              decoration: const InputDecoration(labelText: 'API Key'),
              obscureText: true,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: accountController,
              decoration: const InputDecoration(labelText: 'Account ID'),
            ),
          ],
        ),
      ),
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        final storage = ref.read(credentialStorageProvider);
        if (keyController.text.isNotEmpty &&
            accountController.text.isNotEmpty) {
          await storage.saveApiKey(keyController.text);
          await storage.saveAccountId(accountController.text);
          ref.invalidate(isCredentialsConfiguredProvider);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Credentials Saved')));
        }
      },
    ).show();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isConfiguredAsync = ref.watch(isCredentialsConfiguredProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Theme'),
            secondary: Icon(themeMode == ThemeMode.dark
                ? Icons.dark_mode
                : Icons.light_mode),
            value: themeMode == ThemeMode.dark,
            onChanged: (val) {
              ref.read(themeModeProvider.notifier).state =
                  val ? ThemeMode.dark : ThemeMode.light;
            },
          ),
          const Divider(),
          isConfiguredAsync.when(
            data: (configured) => ListTile(
              leading: Icon(configured ? Icons.security : Icons.warning,
                  color: configured ? Colors.green : Colors.orange),
              title: const Text('Oanda Credentials'),
              subtitle: Text(
                  configured ? 'Configured (Tap to update)' : 'Not Configured'),
              onTap: () => _showApiConfigDialog(context, ref),
            ),
            loading: () =>
                const ListTile(title: Text('Loading credentials...')),
            error: (e, s) => ListTile(title: Text('Error: $e')),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Trading Preferences'),
            subtitle: const Text('Lot sizes, SL/TP defaults'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('Clear All Data',
                style: TextStyle(color: Colors.red)),
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                title: 'Clear Data?',
                desc: 'This will delete all history, EAs, and settings.',
                btnCancelOnPress: () {},
                btnOkColor: Colors.red,
                btnOkOnPress: () async {
                  await ref.read(credentialStorageProvider).clearAll();
                  ref.invalidate(isCredentialsConfiguredProvider);
                },
              ).show();
            },
          ),
        ],
      ),
    );
  }
}
