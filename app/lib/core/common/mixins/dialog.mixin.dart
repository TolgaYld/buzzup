import 'package:flutter/material.dart';

mixin ShowableDialogMixin<T> on Widget {
  Future<T?> show(
    BuildContext context, {
    bool useAnimation = true,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? customTransitionBuilder,
  }) {
    if (useAnimation == false) {
      return showDialog<T>(
        context: context,
        builder: (context) => this,
      );
    }

    return showGeneralDialog<T>(
      context: context,
      barrierLabel: 'Dialog',
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: Durations.short3,
      pageBuilder: (context, anim1, anim2) => this,
      transitionBuilder: customTransitionBuilder ??
          (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: anim1,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
    );
  }

  Future<T?> showBarrierDisabled(
    BuildContext context, {
    bool useAnimation = true,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? customTransitionBuilder,
  }) {
    if (useAnimation == false) {
      return showDialog<T>(
        context: context,
        builder: (context) => this,
        barrierDismissible: false,
      );
    }

    return showGeneralDialog<T>(
      context: context,
      barrierLabel: 'Dialog',
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: Durations.short3,
      pageBuilder: (context, anim1, anim2) => this,
      transitionBuilder: customTransitionBuilder ??
          (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: anim1,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
    );
  }

  void pop(BuildContext context, T value) {
    Navigator.pop<T>(context, value);
  }
}
