import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'auth_mode.state.mapper.dart';

@MappableClass()
sealed class AuthModeState with AuthModeStateMappable {
  const AuthModeState({
    required this.formKey,
  });
  final GlobalKey formKey;
}

@MappableClass()
class SignInAuthModeState extends AuthModeState with SignInAuthModeStateMappable {
  const SignInAuthModeState({
    required super.formKey,
  });
}

@MappableClass()
class SignUpAuthModeState extends AuthModeState with SignUpAuthModeStateMappable {
  const SignUpAuthModeState({
    required super.formKey,
  });
}

@MappableClass()
class ForgotPasswordAuthModeState extends AuthModeState with ForgotPasswordAuthModeStateMappable {
  const ForgotPasswordAuthModeState({
    required super.formKey,
  });
}
