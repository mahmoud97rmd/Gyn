// Path: lib/features/auth/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/security/credential_storage.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _apiKeyController = TextEditingController();
  final _accountIdController = TextEditingController();
  bool _isLive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connect to OANDA')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _apiKeyController,
              decoration: const InputDecoration(
                  labelText: 'API Key', border: OutlineInputBorder()),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _accountIdController,
              decoration: const InputDecoration(
                  labelText: 'Account ID', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Live Account'),
              value: _isLive,
              onChanged: (val) => setState(() => _isLive = val),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final storage = ref.read(credentialStorageProvider);
                await storage.saveApiKey(_apiKeyController.text);
                await storage.saveAccountId(_accountIdController.text);
                await storage.setIsLiveAccount(_isLive);
                ref.read(isLiveAccountProvider.notifier).state = _isLive;
                if (context.mounted) {
                  context.go('/');
                }
              },
              child: const Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}
