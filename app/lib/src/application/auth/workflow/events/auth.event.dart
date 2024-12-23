import 'package:buzzup/core/models/user.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  const SignInEvent({
    required this.emailOrUsername,
    required this.password,
    required this.coordinates,
  });

  final String emailOrUsername;
  final String password;
  final List<double> coordinates;
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent({
    required this.email,
    required this.password,
    required this.repeatPassword,
    required this.username,
    required this.coordinates,
  });

  final String email;
  final String password;
  final String repeatPassword;
  final String username;
  final List<double> coordinates;
}

class AuthWithProviderEvent extends AuthEvent {
  const AuthWithProviderEvent({
    required this.provider,
    required this.email,
    required this.providerId,
    required this.coordinates,
  });

  final String provider;
  final String email;
  final String providerId;
  final List<double> coordinates;
}

class UpdatePasswordEvent extends AuthEvent {
  const UpdatePasswordEvent({
    required this.password,
    required this.repeatPassword,
  });

  final String password;
  final String repeatPassword;
}

class UpdateUserEvent extends AuthEvent {
  const UpdateUserEvent(this.user);

  final User user;
}

class ForgotPasswordEvent extends AuthEvent {
  const ForgotPasswordEvent(this.email);

  final String email;
}

class RefreshTokenEvent extends AuthEvent {
  const RefreshTokenEvent();
}
