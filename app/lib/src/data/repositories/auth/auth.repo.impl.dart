import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/errors/failure.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/data/datasources/auth/auth.local.datasrc.dart';
import 'package:buzzup/src/data/datasources/auth/auth.remote.datasrc.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({
    required AuthRemoteDatasrc remoteDatasrc,
    required AuthLocalDatasrc localDatasrc,
  })  : _remoteDatasrc = remoteDatasrc,
        _localDatasrc = localDatasrc;

  final AuthRemoteDatasrc _remoteDatasrc;
  final AuthLocalDatasrc _localDatasrc;

  @override
  ResultFuture<UserEntity> authWithProvider({
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
      return Right(result);
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
  ResultFuture<UserEntity> signIn({
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
      return Right(result.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<UserEntity> signUp({
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
      return Right(result.toEntity());
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
  ResultFuture<void> updateUser(UserEntity updateUser) async {
    try {
      await _remoteDatasrc.updateUser(UserModel.fromEntity(updateUser));
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
  ResultFuture<TokenEntity> refreshToken() async {
    try {
      final result = await _remoteDatasrc.refreshToken();

      await _localDatasrc.setTokens(
        token: result.token,
        refreshToken: result.refreshToken,
      );
      return Right(result.toEntity());
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
