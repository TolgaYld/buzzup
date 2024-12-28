import 'package:buzzup/core/common/provider/auth.provider.dart';
import 'package:buzzup/src/application/auth/workflow/events/auth.event.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeTab extends HookConsumerWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Transform.rotate(
            angle: 0.3,
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
          IconButton(onPressed: () async => await notifier.event(SignOutEvent()), icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Home Tab'),
          ],
        ),
      ),
    );
  }
}
