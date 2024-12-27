import 'package:buzzup/core/common/provider/auth.provider.dart';
import 'package:buzzup/core/design/spacing.dart';
import 'package:buzzup/core/hooks/use_theme.hook.dart';
import 'package:buzzup/src/application/auth/workflow/events/auth.event.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppPage extends HookConsumerWidget {
  const AppPage({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final notifier = ref.read(authProvider.notifier);

    void _onTabSelected(int index) {
      print('Tab selected: $index');
      navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
    }

    return Scaffold(
      extendBody: true,
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
      body: navigationShell,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.primary,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: theme.colorScheme.onPrimary,
        shadowColor: Colors.black,
        elevation: 3,
        height: kToolbarHeight,
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
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: VSpace.x2l().height,
                child: IconButton(
                  icon: Icon(
                    Icons.home,
                    color: navigationShell.currentIndex == 0 ? theme.colorScheme.primary : Colors.grey,
                  ),
                  onPressed: () => _onTabSelected(0),
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.apps_rounded,
                  color: navigationShell.currentIndex == 1 ? theme.colorScheme.primary : Colors.grey,
                ),
                onPressed: () => _onTabSelected(1),
              ),
            ),
            SizedBox(width: 48), // Platz für das Floating Action Button
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.forum_rounded,
                  color: navigationShell.currentIndex == 2 ? theme.colorScheme.primary : Colors.grey,
                ),
                onPressed: () => _onTabSelected(2),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.person_rounded,
                  color: navigationShell.currentIndex == 3 ? theme.colorScheme.primary : Colors.grey,
                ),
                onPressed: () => _onTabSelected(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
