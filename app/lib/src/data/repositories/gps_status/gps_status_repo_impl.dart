import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/data/datasources/gps_status/gps_status_local_datasrc.dart';
import 'package:buzzup/src/domain/repositories/gps_status/gps_status.repo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class GpsStatusRepoImpl implements GpsStatusRepo {
  const GpsStatusRepoImpl(this._datasrc);

  final GpsStatusLocalDatasrc _datasrc;
  @override
  ResultStream<ServiceStatus> watchGpsStatus() {
    return _datasrc.getGeneralServiceStatusStream().map<Either<Failure, ServiceStatus>>(Right.new).onErrorReturnWith(
          (error, stackTrace) => Left(
            GpsFailure.fromException(
              GpsException(message: error.toString()),
            ),
          ),
        );
  }

  @override
  ResultFuture<LocationPermission> getGpsStatus() async {
    try {
      final result = await _datasrc.getServiceStatus();

      return Right(result);
    } on GpsException catch (e) {
      return Left(GpsFailure.fromException(e));
    }
  }
}
