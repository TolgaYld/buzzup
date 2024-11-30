import 'package:buzzup/src/application/gps_status/notifier/gps_status.notifier.dart';
import 'package:buzzup/src/application/gps_status/workflow/state/gps_status.state.dart';
import 'package:buzzup/src/data/datasources/gps_status/gps_status_local_datasrc.dart';
import 'package:buzzup/src/data/repositories/gps_status/gps_status_repo_impl.dart';
import 'package:buzzup/src/domain/repositories/gps_status/gps_status_repo.dart';
import 'package:buzzup/src/domain/usecases/gps_status/get_gps_status_usecase.dart';
import 'package:buzzup/src/domain/usecases/gps_status/watch_gps_status_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:geolocator/geolocator.dart';

// External dependency provider
final geolocatorProvider = Provider<GeolocatorPlatform>((ref) {
  return GeolocatorPlatform.instance;
});

// Datasource provider
final gpsStatusLocalDataSourceProvider = Provider<GpsStatusLocalDatasrc>((ref) {
  return GpsStatusLocalDatasrcImpl(ref.read(geolocatorProvider));
});

// Repository provider
final gpsStatusRepoProvider = Provider<GpsStatusRepo>((ref) {
  return GpsStatusRepoImpl(ref.read(gpsStatusLocalDataSourceProvider));
});

// Usecases providers
final watchGpsStatusUsecaseProvider = Provider<WatchGpsStatusUsecase>((ref) {
  return WatchGpsStatusUsecase(ref.read(gpsStatusRepoProvider));
});

final getGpsStatusUsecaseProvider = Provider<GetGpsStatusUsecase>((ref) {
  return GetGpsStatusUsecase(ref.read(gpsStatusRepoProvider));
});

// Notifier provider
final gpsStatusNotifierProvider = StateNotifierProvider<GpsStatusNotifier, GpsStatusState>((ref) {
  return GpsStatusNotifier(
    watchGpsStatusUsecase: ref.read(watchGpsStatusUsecaseProvider),
    getGpsStatusUsecase: ref.read(getGpsStatusUsecaseProvider),
  );
});

final gpsStatusInitProvider = FutureProvider<void>(
  (ref) async => await ref.read(gpsStatusNotifierProvider.notifier).updateLocationStatus(),
);
