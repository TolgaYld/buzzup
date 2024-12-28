import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:buzzup/src/domain/repositories/gps_status/gps_status.repo.dart';
import 'package:buzzup/src/domain/usecases/gps_status/get_gps_status.usecase.dart';
import 'package:mockito/mockito.dart';

import 'watch_gps_status_usecase_test.mocks.dart';

void main() {
  late GpsStatusRepo repo;
  late GetGpsStatusUsecase usecase;

  setUp(() {
    repo = MockGpsStatusRepo();
    usecase = GetGpsStatusUsecase(repo);
  });

  group('GetGpsStatusUsecase', () {
    test('should return a [LocationPermission] enum, whenn call is successful', () async {
      when(repo.getGpsStatus()).thenAnswer(
        (_) async => const Right(LocationPermission.whileInUse),
      );

      final result = await usecase();

      expect(
        result,
        const Right<dynamic, LocationPermission>(LocationPermission.whileInUse),
      );

      verify(repo.getGpsStatus()).called(1);
      verifyNoMoreInteractions(repo);
    });
    test('should return a [GpsStatusFailure], whenn call is unsuccessful', () async {
      final tFailure = GpsFailure(
        message: "Can't get LocationPermission",
      );
      when(repo.getGpsStatus()).thenAnswer(
        (_) async => Left(tFailure),
      );

      final result = await usecase();

      expect(
        result,
        Left<GpsFailure, dynamic>(tFailure),
      );

      verify(repo.getGpsStatus()).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
