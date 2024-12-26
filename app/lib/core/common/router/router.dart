import 'dart:async';

import 'package:buzzup/core/common/env/environment.dart';
import 'package:buzzup/core/common/provider/auth.provider.dart';
import 'package:buzzup/core/common/provider/grps_status.provider.dart';
import 'package:buzzup/core/common/widgets/splash.page.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:buzzup/src/application/gps_status/workflow/state/gps_status.state.dart';
import 'package:buzzup/src/presentation/pages/auth/auth.page.dart';
import 'package:buzzup/src/presentation/pages/gps_status/location_service_disabled_page.dart';
import 'package:buzzup/src/presentation/pages/home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum RoutePath {
  root(path: '/'),
  signIn(path: 'signIn'),
  home(path: 'home'),
  locationServiceDisabled(path: "location_service_disabled");

  const RoutePath({required this.path});
  final String path;
}

final navigationManagerProvider = Provider<GoRouter>((ref) {
  final routerNotifier = RouterNotifier(ref);
  return GoRouter(
    initialLocation: RoutePath.root.path,
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
      return "${RoutePath.root.path}${RoutePath.locationServiceDisabled.path}";
    }

    if (authState is SignedInState) {
      return "${RoutePath.root.path}${RoutePath.home.path}";
    }
    if (authState is SignedOutState) {
      return "${RoutePath.root.path}${RoutePath.signIn.path}";
    }
    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: RoutePath.root.path,
          name: RoutePath.root.name,
          builder: (context, state) => SplashPage(),
          routes: [
            GoRoute(
              path: RoutePath.signIn.path,
              builder: (context, state) => AuthPage(),
            ),
            GoRoute(
              path: RoutePath.home.path,
              pageBuilder: (context, state) => CustomTransitionPage(
                child: HomePage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
              ),
            ),
            GoRoute(
              path: RoutePath.locationServiceDisabled.path,
              builder: (context, state) => const LocationServiceDisabledPage(),
            ),
          ],
        ),
      ];
}
