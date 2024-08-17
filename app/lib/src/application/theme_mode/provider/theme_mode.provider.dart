import 'package:buzzup/src/application/theme_mode/notifier/theme_mode.notifier.dart';
import 'package:buzzup/src/application/theme_mode/workflow/state/theme_mode.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeModeState>(
  ThemeModeNotifier.new,
);
