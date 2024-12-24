import 'package:buzzup/core/common/gen/assets.gen.dart';
import 'package:buzzup/core/common/widgets/loading_indicator.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: Spacers.l,
          children: [
            SvgPicture.asset(Assets.images.logoipsum285),
            LoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
