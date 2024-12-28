import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/gps_status/gps_status.repo.dart';
import 'package:geolocator/geolocator.dart';

class WatchGpsStatusUsecase extends UsecaseWithoutParams<ServiceStatus> {
  const WatchGpsStatusUsecase(this._repo);

  final GpsStatusRepo _repo;
  @override
  ResultStream<ServiceStatus> call() => _repo.watchGpsStatus();
}
