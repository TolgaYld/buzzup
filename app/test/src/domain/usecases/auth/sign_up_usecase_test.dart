import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/models/all_models.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';
import 'package:buzzup/src/domain/usecases/auth/sign_up.usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_usecase_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late MockAuthRepo repo;
  late SignUpUsecase usecase;

  setUp(() {
    repo = MockAuthRepo();
    usecase = SignUpUsecase(repo);
  });

  group('SignUpUsecase', () {
    final tUser = User.empty();

    test('should call the [AuthRepo] and return a [User]', () async {
      when(
        repo.signUp(
          username: anyNamed('username'),
          email: anyNamed('email'),
          password: anyNamed('password'),
          repeatPassword: anyNamed('repeatPassword'),
          coordinates: anyNamed('coordinates'),
        ),
      ).thenAnswer(
        (_) async => Right(tUser),
      );

      if (tUser.location case final location?) {
        final result = await usecase(
          (
            email: tUser.email ?? "",
            password: 'empty',
            username: tUser.username ?? "",
            coordinates: location.coordinates,
            repeatPassword: 'aaaaaaaaaaaa',
          ),
        );

        expect(result, Right<dynamic, User>(tUser));

        verify(
          repo.signUp(
            username: tUser.username,
            email: tUser.email,
            password: 'empty',
            coordinates: location.coordinates,
            repeatPassword: 'aaaaaaaaaaaa',
          ),
        ).called(1);

        verifyNoMoreInteractions(repo);
      }
    });

    test('should call the [AuthRepo] and return a [Failure]', () async {
      when(
        repo.signUp(
          username: anyNamed('username'),
          email: anyNamed('email'),
          password: anyNamed('password'),
          repeatPassword: anyNamed('repeatPassword'),
          coordinates: anyNamed('coordinates'),
        ),
      ).thenAnswer(
        (_) async => Left(
          ApiFailure(message: "Couldn't Sign Up"),
        ),
      );

      if (tUser.location case final location?) {
        final result = await usecase(
          (
            email: tUser.email ?? "",
            password: 'empty',
            username: tUser.username ?? "",
            coordinates: location.coordinates,
            repeatPassword: 'aaaaaaaaaaaa',
          ),
        );

        expect(
          result,
          Left<Failure, dynamic>(
            ApiFailure(message: "Couldn't Sign Up"),
          ),
        );

        verify(
          repo.signUp(
            username: tUser.username,
            email: tUser.email,
            password: 'empty',
            coordinates: location.coordinates,
            repeatPassword: 'aaaaaaaaaaaa',
          ),
        ).called(1);

        verifyNoMoreInteractions(repo);
      }
    });
  });
}
