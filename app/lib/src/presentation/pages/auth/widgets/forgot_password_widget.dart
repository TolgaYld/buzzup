import 'package:buzzup/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:buzzup/core/common/widgets/loading_indicator.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/common/provider/auth/auth.provider.dart';
import 'package:buzzup/src/application/auth/provider/auth_mode.provider.dart';
import 'package:buzzup/src/application/auth/workflow/events/auth.event.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:buzzup/src/presentation/pages/auth/validation/auth_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordWidget extends HookConsumerWidget {
  const ForgotPasswordWidget({
    super.key,
    required this.formKey,
    required this.validateMode,
    required this.emailController,
    required this.emailFocusNode,
  });
  final GlobalKey<FormState> formKey;
  final AutovalidateMode validateMode;
  final TextEditingController emailController;
  final FocusNode emailFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final authState = ref.watch(authProvider);
    final notifier = ref.read(authProvider.notifier);
    final authModeNotifier = ref.read(authModeProvider.notifier);
    final email = useState(const EmailInput.pure());

    void onEmailChanged(String value) {
      email.value = EmailInput.dirty(value);
      if (validateMode == AutovalidateMode.always) {
        formKey.currentState?.validate();
      }
    }

    return Form(
      key: formKey,
      autovalidateMode: validateMode,
      child: Column(
        children: [
          CustomTextFormFieldWidget(
            controller: emailController,
            focusNode: emailFocusNode,
            onChanged: onEmailChanged,
            icon: const Icon(Icons.email),
            hintText: l10n.email_adress,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: authModeNotifier.signIn,
              child: Text(l10n.back_to_login),
            ),
          ),
          const VSpace.m(),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState?.validate() ?? false) {
                await notifier.event(ForgotPasswordEvent(emailController.text));
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (authState is LoadingState) const LoadingIndicator(),
                Flexible(
                  child: Text(l10n.reset_password),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
