import 'package:buzzup/core/dependency_provider/gps_status.provider.dart';
import 'package:buzzup/src/presentation/pages/auth/auth.page.dart';
import 'package:buzzup/src/presentation/pages/gps_status/location_service_disabled_page.dart';
import 'package:buzzup/src/presentation/pages/home/home.page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigationManagerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => AuthPage()),
      GoRoute(path: '/home', builder: (context, state) => HomePage()),
      GoRoute(path: LocationServiceDisabledPage.routeName, builder: (context, state) => const LocationServiceDisabledPage()),
    ],
    redirect: (context, state) async {
      final gpsStatusState = ref.watch(gpsStatusNotifierProvider);
      if (gpsStatusState.permission == LocationPermission.deniedForever || gpsStatusState.permission == LocationPermission.unableToDetermine) {
        return LocationServiceDisabledPage.routeName;
      }
      return null;
    },
  );
});
