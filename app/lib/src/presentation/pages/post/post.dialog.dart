import 'package:buzzup/core/common/mixins/dialog.mixin.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostDialog extends HookConsumerWidget with ShowableDialogMixin {
  const PostDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final l10n = useL10n();
    const minHeight = 0.4;
    const maxHeight = 0.7;
    final height = useState<double>(0.4);
    final controller = useTextEditingController();

    useEffect(
      () {
        void updateHeight() {
          if (height.value == 0.7) return;
          final lines = (controller.text.split('\n').length).clamp(7, 21);
          height.value = (lines * 0.045).clamp(minHeight, maxHeight);
        }

        controller.addListener(updateHeight);
        return () => controller.removeListener(updateHeight);
      },
      [controller],
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return AnimatedContainer(
              duration: Durations.short3,
              width: constraints.maxWidth,
              height: constraints.maxHeight * height.value,
              padding: const EdgeInsets.all(Spacers.m),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(Spacers.s),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      primary: true,
                      child: Column(
                        children: [
                          TextField(
                            controller: controller,
                            minLines: 7,
                            maxLines: 30,
                            decoration: InputDecoration(
                              hintText: l10n.shareVib3Hint,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const VSpace.s(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton.filled(
                                onPressed: () {},
                                icon: Icon(Icons.camera_alt_rounded),
                              ),
                              const HSpace.s(),
                              IconButton.filled(
                                onPressed: () => height.value = maxHeight,
                                icon: Icon(Icons.image_rounded),
                                style: IconButton.styleFrom(backgroundColor: theme.colorScheme.secondary),
                              ),
                              const HSpace.s(),
                              IconButton.filled(
                                onPressed: () {},
                                icon: Icon(Icons.person_add_alt_rounded),
                                style: IconButton.styleFrom(backgroundColor: Colors.green),
                              ),
                              const HSpace.s(),
                              IconButton.filled(
                                onPressed: () {},
                                icon: Icon(Icons.pin_drop_rounded),
                                style: IconButton.styleFrom(backgroundColor: Colors.lightBlue),
                              ),
                            ],
                          ),
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
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: Text(l10n.post),
                        icon: Icon(
                          Icons.send_rounded,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
