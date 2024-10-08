import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:buzzup/src/domain/repositories/gps_status/gps_status_repo.dart';
import 'package:buzzup/src/domain/usecases/gps_status/watch_gps_status_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'watch_gps_status_usecase_test.mocks.dart';

@GenerateMocks([GpsStatusRepo])
void main() {
  late GpsStatusRepo repo;
  late WatchGpsStatusUsecase usecase;

  setUp(() {
    repo = MockGpsStatusRepo();
    usecase = WatchGpsStatusUsecase(repo);
  });

  group('WatchGpsStatusUsecase', () {
    const tGpsStatus = ServiceStatus.enabled;
    test('should emit a [GpsStatus] if call is successful', () async {
      when(repo.watchGpsStatus())
          .thenAnswer((_) => Stream.fromIterable([const Right(tGpsStatus)]));

      final result = usecase();

      await expectLater(
        result,
        emits(const Right<dynamic, ServiceStatus>(tGpsStatus)),
      );
      verify(repo.watchGpsStatus()).called(1);
      verifyNoMoreInteractions(repo);
    });

    test('should emit a [GpsStatusFailure] if call is failed', () async {
      when(repo.watchGpsStatus()).thenAnswer(
        (_) => Stream.fromIterable([
          Left(
            GpsFailure(
              message: 'An Error occured when watching to LocationStatus',
            ),
          ),
        ]),
      );

      final result = usecase();

      await expectLater(
        result,
        emits(
          Left<Failure, dynamic>(
            GpsFailure(
              message: 'An Error occured when watching to LocationStatus',
            ),
          ),
        ),
      );
      verify(repo.watchGpsStatus()).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
