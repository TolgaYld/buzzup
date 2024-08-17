import 'package:dart_mappable/dart_mappable.dart';

part 'theme_mode.state.mapper.dart';

@MappableClass()
sealed class ThemeModeState with ThemeModeStateMappable {
  const ThemeModeState();
}

@MappableClass()
class InitialThemeModeState extends ThemeModeState
    with InitialThemeModeStateMappable {
  const InitialThemeModeState();
}

@MappableClass()
class LoadingThemeModeState extends ThemeModeState
    with LoadingThemeModeStateMappable {
  const LoadingThemeModeState();
}

@MappableClass()
class ThemeModeChangedState extends ThemeModeState
    with ThemeModeChangedStateMappable {
  const ThemeModeChangedState(this.isDarkMode, this.useSystemTheme);

  final bool isDarkMode;
  final bool useSystemTheme;
}

@MappableClass()
class UseSystemThemeChangedState extends ThemeModeState
    with UseSystemThemeChangedStateMappable {
  const UseSystemThemeChangedState(this.useSystemTheme);

  final bool useSystemTheme;
}

@MappableClass()
class ErrorThemeModeState extends ThemeModeState
    with ErrorThemeModeStateMappable {
  const ErrorThemeModeState(this.message);

  final String message;
}
