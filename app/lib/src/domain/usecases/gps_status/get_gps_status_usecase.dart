import 'package:buzzup/core/usecases/usecases.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/domain/repositories/gps_status/gps_status.repo.dart';
import 'package:geolocator/geolocator.dart';

class GetGpsStatusUsecase extends UsecaseWithoutParams<LocationPermission> {
  const GetGpsStatusUsecase(this._repo);

  final GpsStatusRepo _repo;
  @override
  ResultFuture<LocationPermission> call() => _repo.getGpsStatus();
}
