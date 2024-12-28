import 'package:buzzup/core/utils/typedefs.dart';
import 'package:geolocator/geolocator.dart';

abstract interface class GpsStatusRepo {
  ResultStream<ServiceStatus> watchGpsStatus();
  ResultFuture<LocationPermission> getGpsStatus();
}
