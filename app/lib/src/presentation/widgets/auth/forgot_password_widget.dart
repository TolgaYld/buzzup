import 'package:buzzup/core/common/widgets/custom_text_form_field_widget.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/src/application/auth/provider/auth_mode.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordWidget extends HookConsumerWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final authModeNotifier = ref.read(authModeProvider.notifier);
    return Column(
      children: [
        CustomTextFormFieldWidget(
          controller: controller,
          focusNode: focusNode,
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
      ],
    );
  }
}
