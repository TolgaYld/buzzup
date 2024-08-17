import 'package:buzzup/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:buzzup/src/application/auth/provider/auth_mode.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInWidget extends HookConsumerWidget {
  const SignInWidget({
    required GlobalKey signInFormKey,
    super.key,
  }) : _signInFormKey = signInFormKey;

  final GlobalKey _signInFormKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = useTheme();
    final authModeNotifier = ref.read(authModeProvider.notifier);
    final emailController = useTextEditingController();
    final emailFocusNode = useFocusNode();
    final passwordController = useTextEditingController();
    final passwordFocusNode = useFocusNode();
    return Form(
      key: _signInFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFieldWidget(
            controller: emailController,
            focusNode: emailFocusNode,
            icon: Icon(
              Icons.email,
              color: theme.colorScheme.onPrimary,
            ),
            hintText: l10n.email_adress,
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: passwordController,
            focusNode: passwordFocusNode,
            icon: const Icon(Icons.lock),
            hintText: l10n.password,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: authModeNotifier.forgotPassword,
              child: Text(l10n.forgot_password),
            ),
          ),
        ],
      ),
    );
  }
}
