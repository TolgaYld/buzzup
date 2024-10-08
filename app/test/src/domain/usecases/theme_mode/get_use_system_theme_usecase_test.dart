import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/src/domain/repositories/theme_mode/theme_mode_repo.dart';
import 'package:buzzup/src/domain/usecases/theme_mode/get_use_system_theme_usecase.dart';
import 'package:mockito/mockito.dart';

import 'get_theme_mode_usecase_test.mocks.dart';

void main() {
  late ThemeModeRepo repo;
  late GetUseSystemThemeUsecase usecase;

  setUp(() async {
    repo = MockThemeModeRepo();
    usecase = GetUseSystemThemeUsecase(repo);
  });

  group('GetUseSystemThemeUsecase', () {
    test(
        'should return true from [ThemeModeRepo] when ThemeMode on System is '
        'setted', () async {
      when(repo.getUseSystemTheme()).thenAnswer(
        (_) async => const Right(true),
      );

      final result = await usecase();

      expect(
        result,
        const Right<dynamic, bool>(true),
      );
      verify(repo.getUseSystemTheme()).called(1);
      verifyNoMoreInteractions(repo);
    });

    test(
        'should return false from [ThemeModeRepo] when ThemeMode on System is '
        'not setted', () async {
      when(repo.getUseSystemTheme()).thenAnswer(
        (_) async => const Right(false),
      );

      final result = await usecase();

      expect(
        result,
        const Right<dynamic, bool>(false),
      );
      verify(repo.getUseSystemTheme()).called(1);
      verifyNoMoreInteractions(repo);
    });

    test(
        'should return [CacheFailure] when call to '
        '[ThemeModeRepo] was unsuccessful', () async {
      when(repo.getUseSystemTheme()).thenAnswer(
        (_) async => Left(
          CacheFailure(
            message: "Can't fetch bool",
          ),
        ),
      );

      final result = await usecase();

      expect(
        result,
        Left<Failure, dynamic>(
          CacheFailure(
            message: "Can't fetch bool",
          ),
        ),
      );
      verify(repo.getUseSystemTheme()).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
