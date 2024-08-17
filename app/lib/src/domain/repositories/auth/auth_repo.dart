import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/utils/typedefs.dart';

abstract interface class AuthRepo {
  const AuthRepo();

  ResultFuture<User> signUp({
    required String username,
    required String email,
    required String password,
    required String repeatPassword,
    required List<double> coordinates,
  });

  ResultFuture<User> authWithProvider({
    required String provider,
    required String providerId,
    required String email,
    required List<double> coordinates,
  });

  ResultFuture<User> signIn({
    required String emailOrUsername,
    required String password,
  });

  ResultFuture<void> updateUser(User updateUser);

  ResultFuture<void> updatePassword({
    required String password,
    required String repeatPassword,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<bool> checkIfUsernameExists(String username);

  ResultFuture<bool> checkIfEmailExists(String email);
}
