import 'dart:io';

import 'package:buzzup/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:buzzup/src/application/auth/provider/auth_mode.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final passwordVisible = useState(false);
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
          Text(l10n.or),
          const VSpace.m(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacers.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l10n.login_via_google,
                      style: TextStyle(color: theme.primaryColor),
                    ),
                  ),
                  icon: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: Spacers.x2l),
                      child: Icon(
                        FontAwesomeIcons.google,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: theme.primaryColor),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l10n.login_via_facebook,
                      style: TextStyle(color: theme.primaryColor),
                    ),
                  ),
                  icon: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: Spacers.x2l),
                      child: Icon(
                        Icons.facebook_rounded,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: theme.primaryColor),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                if (Platform.isIOS)
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n.login_via_apple,
                        style: TextStyle(color: theme.primaryColor),
                      ),
                    ),
                    icon: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: Spacers.x2l),
                        child: Icon(
                          Icons.apple_rounded,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: theme.primaryColor),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
