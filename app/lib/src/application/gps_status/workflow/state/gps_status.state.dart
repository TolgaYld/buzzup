import 'package:dart_mappable/dart_mappable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_status.state.mapper.dart';

@MappableClass()
class GpsStatusState with GpsStatusStateMappable {
  const GpsStatusState({
    required this.status,
    required this.permission,
    this.failureMessage,
  });

  factory GpsStatusState.initial() => const GpsStatusState(
        status: ServiceStatus.disabled,
        permission: LocationPermission.whileInUse,
        failureMessage: null,
      );

  final ServiceStatus status;
  final LocationPermission permission;
  final String? failureMessage;
}
