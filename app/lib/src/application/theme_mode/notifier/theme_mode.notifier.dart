import 'package:buzzup/core/dependency_provider/theme_mode.provider.dart';
import 'package:buzzup/core/utils/either.dart';
import 'package:buzzup/src/application/theme_mode/workflow/events/theme_mode.event.dart';
import 'package:buzzup/src/application/theme_mode/workflow/state/theme_mode.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeModeNotifier extends StateNotifier<ThemeModeState> {
  ThemeModeNotifier(this.ref) : super(const InitialThemeModeState());

  final Ref ref;

  Future<void> event(ThemeModeEvent event) async {
    state = const LoadingThemeModeState();
    switch (event) {
      case ToggleThemeModeEvent():
        await _toggleThemeHandler();
        break;
      case SetThemeModeEvent():
        await _setThemeHandler(event);
        break;
      case ToggleUseSystemThemeModeEvent():
        await _toggleUseSystemThemeHandler();
        break;
      case SetUseSystemThemeModeEvent():
        await _setUseSystemThemeHandler(event);
        break;
    }
  }

  Future<void> _toggleThemeHandler() async {
    final setThemeUsecase = ref.read(setThemeModeUsecaseProvider);

    final currentMode = (state is ThemeModeChangedState)
        ? (state as ThemeModeChangedState).isDarkMode
        : false;
    final useSystemTheme = (state is ThemeModeChangedState)
        ? (state as ThemeModeChangedState).useSystemTheme
        : false;

    final newMode = !currentMode;
    final result = await setThemeUsecase(newMode);

    switch (result) {
      case Left(value: final failure):
        state = ErrorThemeModeState(failure.message);
        break;
      case Right():
        state = ThemeModeChangedState(newMode, useSystemTheme);
        break;
    }
  }

  Future<void> _setThemeHandler(SetThemeModeEvent event) async {
    final setThemeUsecase = ref.read(setThemeModeUsecaseProvider);

    final result = await setThemeUsecase(event.isDarkMode);

    switch (result) {
      case Left(value: final failure):
        state = ErrorThemeModeState(failure.message);
        break;
      case Right():
        state = ThemeModeChangedState(
          event.isDarkMode,
          state is ThemeModeChangedState
              ? (state as ThemeModeChangedState).useSystemTheme
              : false,
        );
        break;
    }
  }

  Future<void> _toggleUseSystemThemeHandler() async {
    final setUseSystemThemeUsecase = ref.read(setUseSystemThemeUsecaseProvider);

    final useSystemTheme = (state is ThemeModeChangedState)
        ? (state as ThemeModeChangedState).useSystemTheme
        : false;
    final isDarkMode = (state is ThemeModeChangedState)
        ? (state as ThemeModeChangedState).isDarkMode
        : false;

    final newSystemTheme = !useSystemTheme;
    final result = await setUseSystemThemeUsecase(newSystemTheme);

    switch (result) {
      case Left(value: final failure):
        state = ErrorThemeModeState(failure.message);
        break;
      case Right():
        state = ThemeModeChangedState(isDarkMode, newSystemTheme);
        break;
    }
  }

  Future<void> _setUseSystemThemeHandler(
    SetUseSystemThemeModeEvent event,
  ) async {
    final setUseSystemThemeUsecase = ref.read(setUseSystemThemeUsecaseProvider);

    final result = await setUseSystemThemeUsecase(event.useSystemTheme);

    switch (result) {
      case Left(value: final failure):
        state = ErrorThemeModeState(failure.message);
        break;
      case Right():
        state = ThemeModeChangedState(
          state is ThemeModeChangedState
              ? (state as ThemeModeChangedState).isDarkMode
              : false,
          event.useSystemTheme,
        );
        break;
    }
  }
}
