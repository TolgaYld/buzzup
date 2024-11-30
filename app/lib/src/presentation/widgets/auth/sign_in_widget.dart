import 'dart:io';

import 'package:buzzup/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:buzzup/core/utils/extensions/iterable.extension.dart';
import 'package:buzzup/src/application/auth/provider/auth_mode.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInWidget extends HookConsumerWidget {
  const SignInWidget({
    super.key,
    required GlobalKey signInFormKey,
    required this.emailOrUsernameController,
    required this.emailOrUsernameFocusNode,
    required this.passwordController,
    required this.passwordFocusNode,
  }) : _signInFormKey = signInFormKey;

  final GlobalKey _signInFormKey;
  final TextEditingController emailOrUsernameController;
  final FocusNode emailOrUsernameFocusNode;
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = useTheme();
    final authModeNotifier = ref.read(authModeProvider.notifier);
    final passwordVisible = useState(false);
    return Form(
      key: _signInFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFieldWidget(
            controller: emailOrUsernameController,
            focusNode: emailOrUsernameFocusNode,
            icon: Icon(
              Icons.email,
              color: theme.colorScheme.onPrimary,
            ),
            hintText: l10n.email_or_username,
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: passwordController,
            focusNode: passwordFocusNode,
            icon: const Icon(Icons.lock),
            hintText: l10n.password,
            visible: passwordVisible.value,
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible.value ? Icons.visibility : Icons.visibility_off,
                color: theme.colorScheme.primary,
              ),
              onPressed: () => passwordVisible.value = !passwordVisible.value,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: authModeNotifier.forgotPassword,
              child: Text(l10n.forgot_password),
            ),
          ),
          const VSpace.x3l(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacers.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _SignInViaProviderButton(
                  l10n.login_via_google,
                  button: Buttons.google,
                  onPressed: () {},
                ),
                _SignInViaProviderButton(
                  l10n.login_via_facebook,
                  button: Buttons.facebook,
                  onPressed: () {},
                ),
                if (Platform.isIOS)
                  _SignInViaProviderButton(
                    l10n.login_via_apple,
                    button: Buttons.apple,
                    onPressed: () {},
                  ),
              ].intersperse(const VSpace.s()).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignInViaProviderButton extends HookConsumerWidget {
  const _SignInViaProviderButton(
    this.text, {
    required this.button,
    required this.onPressed,
    this.mini = false,
  });

  final String? text;
  final Buttons button;
  final bool mini;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInButton(
      button,
      elevation: 3,
      mini: mini,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      text: text,
      onPressed: onPressed,
    );
  }
}
