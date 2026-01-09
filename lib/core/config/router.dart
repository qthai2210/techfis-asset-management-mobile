import 'package:go_router/go_router.dart';

import 'package:techfis_asset_management_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:techfis_asset_management_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:techfis_asset_management_mobile/core/utils/go_router_refresh_stream.dart';
import 'package:techfis_asset_management_mobile/injection_container.dart';
import 'package:techfis_asset_management_mobile/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/pages/asset_list_page.dart';
import 'package:techfis_asset_management_mobile/features/assets/presentation/pages/asset_detail_page.dart';
import 'package:techfis_asset_management_mobile/features/settings/presentation/pages/settings_page.dart';

final router = GoRouter(
  initialLocation: '/',
  refreshListenable: GoRouterRefreshStream(getIt<AuthBloc>().stream),
  redirect: (context, state) {
    final bloc = getIt<AuthBloc>();
    final isLoggedIn = bloc.state is AuthAuthenticated;
    final isLoggingIn = state.uri.toString() == '/login';

    if (!isLoggedIn && !isLoggingIn) return '/login';
    if (isLoggedIn && isLoggingIn) return '/';
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DashboardPage(),
      routes: [
        GoRoute(
          path: 'assets',
          builder: (context, state) => const AssetListPage(),
          routes: [
            GoRoute(
              path: 'detail',
              builder: (context, state) {
                final id = state.extra as int;
                return AssetDetailPage(assetId: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
