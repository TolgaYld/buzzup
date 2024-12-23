import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/src/domain/usecases/auth/update_password.usecase.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_usecase_test.mocks.dart';

void main() {
  late MockAuthRepo repo;
  late UpdatePasswordUsecase usecase;

  setUp(() {
    repo = MockAuthRepo();
    usecase = UpdatePasswordUsecase(repo);
  });
  group('UpdatePasswordUsecase', () {
    final tParams = UpdatePasswordUsecase.emptyParams;
    final tFailure = ApiFailure(message: "Couldn't Update Password");
    test('should call [AuthRepo] and  update [User]-password', () async {
      when(
        repo.updatePassword(
          password: anyNamed('password'),
          repeatPassword: anyNamed('repeatPassword'),
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await usecase(tParams);

      expect(result, const Right<dynamic, void>(null));
      verify(
        repo.updatePassword(
          password: tParams.password,
          repeatPassword: tParams.repeatPassword,
        ),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });

    test('should call [AuthRepo] and return a [ApiFailure]', () async {
      when(
        repo.updatePassword(
          password: anyNamed('password'),
          repeatPassword: anyNamed('repeatPassword'),
        ),
      ).thenAnswer((_) async => Left(tFailure));

      final result = await usecase(tParams);

      expect(result, Left<Failure, dynamic>(tFailure));
      verify(
        repo.updatePassword(
          password: tParams.password,
          repeatPassword: tParams.repeatPassword,
        ),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
