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
    this.hintText,
    this.filled = false,
  });

  final Icon icon;
  final String? hintText;
  final bool filled;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorScheme.error,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorScheme.error,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
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
        hintText: hintText,
        hintStyle: TextStyle(color: theme.hintColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        filled: filled,
        fillColor: Colors.black.withOpacity(0.1),
      ),
    );
  }
}
