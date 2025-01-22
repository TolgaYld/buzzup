import 'package:buzzup/core/common/mixins/dialog.mixin.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostDialog extends HookConsumerWidget with ShowableDialogMixin {
  const PostDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final l10n = useL10n();

    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight * 0.7,
            padding: const EdgeInsets.all(Spacers.m),
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              borderRadius: BorderRadius.circular(Spacers.s),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          minLines: 7,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: l10n.shareVib3Hint,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const VSpace.s(),
                        // TODO: Add image picker
                      ],
                    ),
                  ),
                ),
                const VSpace.s(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(l10n.close),
                    ),
                    const HSpace.s(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(l10n.post),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
