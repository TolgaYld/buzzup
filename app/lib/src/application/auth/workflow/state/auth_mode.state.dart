import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'auth_mode.state.mapper.dart';

@MappableClass()
sealed class AuthModeState with AuthModeStateMappable {
  const AuthModeState({
    required this.formKey,
    required this.numberOfTextFields,
  });
  final GlobalKey formKey;
  final int numberOfTextFields;
}

@MappableClass()
class SignInAuthModeState extends AuthModeState with SignInAuthModeStateMappable {
  const SignInAuthModeState({
    required super.formKey,
    required super.numberOfTextFields,
  });
}

@MappableClass()
class SignUpAuthModeState extends AuthModeState with SignUpAuthModeStateMappable {
  const SignUpAuthModeState({
    required super.formKey,
    required super.numberOfTextFields,
  });
}

@MappableClass()
class ForgotPasswordAuthModeState extends AuthModeState with ForgotPasswordAuthModeStateMappable {
  const ForgotPasswordAuthModeState({
    required super.formKey,
    required super.numberOfTextFields,
  });
}
