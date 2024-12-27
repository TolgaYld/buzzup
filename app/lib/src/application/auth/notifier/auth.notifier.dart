import 'dart:async';

import 'package:buzzup/core/dependency_provider/auth.provider.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/core/utils/jwt_helper.dart';
import 'package:buzzup/src/application/auth/workflow/events/auth.event.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref) : super(const AuthInitialState());

  final Ref ref;
  Timer? _tokenTimer;

  Future<void> event(AuthEvent event) async {
    state = const LoadingState();
    return switch (event) {
      SignInEvent() => await _signInHandler(event),
      SignUpEvent() => await _signUpHandler(event),
      AuthWithProviderEvent() => await _authWithProviderHandler(event),
      SignOutEvent() => await _signOut(),
      UpdateUserEvent() => await _updateUserHandler(event),
      UpdatePasswordEvent() => await _updatePasswordHandler(event),
      ForgotPasswordEvent() => await _forgotPasswordHandler(event),
      RefreshTokenEvent() => await _refreshToken(),
    };
  }

  void _startTokenTimer(String token) {
    _tokenTimer?.cancel();
    final expiryDate = JwtHelper.getExpiryDate(token);
    if (expiryDate != null) {
      final duration = expiryDate.difference(DateTime.now().subtract(const Duration(minutes: 3)));
      _tokenTimer = Timer(duration, () async => await _signOut());
    }
  }

  Future<void> _refreshToken() async {
    final getToken = await ref.read(tokenProvider.future);
    final getRefreshToken = await ref.read(refreshTokenProvider.future);
    if (getToken != null && getRefreshToken != null) {
      final refreshTokenUseCase = await ref.read(refreshTokenUsecaseProvider.future);
      final result = await refreshTokenUseCase();
      print(result);
      if (result case Right(value: final newTokens)) {
        _startTokenTimer(newTokens.token);
        state = SignedInState(null);
      } else if (result is Left) {
        await _signOut();
      } else {
        await _signOut();
      }
    } else {
      await _signOut();
    }
  }

  Future<void> _signOut() async {
    _tokenTimer?.cancel();
    _tokenTimer = null;
    final signOutUsecase = await ref.read(signOutUsecaseProvider.future);
    await signOutUsecase();
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
        state = ErrorAuthState(failure.message);
        break;
      case Right(value: final user):
        state = SignedInState(user);
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
        state = ErrorAuthState(failure.message);
        break;
      case Right(value: final user):
        state = SignedUpState(user);
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
        state = ErrorAuthState(failure.message);
        break;
      case Right(value: final user):
        state = AuthenticatedWithProviderState(user);
        break;
    }
  }

  Future<void> _updateUserHandler(UpdateUserEvent event) async {
    final updateUserUsecase = await ref.read(updateUserUsecaseProvider.future);

    final result = await updateUserUsecase(event.user);

    switch (result) {
      case Left(value: final failure):
        state = ErrorAuthState(failure.message);
        break;
      case Right():
        state = const UserUpdatedState();
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
        state = ErrorAuthState(failure.message);
        break;
      case Right():
        state = const PasswordChangedState();
        break;
    }
  }

  Future<void> _forgotPasswordHandler(ForgotPasswordEvent event) async {
    final forgotPasswordUsecase = await ref.read(forgotPasswordUsecaseProvider.future);

    final result = await forgotPasswordUsecase(event.email);

    switch (result) {
      case Left(value: final failure):
        state = ErrorAuthState(failure.message);
        break;
      case Right():
        state = const PasswordResettedState();
        break;
    }
  }

  @override
  void dispose() {
    _tokenTimer?.cancel();
    super.dispose();
  }
}
