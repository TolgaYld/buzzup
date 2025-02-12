import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/src/domain/usecases/auth/update_user.usecase.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_usecase_test.mocks.dart';

void main() {
  late MockAuthRepo repo;
  late UpdateUserUsecase usecase;

  setUp(() {
    repo = MockAuthRepo();
    usecase = UpdateUserUsecase(repo);
  });
  group('UpdateUserUsecase', () {
    final tUser = UserEntity.empty();
    final tFailure = ApiFailure(message: "Couldn't Update User");
    test('should call [AuthRepo] and update [User]', () async {
      when(
        repo.updateUser(
          any,
        ),
      ).thenAnswer((_) async => const Right(null));

      final result = await usecase(tUser);

      expect(result, const Right<dynamic, void>(null));
      verify(
        repo.updateUser(
          tUser,
        ),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });

    test('should call [AuthRepo] and return a [ApiFailure]', () async {
      when(
        repo.updateUser(any),
      ).thenAnswer((_) async => Left(tFailure));

      final result = await usecase(tUser);

      expect(result, Left<Failure, dynamic>(tFailure));
      verify(
        repo.updateUser(
          tUser,
        ),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
