import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/models/token.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/utils/graphql/auth/gql_mutations.dart';
import 'package:buzzup/core/utils/graphql/auth/gql_querys.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract interface class AuthRemoteDatasrc {
  Future<User> authWithProvider({
    required String provider,
    required String providerId,
    required String email,
    required List<double> coordinates,
  });

  Future<void> forgotPassword(String email);

  Future<User> signIn({
    required String emailOrUsername,
    required String password,
  });

  Future<User> signUp({
    required String username,
    required String email,
    required String password,
    required String repeatPassword,
    required List<double> coordinates,
  });

  Future<Token> updatePassword({
    required String password,
    required String repeatPassword,
  });

  Future<void> updateUser(User user);

  Future<bool> checkIfEmailExists(String email);

  Future<bool> checkIfUsernameExists(String username);
}

class AuthRemoteDatasrcImpl implements AuthRemoteDatasrc {
  const AuthRemoteDatasrcImpl(this._client);

  final GraphQLClient _client;
  @override
  Future<User> authWithProvider({
    required String provider,
    required String providerId,
    required String email,
    required List<double> coordinates,
  }) async {
    try {
      final response = await _client.mutate(
        MutationOptions(
          document: gql(GqlMutation.authWithProviderMutation),
          variables: {
            'provider': provider,
            'provider_id': providerId,
            'email': email,
            'coordinates': coordinates,
          },
        ),
      );

      if (response.data case final d? when response.hasException == false) {
        return UserMapper.fromMap(d['authUserWithProvider']['user']);
      } else {
        if (response.exception case final exc?) {
          throw ApiException(
            message: exc.graphqlErrors.first.message,
          );
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final response = await _client.mutate(
        MutationOptions(
          document: gql(GqlMutation.forgotPasswordMutation),
          variables: {
            'email': email,
          },
        ),
      );
      if (response.exception case final exc?) {
        throw ApiException(
          message: exc.graphqlErrors.first.message,
        );
      } else {
        throw ApiException(
          message: 'An error occurred',
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<User> signIn({
    required String emailOrUsername,
    required String password,
  }) async {
    try {
      final response = await _client.mutate(
        MutationOptions(
          document: gql(GqlMutation.signInMutation),
          variables: {
            "data": {
              'emailOrUsername': emailOrUsername,
              'password': password,
            },
          },
        ),
      );
      if (response.data case final d? when response.hasException == false) {
        final user = UserMapper.fromMap(d['signInUser']['user']);
        final tokens = TokenMapper.fromMap(d['signInUser']['tokens']);
        return user.copyWith(tokens: tokens);
      } else {
        if (response.exception case final exc?) {
          throw ApiException(
            message: exc.graphqlErrors.first.message,
          );
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<User> signUp({
    required String username,
    required String email,
    required String password,
    required String repeatPassword,
    required List<double> coordinates,
  }) async {
    try {
      final response = await _client.mutate(
        MutationOptions(
          document: gql(GqlMutation.signUpMutation),
          variables: {
            "data": {
              'username': username,
              'email': email,
              'password': password,
              'repeat_password': repeatPassword,
              'coordinates': coordinates,
            },
          },
        ),
      );
      if (response.data case final d? when response.hasException == false) {
        final user = UserMapper.fromMap(d['signUpUser']['user']);
        final tokens = TokenMapper.fromMap(d['signUpUser']['tokens']);
        return user.copyWith(tokens: tokens);
      } else {
        if (response.exception case final exc?) {
          throw ApiException(
            message: exc.graphqlErrors.first.message,
          );
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<Token> updatePassword({
    required String password,
    required String repeatPassword,
  }) async {
    try {
      final response = await _client.mutate(
        MutationOptions(
          document: gql(GqlMutation.updatePasswordMutation),
          variables: {
            'password': password,
            'repeat_password': repeatPassword,
          },
        ),
      );
      if (response.data case final d? when response.hasException == false) {
        return TokenMapper.fromMap(d['updateUserPassword']['tokens']);
      } else {
        if (response.exception case final exc?) {
          throw ApiException(
            message: exc.graphqlErrors.first.message,
          );
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<void> updateUser(User user) async {
    try {
      if (user.location case final location?) {
        final response = await _client.mutate(
          MutationOptions(
            document: gql(GqlMutation.updateUserMutation),
            variables: {
              'coordinates': location.coordinates,
              'username': user.username,
            },
          ),
        );

        if (response.exception case final exc? when response.hasException) {
          throw ApiException(
            message: exc.graphqlErrors.first.message,
          );
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
      } else {
        throw GpsException(message: 'Location not found');
      }
    } on ApiException {
      rethrow;
    } on GpsException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfEmailExists(String email) async {
    try {
      final response = await _client.query(
        QueryOptions(
          document: gql(GqlQuerys.checkEmailExistsQuery),
          variables: {
            'email': email,
          },
        ),
      );

      if (response.data case final d? when response.hasException == false) {
        return d['checkIfEmailExists'];
      } else {
        if (response.exception case final exc?) {
          throw ApiException(
            message: exc.graphqlErrors.first.message,
          );
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfUsernameExists(String username) async {
    try {
      final response = await _client.query(
        QueryOptions(
          document: gql(GqlQuerys.checkUsernameExistsQuery),
          variables: {
            'username': username,
          },
        ),
      );

      if (response.data case final d? when response.hasException == false) {
        return d['checkIfUsernameExists'];
      } else {
        if (response.exception case final exc?) {
          throw ApiException(
            message: exc.graphqlErrors.first.message,
          );
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
