import 'package:buzzup/core/common/constants.dart';
import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/src/data/datasources/theme_mode/theme_mode_local_datasrc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_mode_local_datasrc_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences sharedPreferences;
  late ThemeModeLocalDatasrcImpl localDatasrcImpl;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    localDatasrcImpl = ThemeModeLocalDatasrcImpl(sharedPreferences);
  });

  group('cacheThemeData', () {
    test('should save bool when [SharedPreferences] is called', () async {
      when(sharedPreferences.setBool(any, any)).thenAnswer(
        (_) async => true,
      );
      await localDatasrcImpl.cacheThemeData(mode: true);

      verify(
        sharedPreferences.setBool(
          kCachedThemeModeKey,
          true,
        ),
      ).called(1);
      verifyNoMoreInteractions(sharedPreferences);
    });

    test('should throw a [CacheException] when [SharedPreferences] is called',
        () async {
      when(sharedPreferences.setBool(any, any)).thenThrow(
        Exception(),
      );

      final methodCall = localDatasrcImpl.cacheThemeData;

      expect(
        methodCall(mode: true),
        throwsA(
          isA<CacheException>(),
        ),
      );

      verify(
        sharedPreferences.setBool(
          kCachedThemeModeKey,
          true,
        ),
      ).called(1);
      verifyNoMoreInteractions(sharedPreferences);
    });
  });

  group('getCachedThemeData', () {
    test('should return bool when [SharedPreferences] is called', () async {
      when(sharedPreferences.getBool(any)).thenReturn(
        true,
      );
      final result = await localDatasrcImpl.getCachedThemeData();

      expect(result, true);
      verify(
        sharedPreferences.getBool(kCachedThemeModeKey),
      ).called(1);
      verifyNoMoreInteractions(sharedPreferences);
    });

    test('should throw a [CacheException] when [SharedPreferences] is called',
        () async {
      when(sharedPreferences.getBool(any)).thenThrow(
        Exception(),
      );

      final methodCall = localDatasrcImpl.getCachedThemeData;

      expect(
        methodCall(),
        throwsA(
          isA<CacheException>(),
        ),
      );

      verify(
        sharedPreferences.getBool(kCachedThemeModeKey),
      ).called(1);
      verifyNoMoreInteractions(sharedPreferences);
    });
  });

  group('getUseSystemTheme', () {
    test('should return bool when [SharedPreferences] is called', () async {
      when(sharedPreferences.getBool(any)).thenReturn(
        false,
      );
      final result = await localDatasrcImpl.getUseSystemTheme();

      expect(result, false);
      verify(
        sharedPreferences.getBool(kCachedUseSystemThemeKey),
      ).called(1);
      verifyNoMoreInteractions(sharedPreferences);
    });

    test('should throw a [CacheException] when [SharedPreferences] is called',
        () async {
      when(sharedPreferences.getBool(any)).thenThrow(
        Exception(),
      );

      final methodCall = localDatasrcImpl.getUseSystemTheme;

      expect(
        methodCall(),
        throwsA(
          isA<CacheException>(),
        ),
      );

      verify(
        sharedPreferences.getBool(kCachedUseSystemThemeKey),
      ).called(1);
      verifyNoMoreInteractions(sharedPreferences);
    });
  });

  group('cacheUseSystemTheme', () {
    test('should save bool when [SharedPreferences] is called', () async {
      when(sharedPreferences.setBool(any, any)).thenAnswer(
        (_) async => true,
      );
      await localDatasrcImpl.cacheUseSystemTheme(useSystemTheme: true);

      verify(
        sharedPreferences.setBool(
          kCachedUseSystemThemeKey,
          true,
        ),
      ).called(1);
      verifyNoMoreInteractions(sharedPreferences);
    });

    test('should throw a [CacheException] when [SharedPreferences] is called',
        () async {
      when(sharedPreferences.setBool(any, any)).thenThrow(
        Exception(),
      );

      final methodCall = localDatasrcImpl.cacheUseSystemTheme;

      expect(
        methodCall(useSystemTheme: false),
        throwsA(
          isA<CacheException>(),
        ),
      );

      verify(
        sharedPreferences.setBool(
          kCachedUseSystemThemeKey,
          false,
        ),
      ).called(1);
      verifyNoMoreInteractions(sharedPreferences);
    });
  });
}
