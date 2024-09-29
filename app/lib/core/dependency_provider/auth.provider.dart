import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:buzzup/core/common/constants.dart';
import 'package:buzzup/core/common/env/environment.dart';
import 'package:buzzup/src/data/datasources/auth/auth_local_datasrc.dart';
import 'package:buzzup/src/data/datasources/auth/auth_remote_datasrc.dart';
import 'package:buzzup/src/data/repositories/auth/auth_repo_impl.dart';
import 'package:buzzup/src/domain/repositories/auth/auth_repo.dart';
import 'package:buzzup/src/domain/usecases/auth/auth_with_provider_usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/check_email_exists_usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/check_username_exists_usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/sign_in_usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/sign_up_usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/update_password_usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/update_user_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Providers for External Dependencies
final flutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final tokenProvider = FutureProvider<String?>((ref) async {
  final storage = ref.read(flutterSecureStorageProvider);
  return await storage.read(key: kCachedTokenKey);
});

final refreshTokenProvider = FutureProvider<String?>((ref) async {
  final storage = ref.read(flutterSecureStorageProvider);
  return await storage.read(key: kCachedRefreshTokenKey);
});

// GraphQL Client Provider
final graphQLClientProvider = FutureProvider<GraphQLClient>((ref) async {
  final box = await HiveStore.openBox(kGraphqlHiveBoxName);
  final link = AuthLink(
    getToken: () async => "Bearer ${await ref.read(tokenProvider.future)}",
  ).concat(
    HttpLink(
      switch (Environment.environment == "test") {
        true => switch (Platform.isAndroid) {
            true => "http://10.0.2.2:8000/graphql",
            false => Environment.baseUrl,
          },
        false => Environment.baseUrl,
      },
      defaultHeaders: {
        "refreshToken": await ref.read(refreshTokenProvider.future) ?? "",
      },
    ),
  );

  return GraphQLClient(
    link: link,
    cache: GraphQLCache(store: HiveStore(box)),
  );
});

// Datasources Providers
final authRemoteDataSourceProvider = FutureProvider<AuthRemoteDatasrc>((ref) async {
  final graphqlClient = await ref.read(graphQLClientProvider.future);
  return AuthRemoteDatasrcImpl(graphqlClient);
});

final authLocalDataSourceProvider = Provider<AuthLocalDatasrc>((ref) {
  return AuthLocalDatasrcImpl(ref.read(flutterSecureStorageProvider));
});

// Repository Provider
final authRepoProvider = FutureProvider<AuthRepo>((ref) async {
  final authRemoteDatasrc = await ref.read(authRemoteDataSourceProvider.future);
  return AuthRepoImpl(
    remoteDatasrc: authRemoteDatasrc,
    localDatasrc: ref.read(authLocalDataSourceProvider),
  );
});

// Usecases Providers
final checkEmailExistsUsecaseProvider = FutureProvider<CheckEmailExistsUsecase>((ref) async {
  final authRepo = await ref.read(authRepoProvider.future);
  return CheckEmailExistsUsecase(authRepo);
});

final checkUsernameExistsUsecaseProvider = FutureProvider<CheckUsernameExistsUsecase>((ref) async {
  final authRepo = await ref.read(authRepoProvider.future);
  return CheckUsernameExistsUsecase(authRepo);
});

final signInUsecaseProvider = FutureProvider<SignInUsecase>((ref) async {
  final authRepo = await ref.read(authRepoProvider.future);
  return SignInUsecase(authRepo);
});

final signUpUsecaseProvider = FutureProvider<SignUpUsecase>((ref) async {
  final authRepo = await ref.read(authRepoProvider.future);
  return SignUpUsecase(authRepo);
});

final authWithProviderUsecaseProvider = FutureProvider<AuthWithProviderUsecase>((ref) async {
  final authRepo = await ref.read(authRepoProvider.future);
  return AuthWithProviderUsecase(authRepo);
});

final updateUserUsecaseProvider = FutureProvider<UpdateUserUsecase>((ref) async {
  final authRepo = await ref.read(authRepoProvider.future);
  return UpdateUserUsecase(authRepo);
});

final forgotPasswordUsecaseProvider = FutureProvider<ForgotPasswordUsecase>((ref) async {
  final authRepo = await ref.read(authRepoProvider.future);
  return ForgotPasswordUsecase(authRepo);
});

final updatePasswordUsecaseProvider = FutureProvider<UpdatePasswordUsecase>((ref) async {
  final authRepo = await ref.read(authRepoProvider.future);
  return UpdatePasswordUsecase(authRepo);
});
