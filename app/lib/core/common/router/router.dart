import 'dart:async';

import 'package:buzzup/core/common/env/environment.dart';
import 'package:buzzup/core/common/provider/auth.provider.dart';
import 'package:buzzup/core/common/provider/grps_status.provider.dart';
import 'package:buzzup/core/common/widgets/splash.page.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:buzzup/src/application/gps_status/workflow/state/gps_status.state.dart';
import 'package:buzzup/src/presentation/pages/app/tabs/channels.tab.dart';
import 'package:buzzup/src/presentation/pages/app/tabs/chats.tab.dart';
import 'package:buzzup/src/presentation/pages/app/tabs/home.tab.dart';
import 'package:buzzup/src/presentation/pages/app/tabs/profile.tab.dart';
import 'package:buzzup/src/presentation/pages/auth/auth.page.dart';
import 'package:buzzup/src/presentation/pages/gps_status/location_service_disabled_page.dart';
import 'package:buzzup/src/presentation/pages/app/app.page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum RoutePath {
  loading(path: "/loading"),
  locationServiceDisabled(path: "/location_service_disabled"),
  signIn(path: '/signIn'),
  home(path: '/home'),
  channels(path: '/channels'),
  chats(path: '/chats'),
  profile(path: '/profile');

  const RoutePath({required this.path});
  final String path;
}

final navigationManagerProvider = Provider<GoRouter>((ref) {
  final routerNotifier = RouterNotifier(ref);
  return GoRouter(
    initialLocation: RoutePath.loading.path,
    debugLogDiagnostics: Environment.type == EnvironmentType.test,
    refreshListenable: routerNotifier,
    routes: routerNotifier._routes,
    redirect: routerNotifier._redirect,
  );
});

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen<AuthState>(authProvider, (_, __) => notifyListeners());
    _ref.listen<GpsStatusState>(gpsStatusNotifierProvider, (_, __) => notifyListeners());
  }
  final Ref _ref;

  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
    final authState = _ref.read(authProvider);
    final gpsStatusState = _ref.read(gpsStatusNotifierProvider);
    if (gpsStatusState.permission == LocationPermission.deniedForever || gpsStatusState.permission == LocationPermission.unableToDetermine) {
      if (state.path != RoutePath.locationServiceDisabled.path) {
        return RoutePath.locationServiceDisabled.path;
      }
    }

    if (authState is SignedOutState) {
      return RoutePath.signIn.path;
    }
    return null;
  }

  List<RouteBase> get _routes => [
        GoRoute(
          path: RoutePath.locationServiceDisabled.path,
          builder: (context, state) => const LocationServiceDisabledPage(),
        ),
        GoRoute(
          path: RoutePath.loading.path,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: RoutePath.signIn.path,
          name: RoutePath.signIn.name,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: AuthPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
          ),
        ),
        StatefulShellRoute.indexedStack(
          pageBuilder: (context, state, shell) => CustomTransitionPage(
            child: AppPage(
              navigationShell: shell,
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
          ),
          branches: [
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: RoutePath.home.path,
                  name: RoutePath.home.name,
                  builder: (context, state) => const HomeTab(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: RoutePath.channels.path,
                  name: RoutePath.channels.name,
                  builder: (context, state) => const ChannelsTab(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: RoutePath.chats.path,
                  builder: (context, state) => const ChatsTab(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: RoutePath.profile.path,
                  builder: (context, state) => const ProfileTab(),
                ),
              ],
            ),
          ],
        ),
      ];
}
