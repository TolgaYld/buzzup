import 'package:buzzup/core/errors/exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buzzup/core/common/constants.dart';
import 'package:buzzup/src/data/datasources/auth/auth.local.datasrc.dart';
import 'package:buzzup/core/models/token.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_local_datasrc_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late MockFlutterSecureStorage secureStorage;
  late AuthLocalDatasrc datasrc;
  setUp(() {
    secureStorage = MockFlutterSecureStorage();
    datasrc = AuthLocalDatasrcImpl(secureStorage);
  });

  final tTokenModel = Token.empty();

  group('setToken', () {
    test('should chache the Tokens when call to local source is successful', () async {
      when(secureStorage.write(key: anyNamed('key'), value: anyNamed('value'))).thenAnswer((_) async => Future.value());

      await datasrc.setTokens(
        token: tTokenModel.token,
        refreshToken: tTokenModel.refreshToken,
      );

      verify(
        secureStorage.write(
          key: kCachedTokenKey,
          value: tTokenModel.token,
        ),
      ).called(1);

      verify(
        secureStorage.write(
          key: kCachedRefreshTokenKey,
          value: tTokenModel.refreshToken,
        ),
      ).called(1);

      verifyNoMoreInteractions(secureStorage);
    });

    test(
        'should throw an [CacheException] when call to remote source is '
        'unsuccessful', () async {
      when(secureStorage.write(key: anyNamed('key'), value: anyNamed('value'))).thenThrow(Exception());

      final methodCall = datasrc.setTokens;

      expect(
        () => methodCall(
          token: tTokenModel.token,
          refreshToken: tTokenModel.refreshToken,
        ),
        throwsA(
          isA<CacheException>(),
        ),
      );

      verify(
        secureStorage.write(
          key: kCachedTokenKey,
          value: tTokenModel.token,
        ),
      ).called(1);

      verifyNoMoreInteractions(secureStorage);
    });
  });
}
