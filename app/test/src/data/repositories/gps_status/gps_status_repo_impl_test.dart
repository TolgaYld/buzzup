import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/src/data/datasources/gps_status/gps_status_local_datasrc.dart';
import 'package:buzzup/src/data/repositories/gps_status/gps_status_repo_impl.dart';
import 'package:buzzup/src/domain/repositories/gps_status/gps_status.repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'gps_status_repo_impl_test.mocks.dart';

@GenerateMocks([GpsStatusLocalDatasrc])
void main() {
  late GpsStatusLocalDatasrc datasrc;
  late GpsStatusRepo repo;
  setUp(() {
    datasrc = MockGpsStatusLocalDatasrc();
    repo = GpsStatusRepoImpl(datasrc);
  });

  group('watchGpsStatus', () {
    const tGpsStatus = ServiceStatus.enabled;
    test('should emit a [ServiceStatus] when stream is successful', () {
      when(datasrc.getGeneralServiceStatusStream()).thenAnswer((_) => Stream.fromIterable([tGpsStatus]));

      final expected = [const Right<dynamic, ServiceStatus>(tGpsStatus)];

      final result = repo.watchGpsStatus();

      expectLater(result, emitsInOrder(expected));

      verify(datasrc.getGeneralServiceStatusStream()).called(1);
      verifyNoMoreInteractions(datasrc);
    });

    test('should emit a [GpsStatusFailure] when stream is unsuccessful', () {
      when(datasrc.getGeneralServiceStatusStream()).thenAnswer((_) => Stream.error(Error()));

      final stream = repo.watchGpsStatus();

      expectLater(
        stream,
        emitsInOrder([
          predicate((e) {
            if (e is Either<Failure, ServiceStatus>) {
              switch (e) {
                case Left(value: final failure):
                  failure is GpsFailure;
                  break;
                case Right():
                  false;
                  break;
              }
            }
            return false;
          }),
        ]),
      );

      verify(datasrc.getGeneralServiceStatusStream()).called(1);
      verifyNoMoreInteractions(datasrc);
    });
  });

  group('getGpsStatus', () {
    const tGpsStatus = LocationPermission.always;

    final tException = GpsException(message: "Can't get LocationPermissions");
    test('should return [LocationPermission] when call is successful', () async {
      when(datasrc.getServiceStatus()).thenAnswer((_) async => tGpsStatus);

      final result = await repo.getGpsStatus();

      expect(result, const Right<dynamic, LocationPermission>(tGpsStatus));

      verify(datasrc.getServiceStatus()).called(1);
      verifyNoMoreInteractions(datasrc);
    });

    test('should return a [GpsStatusFailure] when call is unsuccessful', () async {
      // Simuliere einen Fehler im Stream
      when(datasrc.getServiceStatus()).thenThrow(tException);

      final result = await repo.getGpsStatus();

      expect(
        result,
        Left<GpsFailure, dynamic>(
          GpsFailure.fromException(tException),
        ),
      );

      verify(datasrc.getServiceStatus()).called(1);
      verifyNoMoreInteractions(datasrc);
    });
  });
}
