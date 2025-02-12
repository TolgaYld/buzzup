import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:buzzup/core/utils/typedefs.dart';

abstract interface class AuthRepo {
  const AuthRepo();

  ResultFuture<UserEntity> signUp({
    required String username,
    required String email,
    required String password,
    required String repeatPassword,
    required List<double> coordinates,
  });

  ResultFuture<UserEntity> authWithProvider({
    required String provider,
    required String providerId,
    required String email,
    required List<double> coordinates,
  });

  ResultFuture<UserEntity> signIn({
    required String emailOrUsername,
    required String password,
    required List<double> coordinates,
  });

  ResultFuture<void> updateUser(UserEntity updateUser);

  ResultFuture<void> updatePassword({
    required String password,
    required String repeatPassword,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<bool> checkIfUsernameExists(String username);

  ResultFuture<bool> checkIfEmailExists(String email);

  ResultFuture<void> signOut();

  ResultFuture<TokenEntity> refreshToken();
}
