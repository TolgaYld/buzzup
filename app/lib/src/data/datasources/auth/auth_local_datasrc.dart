import 'package:buzzup/core/common/constants.dart';
import 'package:buzzup/core/errors/exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class AuthLocalDatasrc {
  Future<void> setTokens({required String token, required String refreshToken});
}

class AuthLocalDatasrcImpl implements AuthLocalDatasrc {
  const AuthLocalDatasrcImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> setTokens({
    required String token,
    required String refreshToken,
  }) async {
    try {
      await _secureStorage.write(
        key: kCachedTokenKey,
        value: token,
      );
      await _secureStorage.write(
        key: kCachedRefreshTokenKey,
        value: refreshToken,
      );
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
