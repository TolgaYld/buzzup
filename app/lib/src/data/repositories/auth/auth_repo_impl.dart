import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/models/token.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/data/datasources/auth/auth_local_datasrc.dart';
import 'package:buzzup/src/data/datasources/auth/auth_remote_datasrc.dart';
import 'package:buzzup/src/domain/repositories/auth/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({
    required AuthRemoteDatasrc remoteDatasrc,
    required AuthLocalDatasrc localDatasrc,
  })  : _remoteDatasrc = remoteDatasrc,
        _localDatasrc = localDatasrc;

  final AuthRemoteDatasrc _remoteDatasrc;
  final AuthLocalDatasrc _localDatasrc;

  @override
  ResultFuture<User> authWithProvider({
    required String provider,
    required String providerId,
    required String email,
    required List<double> coordinates,
  }) async {
    try {
      final result = await _remoteDatasrc.authWithProvider(
        provider: provider,
        providerId: providerId,
        email: email,
        coordinates: coordinates,
      );

      if (result.tokens case final tkns?) {
        await _localDatasrc.setTokens(
          token: tkns.token,
          refreshToken: tkns.refreshToken,
        );
      } else {
        return Left(ApiFailure(message: 'No tokens found'));
      }
      return Right(result.copyWith(tokens: null));
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> forgotPassword(String email) async {
    try {
      await _remoteDatasrc.forgotPassword(email);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> signIn({
    required String emailOrUsername,
    required String password,
    required List<double> coordinates,
  }) async {
    try {
      final result = await _remoteDatasrc.signIn(
        emailOrUsername: emailOrUsername,
        password: password,
        coordinates: coordinates,
      );
      if (result.tokens case final tkns?) {
        await _localDatasrc.setTokens(
          token: tkns.token,
          refreshToken: tkns.refreshToken,
        );
      } else {
        return Left(ApiFailure(message: 'No tokens found'));
      }
      return Right(result.copyWith(tokens: null));
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> signUp({
    required String username,
    required String email,
    required String password,
    required String repeatPassword,
    required List<double> coordinates,
  }) async {
    try {
      final result = await _remoteDatasrc.signUp(
        username: username,
        email: email,
        password: password,
        repeatPassword: repeatPassword,
        coordinates: coordinates,
      );

      if (result.tokens case final tkns?) {
        await _localDatasrc.setTokens(
          token: tkns.token,
          refreshToken: tkns.refreshToken,
        );
      } else {
        return Left(ApiFailure(message: 'No tokens found'));
      }
      return Right(result.copyWith(tokens: null));
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> updatePassword({
    required String password,
    required String repeatPassword,
  }) async {
    try {
      final result = await _remoteDatasrc.updatePassword(
        password: password,
        repeatPassword: repeatPassword,
      );

      await _localDatasrc.setTokens(
        token: result.token,
        refreshToken: result.refreshToken,
      );

      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> updateUser(User updateUser) async {
    try {
      await _remoteDatasrc.updateUser(updateUser);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<bool> checkIfEmailExists(String email) async {
    try {
      final result = await _remoteDatasrc.checkIfEmailExists(email);

      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<bool> checkIfUsernameExists(String username) async {
    try {
      final result = await _remoteDatasrc.checkIfUsernameExists(username);

      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<Token> refreshToken() async {
    try {
      final result = await _remoteDatasrc.refreshToken();

      await _localDatasrc.setTokens(
        token: result.token,
        refreshToken: result.refreshToken,
      );
      return Right(result);
    } on ApiException catch (e) {
      await _localDatasrc.deleteTokens();
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> signOut() async {
    try {
      await _localDatasrc.deleteTokens();
      await _remoteDatasrc.signOut();
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
