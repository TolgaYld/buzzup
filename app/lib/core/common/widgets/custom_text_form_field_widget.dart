import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextFormFieldWidget extends HookConsumerWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.icon,
    this.onChanged,
    this.hintText,
    this.filled = false,
    this.errorText,
    this.keyboardType,
    this.visible = true,
    this.validator,
    this.autovalidateMode,
    this.suffixIcon,
  });

  final Icon icon;
  final String? hintText;
  final bool filled;
  final bool visible;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: !visible,
      validator: validator,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        errorText: errorText,
        contentPadding: EdgeInsets.zero,
        prefixIcon: Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          margin: const EdgeInsets.only(right: Spacers.s),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Icon(
            icon.icon,
            color: const Color(0xFFFFFFFF),
          ),
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}
