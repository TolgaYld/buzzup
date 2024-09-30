import 'package:buzzup/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpWidget extends HookConsumerWidget {
  const SignUpWidget({
    required GlobalKey signUpFormKey,
    required this.onChangedUsername,
    required this.onChangedEmail,
    required this.onChangedPassword,
    required this.onChangedRepeatPassword,
    super.key,
  }) : _signUpFormKey = signUpFormKey;

  final GlobalKey _signUpFormKey;
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

    return Form(
      key: _signUpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFieldWidget(
            controller: usernameController,
            focusNode: usernameFocusNode,
            onChanged: onChangedUsername,
            icon: Icon(
              Icons.person,
              color: theme.colorScheme.onPrimary,
            ),
            hintText: l10n.username,
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: emailController,
            focusNode: emailFocusNode,
            onChanged: onChangedEmail,
            hintText: l10n.email_adress,
            icon: Icon(
              Icons.email,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: passwordController,
            focusNode: passwordFocusNode,
            onChanged: onChangedPassword,
            icon: const Icon(Icons.lock),
            hintText: l10n.password,
          ),
          const VSpace.m(),
          CustomTextFormFieldWidget(
            controller: repeatPasswordController,
            focusNode: repeatPasswordFocusNode,
            onChanged: onChangedRepeatPassword,
            icon: const Icon(Icons.lock),
            hintText: l10n.repeat_password,
          ),
        ],
      ),
    );
  }
}
