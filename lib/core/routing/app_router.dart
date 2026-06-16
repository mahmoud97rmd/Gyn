import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../core/security/credential_storage.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final isConfiguredAsync = ref.watch(isCredentialsConfiguredProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      if (isConfiguredAsync.isLoading) return null;
      final isConfigured = isConfiguredAsync.valueOrNull ?? false;

      final isGoingToLogin = state.uri.toString() == '/login';

      if (!isConfigured && !isGoingToLogin) {
        return '/login';
      }
      if (isConfigured && isGoingToLogin) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
});
