import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/src/domain/usecases/auth/sign_in_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_usecase_test.mocks.dart';

void main() {
  late MockAuthRepo repo;
  late SignInUsecase usecase;

  setUp(() {
    repo = MockAuthRepo();
    usecase = SignInUsecase(repo);
  });

  group('SignInUsecase', () {
    final tUser = User.empty();
    final tParams = SignInUsecase.emptyParams;
    final tFailure = ApiFailure(message: "Couldn't Sign In");
    test('should call [AuthRepo] and return a valid [User]', () async {
      when(
        repo.signIn(
          emailOrUsername: anyNamed('emailOrUsername'),
          password: anyNamed('password'),
        ),
      ).thenAnswer(
        (_) async => Right(tUser),
      );

      final result = await usecase(
        tParams,
      );

      expect(result, Right<dynamic, User>(tUser));
      verify(
        repo.signIn(
          emailOrUsername: tParams.emailOrUsername,
          password: tParams.password,
        ),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });

    test('should call [AuthRepo] and return a [ApiFailure]', () async {
      when(
        repo.signIn(
          emailOrUsername: anyNamed('emailOrUsername'),
          password: anyNamed('password'),
        ),
      ).thenAnswer(
        (_) async => Left(tFailure),
      );

      final result = await usecase(
        tParams,
      );

      expect(result, Left<Failure, dynamic>(tFailure));
      verify(
        repo.signIn(
          emailOrUsername: tParams.emailOrUsername,
          password: tParams.password,
        ),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
