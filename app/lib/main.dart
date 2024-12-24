import 'package:buzzup/core/common/provider/auth.provider.dart';
import 'package:buzzup/core/common/provider/grps_status.provider.dart';
import 'package:buzzup/core/common/router/router.dart';
import 'package:buzzup/core/localization/localizations.dart';
import 'package:buzzup/core/design/theme.dart';
import 'package:buzzup/src/application/auth/workflow/events/auth.event.dart';
import 'package:buzzup/src/application/auth/workflow/state/auth.state.dart';
import 'package:buzzup/src/application/theme_mode/provider/theme_mode.provider.dart';
import 'package:buzzup/src/application/theme_mode/workflow/state/theme_mode.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();
  final appDocumentDir = await getApplicationDocumentsDirectory();

  HiveStore.init(onPath: appDocumentDir.path);
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themeModeProvider);
    final routerConfig = ref.watch(navigationManagerProvider);

    final themeMode = switch (themeModeState) {
      final ThemeModeChangedState state when state.useSystemTheme => ThemeMode.system,
      final ThemeModeChangedState state when state.isDarkMode => ThemeMode.dark,
      _ => ThemeMode.light,
    };
    useEffect(
      () {
        final observer = _LifecycleObserver(ref);
        WidgetsBinding.instance.addObserver(observer);
        Future.microtask(() async {
          await ref.read(gpsStatusNotifierProvider.notifier).updateLocationStatus();
          final authState = ref.read(authProvider);
          final notifier = ref.read(authProvider.notifier);

          if (authState is AuthInitialState) {
            await notifier.event(const RefreshTokenEvent());
          }
        });

        return () => WidgetsBinding.instance.removeObserver(observer);
      },
      [],
    );

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: L10n.localizationsDelegates,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      supportedLocales: L10n.supportedLocales,
      routerConfig: routerConfig,
    );
  }
}

class _LifecycleObserver extends WidgetsBindingObserver {
  _LifecycleObserver(this.ref);

  final WidgetRef ref;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(gpsStatusNotifierProvider.notifier).updateLocationStatus();
    }
  }
}
