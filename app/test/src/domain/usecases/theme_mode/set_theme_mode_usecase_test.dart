import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/src/domain/usecases/theme_mode/set_theme_mode_usecase.dart';
import 'package:mockito/mockito.dart';

import 'get_theme_mode_usecase_test.mocks.dart';

void main() {
  late MockThemeModeRepo repo;
  late SetThemeModeUsecase usecase;

  setUp(() async {
    repo = MockThemeModeRepo();
    usecase = SetThemeModeUsecase(repo);
  });

  group('SetThemeModeUsecase', () {
    test(
        'should call [ThemeModeRepo] when ThemeMode will be '
        'setted to true (isDarkModeOn)', () async {
      when(repo.setThemeMode(mode: anyNamed('mode'))).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await usecase(true);

      expect(
        result,
        const Right<dynamic, void>(null),
      );
      verify(repo.setThemeMode(mode: true)).called(1);
      verifyNoMoreInteractions(repo);
    });

    test(
        'should call [ThemeModeRepo] when ThemeMode will be '
        'setted to false (!isDarkModeOn)', () async {
      when(repo.setThemeMode(mode: anyNamed('mode'))).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await usecase(false);

      expect(
        result,
        const Right<dynamic, void>(null),
      );
      verify(
        repo.setThemeMode(
          mode: false,
        ),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });

    test(
        'should return [CacheFailure] when call to '
        '[ThemeModeRepo] was unsuccessful', () async {
      when(repo.setThemeMode(mode: anyNamed('mode'))).thenAnswer(
        (_) async => Left(
          CacheFailure(
            message: "Can't set bool",
          ),
        ),
      );

      final result = await usecase(true);

      expect(
        result,
        Left<Failure, dynamic>(
          CacheFailure(
            message: "Can't set bool",
          ),
        ),
      );
      verify(repo.setThemeMode(mode: true)).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
