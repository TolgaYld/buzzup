import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/src/domain/usecases/auth/auth_with_provider_usecase.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_usecase_test.mocks.dart';

void main() {
  late MockAuthRepo repo;
  late AuthWithProviderUsecase usecase;

  setUp(() {
    repo = MockAuthRepo();
    usecase = AuthWithProviderUsecase(repo);
  });

  final tUser = User.empty();
  final tFailure = ApiFailure(message: "Couldn't Sign Up");
  final tParams = AuthWithProviderUsecase.emptyParams;

  group('AuthWithProviderUsecase', () {
    test('should call [AuthRepo] and return a valid [User]', () async {
      when(
        repo.authWithProvider(
          provider: anyNamed('provider'),
          email: anyNamed('email'),
          providerId: anyNamed('providerId'),
          coordinates: anyNamed('coordinates'),
        ),
      ).thenAnswer((_) async => Right(tUser));

      final result = await usecase(tParams);

      expect(result, Right<dynamic, User>(tUser));
      verify(
        repo.authWithProvider(
          provider: tParams.provider,
          providerId: tParams.providerId,
          email: tParams.email,
          coordinates: tParams.coordinates,
        ),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });

    test('should call [AuthRepo] and return a [Failure]', () async {
      when(
        repo.authWithProvider(
          provider: anyNamed('provider'),
          email: anyNamed('email'),
          providerId: anyNamed('providerId'),
          coordinates: anyNamed('coordinates'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      final result = await usecase(tParams);

      expect(result, Left<Failure, dynamic>(tFailure));
      verify(
        repo.authWithProvider(
          provider: tParams.provider,
          providerId: tParams.providerId,
          email: tParams.email,
          coordinates: tParams.coordinates,
        ),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
