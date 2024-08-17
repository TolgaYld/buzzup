import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/src/application/gps_status/workflow/state/gps_status.state.dart';
import 'package:buzzup/src/domain/usecases/gps_status/get_gps_status_usecase.dart';
import 'package:buzzup/src/domain/usecases/gps_status/watch_gps_status_usecase.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GpsStatusNotifier extends StateNotifier<GpsStatusState> {
  GpsStatusNotifier({
    required WatchGpsStatusUsecase watchGpsStatusUsecase,
    required GetGpsStatusUsecase getGpsStatusUsecase,
  })  : _watchGpsStatusUsecase = watchGpsStatusUsecase,
        _getGpsStatusUsecase = getGpsStatusUsecase,
        super(GpsStatusState.initial()) {
    watchLocationStatus();
  }

  final WatchGpsStatusUsecase _watchGpsStatusUsecase;
  final GetGpsStatusUsecase _getGpsStatusUsecase;

  void watchLocationStatus() {
    _watchGpsStatusUsecase().listen((either) {
      switch (either) {
        case (Left(value: final failure)):
          state = state.copyWith(
            status: ServiceStatus.disabled,
            failureMessage: failure.message,
          );
          break;
        case (Right(value: final status)):
          state = state.copyWith(
            status: status,
            failureMessage: null,
          );
          break;
      }
    });
  }

  Future<void> updateLocationStatus() async {
    final result = await _getGpsStatusUsecase();

    switch (result) {
      case (Left(value: final failure)):
        state = state.copyWith(
          failureMessage: failure.message,
          permission: LocationPermission.unableToDetermine,
        );
        break;
      case (Right(value: final permission)):
        if (permission == LocationPermission.unableToDetermine) {
          final newPermission = await Geolocator.requestPermission();
          state = state.copyWith(
            permission: newPermission,
            failureMessage: null,
          );
        } else {
          state = state.copyWith(
            permission: permission,
            failureMessage: null,
          );
        }
        break;
    }
  }
}
