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

    void onTabSelected(int index) => navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);

    Widget navbarItem({
      required IconData icon,
      required String? label,
      required int index,
    }) {
      return Expanded(
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          onTap: () => onTabSelected(index),
          child: Container(
            padding: const EdgeInsets.only(top: Spacers.s),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: navigationShell.currentIndex == index ? theme.colorScheme.secondary : Colors.white,
                ),
                if (label != null)
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: navigationShell.currentIndex == index ? theme.colorScheme.secondary : Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
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
        padding: EdgeInsets.zero,
        color: theme.colorScheme.primary,
        shadowColor: Colors.black,
        elevation: 3,
        height: kBottomNavigationBarHeight,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            navbarItem(
              icon: Icons.home_rounded,
              label: "Home",
              index: 0,
            ),
            navbarItem(
              icon: Icons.apps_rounded,
              label: "Channels",
              index: 1,
            ),
            HSpace.x2l(),
            navbarItem(
              icon: Icons.forum_rounded,
              label: "Chats",
              index: 2,
            ),
            navbarItem(
              icon: Icons.person_rounded,
              label: "Profile",
              index: 3,
            ),
          ],
        ),
      ),
    );
  }
}
