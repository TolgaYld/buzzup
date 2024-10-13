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
    required GlobalKey<FormState> signUpFormKey,
    required this.onChangedUsername,
    required this.onChangedEmail,
    required this.onChangedPassword,
    required this.onChangedRepeatPassword,
    super.key,
  }) : _signUpFormKey = signUpFormKey;

  final GlobalKey<FormState> _signUpFormKey;
  final Function(String) onChangedUsername;
  final Function(String) onChangedEmail;
  final Function(String) onChangedPassword;
  final Function(String) onChangedRepeatPassword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final l10n = useL10n();

    final usernameController = useTextEditingController();
    final usernameFocusNode = useFocusNode();
    final emailController = useTextEditingController();
    final emailFocusNode = useFocusNode();
    final passwordController = useTextEditingController();
    final passwordFocusNode = useFocusNode();
    final repeatPasswordController = useTextEditingController();
    final repeatPasswordFocusNode = useFocusNode();

    // formz inputs
    final username = useState(const UsernameInput.pure());
    final email = useState(const EmailInput.pure());
    final password = useState(const PasswordInput.pure());
    final repeatPassword = useState(const RepeatPasswordInput.pure(''));

    // Zustand, um festzuhalten, ob validiert wurde
    final hasTriedSubmit = useState(false);

    // Überprüfe, ob das Formular erfolgreich validiert ist
    bool validateForm() {
      final isValid = _signUpFormKey.currentState?.validate() ?? false;
      return isValid;
    }

    // Fehlernachricht für jedes Feld (nur nach dem Klick auf den Button anzeigen)
    String? getUsernameErrorText() {
      if (!hasTriedSubmit.value) return null; // Keine Fehler, bevor der Button geklickt wurde
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
    void _onUsernameChanged(String value) {
      username.value = UsernameInput.dirty(value);
      if (hasTriedSubmit.value) {
        _signUpFormKey.currentState?.validate();
      }
      onChangedUsername(value);
    }

    void _onEmailChanged(String value) {
      email.value = EmailInput.dirty(value);
      if (hasTriedSubmit.value) {
        _signUpFormKey.currentState?.validate();
      }
      onChangedEmail(value);
    }

    void _onPasswordChanged(String value) {
      password.value = PasswordInput.dirty(value);
      repeatPassword.value = RepeatPasswordInput.dirty(value, repeatPasswordController.text);
      if (hasTriedSubmit.value) {
        _signUpFormKey.currentState?.validate();
      }
      onChangedPassword(value);
    }

    void _onRepeatPasswordChanged(String value) {
      repeatPassword.value = RepeatPasswordInput.dirty(passwordController.text, value);
      if (hasTriedSubmit.value) {
        _signUpFormKey.currentState?.validate();
      }
      onChangedRepeatPassword(value);
    }

    return Form(
      key: _signUpFormKey,
      autovalidateMode: AutovalidateMode.disabled, // Autovalidierung deaktiviert
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFieldWidget(
            controller: usernameController,
            focusNode: usernameFocusNode,
            onChanged: _onUsernameChanged,
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
