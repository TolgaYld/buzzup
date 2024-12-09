import 'package:buzzup/core/common/gen/assets.gen.dart';
import 'package:buzzup/core/common/widgets/animated_size_switcher.dart';
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
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final authModeState = ref.watch(authModeProvider);
    final authModeNotifier = ref.read(authModeProvider.notifier);
    final validateModeSignUp = useState(AutovalidateMode.disabled);
    final validateModeForgotPassword = useState(AutovalidateMode.disabled);

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next is SignedInState) {
        // Handle SignedInState
        print("SignedInState");
      } else if (next is SignedUpState) {
        print("SignedUpState");
      } else if (next is ErrorAuthState) {
        CoreUtils.showSnackBar(context, next.message);
      }
    });

    final signInFormKey = GlobalKey<FormState>();
    final signUpFormKey = GlobalKey<FormState>();
    final forgotPasswordFormKey = GlobalKey<FormState>();
    final signUpUsernameController = useTextEditingController();
    final signUpUsernameFocusNode = useFocusNode();
    final signUpEmailController = useTextEditingController();
    final signUpEmailFocusNode = useFocusNode();
    final signUpPasswordController = useTextEditingController();
    final signUpPasswordFocusNode = useFocusNode();
    final signUpRepeatPasswordController = useTextEditingController();
    final signUpRepeatPasswordFocusNode = useFocusNode();
    final signInEmailOrUsernameController = useTextEditingController();
    final signInEmailOrUsernameFocusNode = useFocusNode();
    final signInPasswordController = useTextEditingController();
    final signInPasswordFocusNode = useFocusNode();
    final forgotPasswordController = useTextEditingController();
    final forgotPasswordFocusNode = useFocusNode();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                top: Spacers.x2l,
                left: Spacers.xs,
                right: Spacers.xs,
              ),
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: Durations.short3,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: switch (authModeState) {
                      SignInAuthModeState() || SignUpAuthModeState() => Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Switch(
                                value: authModeState is SignUpAuthModeState,
                                activeColor: theme.colorScheme.primary,
                                inactiveThumbColor: theme.colorScheme.primary,
                                inactiveTrackColor: theme.colorScheme.primary.withOpacity(0.5),
                                activeTrackColor: theme.colorScheme.primary.withOpacity(0.5),
                                trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
                                thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return Icon(Icons.person_add, color: theme.colorScheme.onPrimary);
                                  }
                                  return Icon(Icons.login, color: theme.colorScheme.onPrimary);
                                }),
                                onChanged: (s) {
                                  if (s) {
                                    authModeNotifier.signUp();
                                  } else {
                                    authModeNotifier.signIn();
                                  }
                                },
                              ),
                              const HSpace.xxs(),
                              AnimatedSizeSwitcher(
                                child: Text(
                                  switch (authModeState) {
                                    SignInAuthModeState() => l10n.sign_in,
                                    SignUpAuthModeState() => l10n.sign_up,
                                    ForgotPasswordAuthModeState() => l10n.forgot_password,
                                  },
                                  style: theme.textTheme.titleMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ForgotPasswordAuthModeState() => const SizedBox(),
                    },
                  ),
                  const VSpace.xl(),
                  AnimatedSize(
                    duration: Durations.short3,
                    curve: Curves.linear,
                    child: AnimatedSwitcher(
                      duration: Durations.short3,
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: switch (authModeState) {
                        SignInAuthModeState() => SignInWidget(
                            key: signInKey,
                            signInFormKey: signInFormKey,
                            emailOrUsernameController: signInEmailOrUsernameController,
                            emailOrUsernameFocusNode: signInEmailOrUsernameFocusNode,
                            passwordController: signInPasswordController,
                            passwordFocusNode: signInPasswordFocusNode,
                          ),
                        SignUpAuthModeState() => SignUpWidget(
                            validateMode: validateModeSignUp.value,
                            key: signUpKey,
                            signUpFormKey: signUpFormKey,
                            emailController: signUpEmailController,
                            emailFocusNode: signUpEmailFocusNode,
                            passwordController: signUpPasswordController,
                            passwordFocusNode: signUpPasswordFocusNode,
                            repeatPasswordController: signUpRepeatPasswordController,
                            repeatPasswordFocusNode: signUpRepeatPasswordFocusNode,
                            usernameController: signUpUsernameController,
                            usernameFocusNode: signUpUsernameFocusNode,
                          ),
                        ForgotPasswordAuthModeState() => ForgotPasswordWidget(
                            key: forgotPasswordKey,
                            formKey: forgotPasswordFormKey,
                            validateMode: validateModeForgotPassword.value,
                            emailController: forgotPasswordController,
                            emailFocusNode: forgotPasswordFocusNode,
                          ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
