import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/src/domain/usecases/auth/check_email_exists.usecase.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_usecase_test.mocks.dart';

void main() {
  late MockAuthRepo repo;
  late CheckEmailExistsUsecase usecase;

  setUp(() {
    repo = MockAuthRepo();
    usecase = CheckEmailExistsUsecase(repo);
  });

  group('CheckEmailExistsUsecase', () {
    test('should return a bool when call to [AuthRepo] is successful', () async {
      when(repo.checkIfEmailExists(any)).thenAnswer((_) async => const Right(true));

      final result = await usecase('test123@test.com');

      expect(result, const Right<dynamic, bool>(true));

      verify(repo.checkIfEmailExists('test123@test.com')).called(1);
      verifyNoMoreInteractions(repo);
    });

    test('should return a [ApiFailure] when call to [AuthRepo] is unsuccessful', () async {
      final tFailure = ApiFailure(
        message: "Couldn't check if email exists",
      );
      when(repo.checkIfEmailExists(any)).thenAnswer((_) async => Left(tFailure));

      final result = await usecase('test123@test.com');

      expect(result, Left<Failure, dynamic>(tFailure));

      verify(repo.checkIfEmailExists('test123@test.com')).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
