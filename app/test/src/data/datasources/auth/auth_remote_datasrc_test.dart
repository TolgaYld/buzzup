import 'dart:convert';

import 'package:buzzup/core/errors/exception.dart';
import 'package:buzzup/core/models/all_models.dart';
import 'package:buzzup/core/utils/graphql/auth/gql_auth_mutations.dart';
import 'package:buzzup/core/utils/graphql/auth/gql_auth_querys.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:buzzup/core/utils/typedefs.dart';
import 'package:buzzup/src/data/datasources/auth/auth.remote.datasrc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/reader.dart';
import 'auth_remote_datasrc_test.mocks.dart';

@GenerateMocks([GraphQLClient, firebase.FirebaseAuth])
void main() {
  late MockGraphQLClient client;
  late MockFirebaseAuth firebaseAuth;
  late AuthRemoteDatasrc datasrc;
  setUp(() {
    client = MockGraphQLClient();
    firebaseAuth = MockFirebaseAuth();
    datasrc = AuthRemoteDatasrcImpl(graphQLClient: client, firebaseAuth: firebaseAuth);
  });

  final tUserModel = User.empty();

  group('signUp', () {
    final data = jsonDecode(
      fixture('user/sign_up/user_raw_with_tokens_from_server.json'),
    ) as DataMap;
    test('should return [User] when call to remote source is successful', () async {
      if (tUserModel.location case final location?) {
        final options = MutationOptions(
          document: gql(GqlAuthMutation.signUpMutation),
          variables: {
            'username': tUserModel.username,
            'email': tUserModel.email,
            'coordinates': location.coordinates,
            'password': '',
            'repeat_password': '',
          },
        );
        when(client.mutate<dynamic>(any)).thenAnswer(
          (_) async => QueryResult(
            data: data,
            options: options,
            source: QueryResultSource.network,
          ),
        );

        final result = await datasrc.signUp(
          username: tUserModel.username ?? "",
          email: tUserModel.email ?? "",
          password: '',
          repeatPassword: '',
          coordinates: location.coordinates,
        );

        expect(result, tUserModel);

        verify(client.mutate(options)).called(1);

        verifyNoMoreInteractions(client);
      }
    });

    test(
        'should throw an [ApiException] when call to remote source is '
        'unsuccessful', () async {
      if (tUserModel.location case final location?) {
        final options = MutationOptions(
          document: gql(GqlAuthMutation.signUpMutation),
          variables: {
            'username': tUserModel.username,
            'email': tUserModel.email,
            'coordinates': location.coordinates,
            'password': '',
            'repeat_password': '',
          },
        );
        when(client.mutate<dynamic>(any)).thenThrow(
          ApiException(message: "Couldn't create user"),
        );

        final methodCall = datasrc.signUp;

        expect(
          () => methodCall(
            username: tUserModel.username ?? "",
            email: tUserModel.email ?? "",
            password: '',
            repeatPassword: '',
            coordinates: location.coordinates,
          ),
          throwsA(
            ApiException(message: "Couldn't create user"),
          ),
        );

        verify(client.mutate(options)).called(1);

        verifyNoMoreInteractions(client);
      }
    });
  });

  group('signIn', () {
    final data = jsonDecode(
      fixture('user/sign_in/user_raw_with_tokens_from_server.json'),
    ) as DataMap;
    test(
        'should return [User] when call to remote source is'
        ' successful', () async {
      final options = MutationOptions(
        document: gql(GqlAuthMutation.signInMutation),
        variables: {
          'emailOrUsername': tUserModel.username,
          'password': '',
        },
      );
      when(client.mutate<dynamic>(any)).thenAnswer(
        (_) async => QueryResult(
          data: data,
          options: options,
          source: QueryResultSource.network,
        ),
      );

      final result = await datasrc.signIn(
        emailOrUsername: tUserModel.username ?? "",
        password: '',
        coordinates: [],
      );

      expect(result, tUserModel);

      verify(client.mutate(options)).called(1);

      verifyNoMoreInteractions(client);
    });

    test(
        'should throw an [ApiException] when call to remote source is '
        'unsuccessful', () async {
      final options = MutationOptions(
        document: gql(GqlAuthMutation.signInMutation),
        variables: {
          'emailOrUsername': tUserModel.username,
          'password': '',
        },
      );
      when(client.mutate<dynamic>(any)).thenThrow(
        ApiException(message: "Couldn't create user"),
      );

      final methodCall = datasrc.signIn;

      expect(
        () => methodCall(
          emailOrUsername: tUserModel.username ?? "",
          password: '',
          coordinates: [],
        ),
        throwsA(
          ApiException(message: "Couldn't create user"),
        ),
      );

      verify(client.mutate(options)).called(1);

      verifyNoMoreInteractions(client);
    });
  });

  group('authWithProvider', () {
    final data = jsonDecode(
      fixture('user/auth_with_provider/user_raw_with_tokens_from_server.json'),
    ) as DataMap;
    test(
        'should return [User] when call to remote source is'
        ' successful', () async {
      if (tUserModel.location case final location?) {
        final options = MutationOptions(
          document: gql(GqlAuthMutation.authWithProviderMutation),
          variables: {
            'coordinates': location.coordinates,
            'email': tUserModel.email,
            'provider': "google",
            'provider_id': 'empty',
          },
        );
        when(client.mutate<dynamic>(any)).thenAnswer(
          (_) async => QueryResult(
            data: data,
            options: options,
            source: QueryResultSource.network,
          ),
        );

        final result = await datasrc.authWithProvider(
          email: tUserModel.email ?? "",
          provider: "google",
          providerId: 'empty',
          coordinates: location.coordinates,
        );

        expect(
          result,
          tUserModel.copyWith(
            autoGeneratedUsername: true,
            providerId: 'empty',
            provider: "google",
          ),
        );

        verify(client.mutate(options)).called(1);

        verifyNoMoreInteractions(client);
      }
    });

    test(
        'should throw an [ApiException] when call to remote source is '
        'unsuccessful', () async {
      if (tUserModel.location case final location?) {
        final options = MutationOptions(
          document: gql(GqlAuthMutation.authWithProviderMutation),
          variables: {
            'coordinates': location.coordinates,
            'email': tUserModel.email,
            'provider': "google",
            'provider_id': 'empty',
          },
        );
        when(client.mutate<dynamic>(any)).thenThrow(
          ApiException(message: "Couldn't create user"),
        );

        final methodCall = datasrc.authWithProvider;

        expect(
          () => methodCall(
            email: tUserModel.email ?? "",
            provider: "google",
            providerId: 'empty',
            coordinates: location.coordinates,
          ),
          throwsA(
            ApiException(message: "Couldn't create user"),
          ),
        );

        verify(client.mutate(options)).called(1);

        verifyNoMoreInteractions(client);
      }
    });
  });

  group('forgotPassword', () {
    final data = jsonDecode(
      fixture(
        'user/forgot_password/forgot_password_raw_response_from_server.json',
      ),
    ) as DataMap;
    test(
        'should send [User] reset password e-mail when call to remote source is'
        ' successful', () async {
      final options = MutationOptions(
        document: gql(GqlAuthMutation.forgotPasswordMutation),
        variables: {
          'email': tUserModel.email,
        },
      );
      when(client.mutate<dynamic>(any)).thenAnswer(
        (_) async => QueryResult(
          data: data,
          options: options,
          source: QueryResultSource.network,
        ),
      );

      final methodCall = datasrc.forgotPassword;

      expect(methodCall(tUserModel.email ?? ""), completes);

      verify(client.mutate(options)).called(1);

      verifyNoMoreInteractions(client);
    });

    test(
        'should throw an [ApiException] when call to remote source is '
        'unsuccessful', () async {
      final options = MutationOptions(
        document: gql(GqlAuthMutation.forgotPasswordMutation),
        variables: {
          'email': tUserModel.email,
        },
      );
      when(client.mutate<dynamic>(any)).thenThrow(
        ApiException(message: "Couldn't reset password"),
      );

      final methodCall = datasrc.forgotPassword;

      expect(
        () => methodCall(tUserModel.email ?? ""),
        throwsA(
          ApiException(message: "Couldn't reset password"),
        ),
      );

      verify(client.mutate(options)).called(1);

      verifyNoMoreInteractions(client);
    });
  });

  group('updatePassword', () {
    final data = jsonDecode(
      fixture('user/update_password/user_raw_with_tokens_from_server.json'),
    ) as DataMap;

    final tTokenModel = Token.empty();
    test(
        'should execute a successful call to datasource and return '
        '[TokenModel]', () async {
      final options = MutationOptions(
        document: gql(GqlAuthMutation.updatePasswordMutation),
        variables: const {
          'password': '',
          'repeat_password': '',
        },
      );
      when(client.mutate<dynamic>(any)).thenAnswer(
        (_) async => QueryResult(
          data: data,
          options: options,
          source: QueryResultSource.network,
        ),
      );

      final result = await datasrc.updatePassword(
        password: '',
        repeatPassword: '',
      );

      expect(result, tTokenModel);

      verify(client.mutate(options)).called(1);

      verifyNoMoreInteractions(client);
    });

    test(
        'should throw an [ApiException] when call to remote source is '
        'unsuccessful', () async {
      final options = MutationOptions(
        document: gql(GqlAuthMutation.updatePasswordMutation),
        variables: const {
          'password': '',
          'repeat_password': '',
        },
      );
      when(client.mutate<dynamic>(any)).thenThrow(
        ApiException(message: "Couldn't change password"),
      );

      final methodCall = datasrc.updatePassword;

      expect(
        () => methodCall(
          password: '',
          repeatPassword: '',
        ),
        throwsA(
          ApiException(message: "Couldn't change password"),
        ),
      );

      verify(client.mutate(options)).called(1);

      verifyNoMoreInteractions(client);
    });
  });

  group('updateUser', () {
    final data = jsonDecode(
      fixture(
        'user/update_user/user_raw_with_tokens_from_server.json',
      ),
    ) as DataMap;

    test('should execute a successful call to remote source', () async {
      if (tUserModel.location case final location?) {
        final options = MutationOptions(
          document: gql(GqlAuthMutation.updateUserMutation),
          variables: {
            'coordinates': location.copyWith(coordinates: [9.36, 9.36]).coordinates,
            'username': tUserModel.username,
          },
        );
        when(client.mutate<dynamic>(any)).thenAnswer(
          (_) async => QueryResult(
            data: data,
            options: options,
            source: QueryResultSource.network,
          ),
        );

        final methodCall = datasrc.updateUser;

        expect(
          methodCall(
            tUserModel.copyWith(
              location: location.copyWith(
                coordinates: [9.36, 9.36],
              ),
            ),
          ),
          completes,
        );

        verify(client.mutate(options)).called(1);
        verifyNoMoreInteractions(client);
      }
    });

    test(
        'should throw an [ApiException] when call to remote source is '
        'unsuccessful', () async {
      if (tUserModel.location case final location?) {
        final options = MutationOptions(
          document: gql(GqlAuthMutation.updateUserMutation),
          variables: {
            'coordinates': location.copyWith(coordinates: [9.36, 9.36]).coordinates,
            'username': tUserModel.username,
          },
        );
        when(client.mutate<dynamic>(any)).thenThrow(
          ApiException(message: "Couldn't reset password"),
        );

        final methodCall = datasrc.updateUser;

        expect(
          () => methodCall(
            tUserModel.copyWith(
              location: location.copyWith(coordinates: [9.36, 9.36]),
            ),
          ),
          throwsA(
            ApiException(message: "Couldn't reset password"),
          ),
        );

        verify(client.mutate(options)).called(1);

        verifyNoMoreInteractions(client);
      }
    });
  });

  group('checkIfEmailExists', () {
    final data = jsonDecode(
      fixture('user/check_if_email_exists/email_raw_from_server.json'),
    ) as DataMap;
    test(
        'should return boolean when call to remote source is'
        ' successful', () async {
      final options = QueryOptions(
        document: gql(GqlAuthQuerys.checkEmailExistsQuery),
        variables: {
          'email': tUserModel.email,
        },
      );
      when(client.query<dynamic>(any)).thenAnswer(
        (_) async => QueryResult(
          data: data,
          options: options,
          source: QueryResultSource.network,
        ),
      );

      final result = await datasrc.checkIfEmailExists(
        tUserModel.email ?? "",
      );

      expect(result, isA<bool>());

      verify(client.query(options)).called(1);

      verifyNoMoreInteractions(client);
    });

    test(
        'should throw an [ApiException] when call to remote source is '
        'unsuccessful', () async {
      final options = QueryOptions(
        document: gql(GqlAuthQuerys.checkEmailExistsQuery),
        variables: {
          'email': tUserModel.email,
        },
      );
      when(client.query<dynamic>(any)).thenThrow(
        ApiException(message: "Couldn't query email"),
      );

      final methodCall = datasrc.checkIfEmailExists;

      expect(
        () => methodCall(
          tUserModel.email ?? "",
        ),
        throwsA(
          ApiException(message: "Couldn't query email"),
        ),
      );

      verify(client.query(options)).called(1);

      verifyNoMoreInteractions(client);
    });
  });

  group('checkIfUsernameExists', () {
    final data = jsonDecode(
      fixture('user/check_if_username_exists/username_raw_from_server.json'),
    ) as DataMap;
    test(
        'should return boolean when call to remote source is'
        ' successful', () async {
      final options = QueryOptions(
        document: gql(GqlAuthQuerys.checkUsernameExistsQuery),
        variables: {
          'username': tUserModel.username,
        },
      );
      when(client.query<dynamic>(any)).thenAnswer(
        (_) async => QueryResult(
          data: data,
          options: options,
          source: QueryResultSource.network,
        ),
      );

      final result = await datasrc.checkIfUsernameExists(
        tUserModel.username ?? "",
      );

      expect(result, isA<bool>());

      verify(client.query(options)).called(1);

      verifyNoMoreInteractions(client);
    });

    test(
        'should throw an [ApiException] when call to remote source is '
        'unsuccessful', () async {
      final options = QueryOptions(
        document: gql(GqlAuthQuerys.checkUsernameExistsQuery),
        variables: {
          'username': tUserModel.username,
        },
      );
      when(client.query<dynamic>(any)).thenThrow(
        ApiException(message: "Couldn't query username"),
      );

      final methodCall = datasrc.checkIfUsernameExists;

      expect(
        () => methodCall(
          tUserModel.username ?? "",
        ),
        throwsA(
          ApiException(message: "Couldn't query username"),
        ),
      );

      verify(client.query(options)).called(1);

      verifyNoMoreInteractions(client);
    });
  });
}
