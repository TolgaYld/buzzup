import 'dart:async';

import 'package:buzzup/core/common/env/environment.dart';
import 'package:buzzup/core/common/provider/auth.provider.dart';
import 'package:buzzup/core/common/provider/grps_status.provider.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:buzzup/src/application/gps_status/workflow/state/gps_status.state.dart';
import 'package:buzzup/src/presentation/pages/auth/auth.page.dart';
import 'package:buzzup/src/presentation/pages/gps_status/location_service_disabled_page.dart';
import 'package:buzzup/src/presentation/pages/home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationManagerProvider = Provider<GoRouter>((ref) {
  final routerNotifier = RouterNotifier(ref);
  return GoRouter(
    initialLocation: '/',
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

    if (authState is SignedOutState && state.uri.path != '/') {
      return '/';
    }

    if ((authState is SignedInState || authState is SignedUpState) && state.uri.path == "/") {
      return '/home';
    }

    if (gpsStatusState.permission == LocationPermission.deniedForever || gpsStatusState.permission == LocationPermission.unableToDetermine) {
      return LocationServiceDisabledPage.routeName;
    }
    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: '/',
          builder: (context, state) => AuthPage(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: LocationServiceDisabledPage.routeName,
          builder: (context, state) => const LocationServiceDisabledPage(),
        ),
      ];
}
