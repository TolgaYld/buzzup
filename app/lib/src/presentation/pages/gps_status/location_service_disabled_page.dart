import 'package:buzzup/core/common/gen/assets.gen.dart';
import 'package:buzzup/core/hooks/use_l10n.hook.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

class LocationServiceDisabledPage extends HookConsumerWidget {
  const LocationServiceDisabledPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final l10n = useL10n();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: Geolocator.openLocationSettings,
        child: Text(l10n.go_to_settings),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.onSurface.withOpacity(0.7),
              theme.colorScheme.onSurface,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacers.m,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(Assets.images.logoipsum285)
                      .animate()
                      .fade(
                        duration: Durations.short4,
                      )
                      .then()
                      .shimmer(
                        duration: Durations.short4,
                      ),
                  const VSpace.m(),
                  Text(
                    l10n.turn_on_location_service_message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: theme.colorScheme.surface,
                      fontSize: theme.textTheme.titleMedium?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
            const VSpace.m(),
            RiveAnimatedIcon(
              riveIcon: RiveIcon.location,
              color: theme.colorScheme.surface,
              height: 200,
              width: 200,
              loopAnimation: true,
            ),
          ],
        ),
      ),
    );
  }
}
