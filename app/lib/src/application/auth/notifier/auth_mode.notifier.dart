import 'package:buzzup/src/application/auth/workflow/state/auth_mode.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class AuthModeNotifier extends StateNotifier<AuthModeState> {
  AuthModeNotifier()
      : super(
          SignInAuthModeState(
            formKey: AuthModeNotifier.signInFormKey,
          ),
        );

  static final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  void signIn() {
    state = SignInAuthModeState(
      formKey: signInFormKey,
    );
  }

  void signUp() {
    state = SignUpAuthModeState(
      formKey: signUpFormKey,
    );
  }

  void forgotPassword() {
    state = ForgotPasswordAuthModeState(
      formKey: forgotPasswordFormKey,
    );
  }
}
