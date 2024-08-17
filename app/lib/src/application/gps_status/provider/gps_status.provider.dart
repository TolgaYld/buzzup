import 'package:buzzup/core/dependency_provider/gps_status.provider.dart';
import 'package:buzzup/src/application/gps_status/notifier/gps_status.notifier.dart';
import 'package:buzzup/src/application/gps_status/workflow/state/gps_status.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final gpsStatusProvider =
    StateNotifierProvider<GpsStatusNotifier, GpsStatusState>((ref) {
  return GpsStatusNotifier(
    watchGpsStatusUsecase: ref.watch(watchGpsStatusUsecaseProvider),
    getGpsStatusUsecase: ref.watch(getGpsStatusUsecaseProvider),
  );
});
