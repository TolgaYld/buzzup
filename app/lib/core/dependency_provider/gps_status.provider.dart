import 'package:buzzup/src/data/datasources/gps_status/gps_status.local.datasrc.dart';
import 'package:buzzup/src/data/repositories/gps_status/gps_status.repo.impl.dart';
import 'package:buzzup/src/domain/repositories/gps_status/gps_status.repo.dart';
import 'package:buzzup/src/domain/usecases/gps_status/get_gps_status.usecase.dart';
import 'package:buzzup/src/domain/usecases/gps_status/watch_gps_status.usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:geolocator/geolocator.dart';

// External dependency provider
final geolocatorProvider = Provider<GeolocatorPlatform>((ref) {
  return GeolocatorPlatform.instance;
});

// Datasource provider
final gpsStatusLocalDataSourceProvider = Provider<GpsStatusLocalDatasrc>((ref) {
  return GpsStatusLocalDatasrcImpl(ref.watch(geolocatorProvider));
});

// Repository provider
final gpsStatusRepoProvider = Provider<GpsStatusRepo>((ref) {
  return GpsStatusRepoImpl(ref.watch(gpsStatusLocalDataSourceProvider));
});

// Usecases providers
final watchGpsStatusUsecaseProvider = Provider<WatchGpsStatusUsecase>((ref) {
  return WatchGpsStatusUsecase(ref.watch(gpsStatusRepoProvider));
});

final getGpsStatusUsecaseProvider = Provider<GetGpsStatusUsecase>((ref) {
  return GetGpsStatusUsecase(ref.watch(gpsStatusRepoProvider));
});
