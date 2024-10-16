import 'package:buzzup/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:buzzup/src/presentation/pages/auth/validation/auth_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpWidget extends HookConsumerWidget {
  const SignUpWidget({
    required this.signUpFormKey,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.repeatPasswordController,
    required this.usernameFocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.repeatPasswordFocusNode,
    super.key,
  });

  final GlobalKey<FormState> signUpFormKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;
  final FocusNode usernameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode repeatPasswordFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final l10n = useL10n();

    final username = useState(const UsernameInput.pure());
    final email = useState(const EmailInput.pure());
    final password = useState(const PasswordInput.pure());
    final repeatPassword = useState(const RepeatPasswordInput.pure(''));

    final hasTriedSubmit = useState(false);

    bool validateForm() {
      final isValid = signUpFormKey.currentState?.validate() ?? false;
      return isValid;
    }

    // Fehlernachricht für jedes Feld (nur nach dem Klick auf den Button anzeigen)
    String? getUsernameErrorText() {
      if (!hasTriedSubmit.value) return null;
      return username.value.isNotValid ? 'Invalid username' : null;
    }

    String? getEmailErrorText() {
      if (!hasTriedSubmit.value) return null;
      return email.value.isNotValid ? 'Invalid email' : null;
    }

    String? getPasswordErrorText() {
      if (!hasTriedSubmit.value) return null;
      return password.value.isNotValid ? 'Invalid password' : null;
    }

    String? getRepeatPasswordErrorText() {
      if (!hasTriedSubmit.value) return null;
      return repeatPassword.value.isNotValid ? 'Passwords do not match' : null;
    }

    // Validierung bei der Eingabe (erst nach dem Klick auf den Button aktivieren)
    void _onUsernameChanged() {
      username.value = UsernameInput.dirty(usernameController.text);
      if (hasTriedSubmit.value) {
        signUpFormKey.currentState?.validate();
      }
    }

    void _onEmailChanged(String value) {
      email.value = EmailInput.dirty(value);
      if (hasTriedSubmit.value) {
        signUpFormKey.currentState?.validate();
      }
    }

    void _onPasswordChanged(String value) {
      password.value = PasswordInput.dirty(value);
      repeatPassword.value = RepeatPasswordInput.dirty(value, repeatPasswordController.text);
      if (hasTriedSubmit.value) {
        signUpFormKey.currentState?.validate();
      }
    }

    void _onRepeatPasswordChanged(String value) {
      repeatPassword.value = RepeatPasswordInput.dirty(passwordController.text, value);
      if (hasTriedSubmit.value) {
        signUpFormKey.currentState?.validate();
      }
    }

    return Form(
      key: signUpFormKey,
      autovalidateMode: AutovalidateMode.disabled, // Autovalidierung deaktiviert
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFieldWidget(
            controller: usernameController,
            focusNode: usernameFocusNode,
            onChanged: (_) => _onUsernameChanged(),
            icon: Icon(
              Icons.person,
              color: theme.colorScheme.onPrimary,
            ),
            hintText: l10n.username,
            errorText: getUsernameErrorText(), // Fehlertext nur anzeigen, wenn Button geklickt wurde
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: emailController,
            focusNode: emailFocusNode,
            onChanged: _onEmailChanged,
            hintText: l10n.email_adress,
            icon: Icon(
              Icons.email,
              color: theme.colorScheme.onPrimary,
            ),
            errorText: getEmailErrorText(), // Fehlertext nur anzeigen, wenn Button geklickt wurde
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: passwordController,
            focusNode: passwordFocusNode,
            onChanged: _onPasswordChanged,
            icon: const Icon(Icons.lock),
            hintText: l10n.password,
            errorText: getPasswordErrorText(), // Fehlertext nur anzeigen, wenn Button geklickt wurde
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: repeatPasswordController,
            focusNode: repeatPasswordFocusNode,
            onChanged: _onRepeatPasswordChanged,
            icon: const Icon(Icons.lock),
            hintText: l10n.repeat_password,
            errorText: getRepeatPasswordErrorText(), // Fehlertext nur anzeigen, wenn Button geklickt wurde
          ),
        ],
      ),
    );
  }
}
