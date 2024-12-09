import 'package:buzzup/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:buzzup/core/common/widgets/loading_indicator.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:buzzup/src/application/auth/provider/auth.provider.dart';
import 'package:buzzup/src/application/auth/workflow/events/auth.event.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:buzzup/src/presentation/pages/auth/validation/auth_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpWidget extends HookConsumerWidget {
  const SignUpWidget({
    required this.validateMode,
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
  final AutovalidateMode validateMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final l10n = useL10n();
    final authState = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);
    final passwordIsVisible = useState(false);
    final repeatPasswordIsVisible = useState(false);
    final username = useState(const UsernameInput.pure());
    final email = useState(const EmailInput.pure());
    final password = useState(const PasswordInput.pure());
    final repeatPassword = useState(const RepeatPasswordInput.pure(""));

    useEffect(
      () {
        username.value = UsernameInput.dirty(usernameController.text);
        email.value = EmailInput.dirty(emailController.text);
        password.value = PasswordInput.dirty(passwordController.text);
        repeatPassword.value = RepeatPasswordInput.dirty(passwordController.text, repeatPasswordController.text);
        return null;
      },
      [],
    );

    void onUsernameChanged() {
      username.value = UsernameInput.dirty(usernameController.text);
      if (validateMode == AutovalidateMode.always) {
        signUpFormKey.currentState?.validate();
      }
    }

    void onEmailChanged(String value) {
      email.value = EmailInput.dirty(value);
      if (validateMode == AutovalidateMode.always) {
        signUpFormKey.currentState?.validate();
      }
    }

    void onPasswordChanged(String value) {
      password.value = PasswordInput.dirty(value);
      repeatPassword.value = RepeatPasswordInput.dirty(value, "");
      repeatPassword.value = RepeatPasswordInput.dirty(value, repeatPasswordController.text);
      if (validateMode == AutovalidateMode.always) {
        signUpFormKey.currentState?.validate();
      }
    }

    void onRepeatPasswordChanged(String value) {
      password.value = PasswordInput.dirty(passwordController.text);
      repeatPassword.value = RepeatPasswordInput.dirty(passwordController.text, value);
      if (validateMode == AutovalidateMode.always) {
        signUpFormKey.currentState?.validate();
      }
    }

    return Form(
      key: signUpFormKey,
      autovalidateMode: validateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFieldWidget(
            controller: usernameController,
            focusNode: usernameFocusNode,
            validator: (_) => switch (username.value.error) {
              UsernameValidationError.empty => l10n.required,
              UsernameValidationError.spaces => l10n.not_empty_spaces,
              UsernameValidationError.invalid => l10n.invalid_input,
              UsernameValidationError.tooShort => l10n.minimum_length_of_input(3),
              null => null,
            },
            onChanged: (_) => onUsernameChanged(),
            icon: Icon(
              Icons.person,
              color: theme.colorScheme.onPrimary,
            ),
            hintText: l10n.username,
            autovalidateMode: validateMode,
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: emailController,
            focusNode: emailFocusNode,
            onChanged: onEmailChanged,
            hintText: l10n.email_adress,
            icon: Icon(
              Icons.email,
              color: theme.colorScheme.onPrimary,
            ),
            validator: (_) => switch (email.value.error) {
              EmailValidationError.empty => l10n.email_is_required,
              EmailValidationError.invalid => l10n.not_a_valid_email,
              null => null,
            },
            autovalidateMode: validateMode,
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: passwordController,
            focusNode: passwordFocusNode,
            visible: passwordIsVisible.value,
            onChanged: onPasswordChanged,
            icon: const Icon(Icons.lock),
            hintText: l10n.password,
            validator: (_) => switch (password.value.error) {
              PasswordValidationError.empty => l10n.required,
              PasswordValidationError.tooShort => l10n.min_length_password,
              null => null,
            },
            autovalidateMode: validateMode,
            suffixIcon: IconButton(
              icon: Icon(
                passwordIsVisible.value ? Icons.visibility : Icons.visibility_off,
                color: theme.colorScheme.primary,
              ),
              onPressed: () => passwordIsVisible.value = !passwordIsVisible.value,
            ),
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: repeatPasswordController,
            focusNode: repeatPasswordFocusNode,
            visible: repeatPasswordIsVisible.value,
            onChanged: onRepeatPasswordChanged,
            icon: const Icon(Icons.lock),
            hintText: l10n.repeat_password,
            validator: (_) => switch (repeatPassword.value.error) {
              RepeatPasswordValidationError.empty => l10n.required,
              RepeatPasswordValidationError.doesNotMatch => l10n.passwords_do_not_match,
              null => null,
            },
            autovalidateMode: validateMode,
            suffixIcon: IconButton(
              icon: Icon(
                repeatPasswordIsVisible.value ? Icons.visibility : Icons.visibility_off,
                color: theme.colorScheme.primary,
              ),
              onPressed: () => repeatPasswordIsVisible.value = !repeatPasswordIsVisible.value,
            ),
          ),
          const VSpace.m(),
          ElevatedButton(
            onPressed: () async {
              if (signUpFormKey.currentState?.validate() ?? false) {
                final coordinates = await Geolocator.getCurrentPosition();
                await notifier.event(
                  SignUpEvent(
                    username: usernameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    repeatPassword: repeatPasswordController.text,
                    coordinates: [coordinates.longitude, coordinates.latitude],
                  ),
                );
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (authState is LoadingState) const LoadingIndicator(),
                Flexible(
                  child: Text(l10n.sign_up),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
