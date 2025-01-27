import 'dart:async';

import 'package:buzzup/core/common/refresh_token_manager.dart';
import 'package:buzzup/core/dependency_provider/auth.provider.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/src/application/auth/workflow/events/auth.event.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref) : super(const AuthInitialState()) {
    init();
  }

  final Ref ref;

  void init() {
    ref.listen<AsyncValue<AuthStatus>>(
      userIsAuthProvider,
      (previous, next) async {
        if (next.value == AuthStatus.authenticated) {
          state = SignedInState(null);
        } else {
          _signOutHandler();
        }
      },
    );
  }

  Future<void> event(AuthEvent event) async {
    state = const LoadingState();
    return switch (event) {
      SignInEvent() => await _signInHandler(event),
      SignUpEvent() => await _signUpHandler(event),
      AuthWithProviderEvent() => await _authWithProviderHandler(event),
      SignOutEvent() => await _signOutHandler(),
      UpdateUserEvent() => await _updateUserHandler(event),
      UpdatePasswordEvent() => await _updatePasswordHandler(event),
      ForgotPasswordEvent() => await _forgotPasswordHandler(event),
      RefreshTokenEvent() => await _refreshTokenHandler(),
    };
  }

  Future<void> _refreshTokenHandler() async {
    final refreshTokenManager = ref.read(refreshTokenManagerProvider);
    await refreshTokenManager.refreshToken();
  }

  Future<void> _signOutHandler() async {
    final signOutUsecase = await ref.read(signOutUsecaseProvider.future);
    await signOutUsecase();
    ref.invalidate(refreshTokenManagerProvider);
    state = const SignedOutState();
  }

  Future<void> _signInHandler(SignInEvent event) async {
    final signInUsecase = await ref.read(signInUsecaseProvider.future);

    final result = await signInUsecase(
      (
        emailOrUsername: event.emailOrUsername,
        password: event.password,
        coordinates: event.coordinates,
      ),
    );

    switch (result) {
      case Left(value: final failure):
        state = ErrorAuthState(
          message: failure.message,
          isUnknownException: failure.isUnknownException,
        );
        break;
      case Right(value: final user):
        state = SignedInState(user);
        await _refreshTokenHandler();
        break;
    }
  }

  Future<void> _signUpHandler(SignUpEvent event) async {
    final signUpUsecase = await ref.read(signUpUsecaseProvider.future);

    final result = await signUpUsecase(
      (
        email: event.email,
        password: event.password,
        repeatPassword: event.repeatPassword,
        username: event.username,
        coordinates: event.coordinates,
      ),
    );

    switch (result) {
      case Left(value: final failure):
        state = ErrorAuthState(
          message: failure.message,
          isUnknownException: failure.isUnknownException,
        );
        break;
      case Right(value: final user):
        state = SignedUpState(user);
        await _refreshTokenHandler();
        break;
    }
  }

  Future<void> _authWithProviderHandler(AuthWithProviderEvent event) async {
    final authWithProviderUsecase = await ref.read(authWithProviderUsecaseProvider.future);

    final result = await authWithProviderUsecase(
      (
        provider: event.provider,
        email: event.email,
        providerId: event.providerId,
        coordinates: event.coordinates,
      ),
    );

    switch (result) {
      case Left(value: final failure):
        state = ErrorAuthState(
          message: failure.message,
          isUnknownException: failure.isUnknownException,
        );
        break;
      case Right(value: final user):
        state = AuthenticatedWithProviderState(user);
        await _refreshTokenHandler();
        break;
    }
  }

  Future<void> _updateUserHandler(UpdateUserEvent event) async {
    final updateUserUsecase = await ref.read(updateUserUsecaseProvider.future);

    final result = await updateUserUsecase(event.user);

    switch (result) {
      case Left(value: final failure):
        state = ErrorAuthState(
          message: failure.message,
          isUnknownException: failure.isUnknownException,
        );
        break;
      case Right():
        state = const UserUpdatedState();
        await _refreshTokenHandler();
        break;
    }
  }

  Future<void> _updatePasswordHandler(UpdatePasswordEvent event) async {
    final updatePasswordUsecase = await ref.read(updatePasswordUsecaseProvider.future);

    final result = await updatePasswordUsecase(
      (
        password: event.password,
        repeatPassword: event.repeatPassword,
      ),
    );

    switch (result) {
      case Left(value: final failure):
        state = ErrorAuthState(
          message: failure.message,
          isUnknownException: failure.isUnknownException,
        );
        break;
      case Right():
        state = const PasswordChangedState();
        await _refreshTokenHandler();
        break;
    }
  }

  Future<void> _forgotPasswordHandler(ForgotPasswordEvent event) async {
    final forgotPasswordUsecase = await ref.read(forgotPasswordUsecaseProvider.future);

    final result = await forgotPasswordUsecase(event.email);

    switch (result) {
      case Left(value: final failure):
        state = ErrorAuthState(
          message: failure.message,
          isUnknownException: failure.isUnknownException,
        );
        break;
      case Right():
        state = const PasswordResettedState();
        break;
    }
  }

  @override
  void dispose() {
    ref.read(refreshTokenManagerProvider).dispose();
    super.dispose();
  }
}
