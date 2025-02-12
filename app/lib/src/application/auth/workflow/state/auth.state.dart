import 'package:buzzup/core/common/domain/entities/all_entities.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'auth.state.mapper.dart';

@MappableClass()
sealed class AuthState with AuthStateMappable {
  const AuthState();
}

@MappableClass()
class AuthInitialState extends AuthState with AuthInitialStateMappable {
  const AuthInitialState();
}

@MappableClass()
class SignedInState extends AuthState with SignedInStateMappable {
  const SignedInState(this.user);

  final UserEntity? user;
}

@MappableClass()
class SignedUpState extends AuthState with SignedUpStateMappable {
  const SignedUpState(this.user);

  final UserEntity user;
}

@MappableClass()
class SignedOutState extends AuthState with SignedOutStateMappable {
  const SignedOutState();
}

@MappableClass()
class AuthenticatedWithProviderState extends AuthState with AuthenticatedWithProviderStateMappable {
  const AuthenticatedWithProviderState(this.user);

  final UserEntity user;
}

@MappableClass()
class UserUpdatedState extends AuthState with UserUpdatedStateMappable {
  const UserUpdatedState();
}

@MappableClass()
class PasswordChangedState extends AuthState with PasswordChangedStateMappable {
  const PasswordChangedState();
}

@MappableClass()
class PasswordResettedState extends AuthState with PasswordResettedStateMappable {
  const PasswordResettedState();
}

@MappableClass()
class LoadingState extends AuthState with LoadingStateMappable {
  const LoadingState();
}

@MappableClass()
class ErrorAuthState extends AuthState with ErrorAuthStateMappable {
  const ErrorAuthState({
    required this.message,
    this.isUnknownException = false,
  });
  final bool isUnknownException;
  final String message;
}
