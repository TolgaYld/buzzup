import 'package:buzzup/core/dependency_provider/auth.provider.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/src/application/auth/workflow/events/auth.event.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref) : super(const InitialState());

  final Ref ref;

  Future<void> event(AuthEvent event) async {
    state = const LoadingState();
    switch (event) {
      case SignInEvent():
        await _signInHandler(event);
        break;
      case SignUpEvent():
        await _signUpHandler(event);
        break;
      case AuthWithProviderEvent():
        await _authWithProviderHandler(event);
        break;
      case UpdateUserEvent():
        await _updateUserHandler(event);
        break;
      case UpdatePasswordEvent():
        await _updatePasswordHandler(event);
        break;
      case ForgotPasswordEvent():
        await _forgotPasswordHandler(event);
        break;
    }
  }

  Future<void> _signInHandler(SignInEvent event) async {
    final signInUsecase = await ref.read(signInUsecaseProvider.future);

    final result = await signInUsecase(
      (
        emailOrUsername: event.emailOrUsername,
        password: event.password,
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
    final authWithProviderUsecase =
        await ref.read(authWithProviderUsecaseProvider.future);

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
    final updatePasswordUsecase =
        await ref.read(updatePasswordUsecaseProvider.future);

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
    final forgotPasswordUsecase =
        await ref.read(forgotPasswordUsecaseProvider.future);

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
}
