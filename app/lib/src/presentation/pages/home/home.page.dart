import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Transform.rotate(
            angle: 0.3,
            child: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // ref.read(authNotifierProvider.notifier).event(SignOutEvent());
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Home Page'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.primary,
        onPressed: () {
          // ref.read(authNotifierProvider.notifier).event(SignOutEvent());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: theme.colorScheme.onPrimary,
        shadowColor: Colors.black,
        elevation: 3,
        height: VSpace.x2l().height,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Spacers.s),
              topRight: Radius.circular(Spacers.s),
            ),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Spacers.s)),
          ),
        ),
        notchMargin: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: theme.colorScheme.primary,
              ),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(
                Icons.apps_rounded,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
            SizedBox(),
            IconButton(
              icon: Icon(
                Icons.forum_rounded,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
