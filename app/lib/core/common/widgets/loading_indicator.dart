import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingIndicator extends HookConsumerWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final rotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    final scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    useEffect(
      () {
        controller.repeat();
        return null;
      },
      [controller],
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: rotation.value * 2 * 3.14159265359,
          child: Transform.scale(
            scale: scale.value,
            child: const Icon(Icons.sync, size: 30),
          ),
        );
      },
    );
  }
}
