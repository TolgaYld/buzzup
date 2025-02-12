import 'package:buzzup/core/common/data/models/all_models.dart';
import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/utils/graphql/auth/gql_auth_mutations.dart';
import 'package:buzzup/core/utils/graphql/auth/gql_auth_querys.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:graphql_flutter/graphql_flutter.dart';

abstract interface class AuthRemoteDatasrc {
  Future<UserModel> authWithProvider({
    required String provider,
    required String providerId,
    required String email,
    required List<double> coordinates,
  });

  Future<void> forgotPassword(String email);

  Future<UserModel> signIn({
    required String emailOrUsername,
    required String password,
    required List<double> coordinates,
  });

  Future<UserModel> signUp({
    required String username,
    required String email,
    required String password,
    required String repeatPassword,
    required List<double> coordinates,
  });

  Future<TokenModel> updatePassword({
    required String password,
    required String repeatPassword,
  });

  Future<void> updateUser(UserModel user);

  Future<bool> checkIfEmailExists(String email);

  Future<bool> checkIfUsernameExists(String username);

  Future<void> signOut();

  Future<TokenModel> refreshToken();
}

class AuthRemoteDatasrcImpl implements AuthRemoteDatasrc {
  const AuthRemoteDatasrcImpl({
    required GraphQLClient graphQLClient,
    required firebase.FirebaseAuth firebaseAuth,
  })  : _graphQLClient = graphQLClient,
        _firebaseAuth = firebaseAuth;

  final GraphQLClient _graphQLClient;
  final firebase.FirebaseAuth _firebaseAuth;
  @override
  Future<UserModel> authWithProvider({
    required String provider,
    required String providerId,
    required String email,
    required List<double> coordinates,
  }) async {
    try {
      final response = await _graphQLClient.mutate(
        MutationOptions(
          document: gql(GqlAuthMutation.authWithProviderMutation),
          variables: {
            'provider': provider,
            'provider_id': providerId,
            'email': email,
            'coordinates': coordinates,
          },
        ),
      );

      if (response.data case final d? when response.hasException == false) {
        final userCreds = await _firebaseAuth.signInWithCustomToken(
          d['authUserWithProvider']['tokens']['firebaseAuthToken'],
        );
        if (userCreds.user != null) {
          return UserModelMapper.fromMap(d['authUserWithProvider']['user']);
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
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
        isUnknownException: true,
      );
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final response = await _graphQLClient.mutate(
        MutationOptions(
          document: gql(GqlAuthMutation.forgotPasswordMutation),
          variables: {
            'email': email,
          },
        ),
      );
      if (response.exception case final exc?) {
        throw ApiException(
          message: exc.graphqlErrors.first.message,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(),
        isUnknownException: true,
      );
    }
  }

  @override
  Future<UserModel> signIn({
    required String emailOrUsername,
    required String password,
    required List<double> coordinates,
  }) async {
    try {
      final response = await _graphQLClient.mutate(
        MutationOptions(
          document: gql(GqlAuthMutation.signInMutation),
          variables: {
            "data": {
              'emailOrUsername': emailOrUsername,
              'password': password,
              'coordinates': coordinates,
            },
          },
        ),
      );
      if (response.data case final d? when response.hasException == false) {
        print(d['signInUser']['user']);
        final user = UserModelMapper.fromMap(d['signInUser']['user']);
        final userCreds = await _firebaseAuth.signInWithCustomToken(
          d['signInUser']['tokens']['firebaseAuthToken'],
        );
        if (userCreds.user != null) {
          final tokens = TokenModelMapper.fromMap(d['signInUser']['tokens']);
          return user.copyWith(tokens: tokens);
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
      } else {
        if (response.exception case final exc?) {
          throw ApiException(message: exc.graphqlErrors.first.message);
        } else {
          print(response.exception);
          throw ApiException(message: 'An error occurred');
        }
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      print(e);
      throw ApiException(
        message: e.toString(),
        isUnknownException: true,
      );
    }
  }

  @override
  Future<UserModel> signUp({
    required String username,
    required String email,
    required String password,
    required String repeatPassword,
    required List<double> coordinates,
  }) async {
    try {
      final response = await _graphQLClient.mutate(
        MutationOptions(
          document: gql(GqlAuthMutation.signUpMutation),
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
        final user = UserModelMapper.fromMap(d['signUpUser']['user']);
        final userCreds = await _firebaseAuth.signInWithCustomToken(
          d['signUpUser']['tokens']['firebaseAuthToken'],
        );
        if (userCreds.user != null) {
          final tokens = TokenModelMapper.fromMap(d['signUpUser']['tokens']);
          return user.copyWith(tokens: tokens);
        } else {
          throw ApiException(
            message: 'An error occurred',
          );
        }
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
  Future<TokenModel> updatePassword({
    required String password,
    required String repeatPassword,
  }) async {
    try {
      final response = await _graphQLClient.mutate(
        MutationOptions(
          document: gql(GqlAuthMutation.updatePasswordMutation),
          variables: {
            'password': password,
            'repeat_password': repeatPassword,
          },
        ),
      );
      if (response.data case final d? when response.hasException == false) {
        return TokenModelMapper.fromMap(d['updateUserPassword']['tokens']);
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
        isUnknownException: true,
      );
    }
  }

  @override
  Future<void> updateUser(UserModel user) async {
    try {
      if (user.location case final location?) {
        final response = await _graphQLClient.mutate(
          MutationOptions(
            document: gql(GqlAuthMutation.updateUserMutation),
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
        }
      } else {
        throw GpsException(message: 'Location not found');
      }
    } on ApiException {
      rethrow;
    } on GpsException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(),
        isUnknownException: true,
      );
    }
  }

  @override
  Future<bool> checkIfEmailExists(String email) async {
    try {
      final response = await _graphQLClient.query(
        QueryOptions(
          document: gql(GqlAuthQuerys.checkEmailExistsQuery),
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
      throw ApiException(
        message: e.toString(),
        isUnknownException: true,
      );
    }
  }

  @override
  Future<bool> checkIfUsernameExists(String username) async {
    try {
      final response = await _graphQLClient.query(
        QueryOptions(
          document: gql(GqlAuthQuerys.checkUsernameExistsQuery),
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
      throw ApiException(
        message: e.toString(),
        isUnknownException: true,
      );
    }
  }

  @override
  Future<TokenModel> refreshToken() async {
    try {
      final response = await _graphQLClient.query(
        QueryOptions(
          document: gql(GqlAuthQuerys.refreshToken),
          fetchPolicy: FetchPolicy.noCache,
        ),
      );

      if (response.data case final d? when response.hasException == false) {
        return TokenModelMapper.fromMap(d['refreshToken']);
      } else {
        if (response.exception case final exc?) {
          throw ApiException(message: exc.graphqlErrors.first.message);
        } else {
          throw ApiException(message: 'An error occurred');
        }
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(),
        isUnknownException: true,
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final response = await _graphQLClient.query(
        QueryOptions(
          document: gql(GqlAuthQuerys.signOut),
        ),
      );
      if (response.exception case final exc?) {
        throw ApiException(
          message: exc.graphqlErrors.first.message,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(),
        isUnknownException: true,
      );
    }
  }
}
