import 'package:buzzup/core/common/gen/assets.gen.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:buzzup/core/utils/core_utils.dart';
import 'package:buzzup/src/application/auth/provider/auth.provider.dart';
import 'package:buzzup/src/application/auth/provider/auth_mode.provider.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth_mode.state.dart';
import 'package:buzzup/src/presentation/widgets/auth/forgot_password_widget.dart';
import 'package:buzzup/src/presentation/widgets/auth/sign_in_widget.dart';
import 'package:buzzup/src/presentation/widgets/auth/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends HookConsumerWidget {
  const AuthPage({super.key});

  static const Key signInKey = Key('signIn');
  static const Key signUpKey = Key('signUp');
  static const Key forgotPasswordKey = Key('forgotPassword');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final l10n = useL10n();
    final authState = ref.watch(authProvider);
    final authModeState = ref.watch(authModeProvider);
    final authModeNotifier = ref.read(authModeProvider.notifier);

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next is SignedInState) {
      } else if (next is ErrorAuthState) {
        CoreUtils.showSnackBar(context, next.message);
      }
    });
    final signInFormKey = GlobalKey();
    final signUpFormKey = GlobalKey();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: Text(
            switch (authModeState) {
              SignInAuthModeState() => l10n.sign_in,
              SignUpAuthModeState() => l10n.sign_up,
              ForgotPasswordAuthModeState() => l10n.reset_password,
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: SvgPicture.asset(
            Assets.images.logoipsum285,
          ).animate().fade(duration: Durations.short4).then().shimmer(duration: Durations.short4),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: Spacers.x5l,
                left: Spacers.xs,
                right: Spacers.xs,
              ),
              child: AnimatedSize(
                duration: Durations.short3,
                curve: Curves.easeInOut,
                child: AnimatedSwitcher(
                  duration: Durations.short3,
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: switch (authModeState) {
                    SignInAuthModeState() => SignInWidget(
                        key: signInKey,
                        signInFormKey: signInFormKey,
                      ),
                    SignUpAuthModeState() => SignUpWidget(
                        key: signUpKey,
                        signUpFormKey: signUpFormKey,
                      ),
                    ForgotPasswordAuthModeState() => const ForgotPasswordWidget(key: forgotPasswordKey),
                  },
                ),
              ),
            ),
            switch (authModeState) {
              SignInAuthModeState() || SignUpAuthModeState() => Padding(
                  padding: const EdgeInsets.only(bottom: Spacers.m),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        switch (authModeState) {
                          SignInAuthModeState() => l10n.not_a_user_yet,
                          SignUpAuthModeState() => l10n.already_a_user_yet,
                          _ => "",
                        },
                        style: theme.textTheme.labelSmall,
                      ),
                      TextButton(
                        onPressed: () => switch (authModeState) {
                          SignInAuthModeState() => authModeNotifier.signUp(),
                          SignUpAuthModeState() => authModeNotifier.signIn(),
                          _ => null,
                        },
                        child: Text(
                          switch (authModeState) {
                            SignInAuthModeState() => l10n.sign_up,
                            SignUpAuthModeState() => l10n.sign_in,
                            _ => "",
                          },
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ForgotPasswordAuthModeState() => const SizedBox(),
            },
          ],
        ),
      ),
    );
  }
}
