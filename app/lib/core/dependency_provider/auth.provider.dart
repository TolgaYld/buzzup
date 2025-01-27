import 'package:buzzup/core/dependency_provider/api_client.provider.dart';
import 'package:buzzup/src/domain/usecases/auth/refresh_token.usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/sign_out.usecase.dart';
import 'package:buzzup/src/data/datasources/auth/auth.local.datasrc.dart';
import 'package:buzzup/src/data/datasources/auth/auth.remote.datasrc.dart';
import 'package:buzzup/src/data/repositories/auth/auth.repo.impl.dart';
import 'package:buzzup/src/domain/repositories/auth/auth.repo.dart';
import 'package:buzzup/src/domain/usecases/auth/auth_with_provider.usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/check_email_exists.usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/check_username_exists.usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/forgot_password.usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/sign_in.usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/sign_up.usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/update_password.usecase.dart';
import 'package:buzzup/src/domain/usecases/auth/update_user.usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Datasources Providers
final authRemoteDatasourceProvider = FutureProvider<AuthRemoteDatasrc>((ref) async {
  final graphqlClient = await ref.watch(graphQLClientProvider.future);
  return AuthRemoteDatasrcImpl(graphqlClient);
});

final authLocalDatasourceProvider = Provider<AuthLocalDatasrc>((ref) {
  return AuthLocalDatasrcImpl(ref.watch(flutterSecureStorageProvider));
});

// Repository Provider
final authRepoProvider = FutureProvider<AuthRepo>((ref) async {
  final authRemoteDatasrc = await ref.watch(authRemoteDatasourceProvider.future);
  return AuthRepoImpl(
    remoteDatasrc: authRemoteDatasrc,
    localDatasrc: ref.watch(authLocalDatasourceProvider),
  );
});

// Usecases Providers
final checkEmailExistsUsecaseProvider = FutureProvider<CheckEmailExistsUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return CheckEmailExistsUsecase(authRepo);
});

final checkUsernameExistsUsecaseProvider = FutureProvider<CheckUsernameExistsUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return CheckUsernameExistsUsecase(authRepo);
});

final refreshTokenUsecaseProvider = FutureProvider<RefreshTokenUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return RefreshTokenUsecase(authRepo);
});

final signInUsecaseProvider = FutureProvider<SignInUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return SignInUsecase(authRepo);
});

final signOutUsecaseProvider = FutureProvider<SignOutUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return SignOutUsecase(authRepo);
});

final signUpUsecaseProvider = FutureProvider<SignUpUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return SignUpUsecase(authRepo);
});

final authWithProviderUsecaseProvider = FutureProvider<AuthWithProviderUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return AuthWithProviderUsecase(authRepo);
});

final updateUserUsecaseProvider = FutureProvider<UpdateUserUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return UpdateUserUsecase(authRepo);
});

final forgotPasswordUsecaseProvider = FutureProvider<ForgotPasswordUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return ForgotPasswordUsecase(authRepo);
});

final updatePasswordUsecaseProvider = FutureProvider<UpdatePasswordUsecase>((ref) async {
  final authRepo = await ref.watch(authRepoProvider.future);
  return UpdatePasswordUsecase(authRepo);
});
