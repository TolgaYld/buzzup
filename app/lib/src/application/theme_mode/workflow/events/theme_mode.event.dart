abstract class ThemeModeEvent {}

class ToggleThemeModeEvent extends ThemeModeEvent {}

class SetThemeModeEvent extends ThemeModeEvent {
  SetThemeModeEvent(this.isDarkMode);
  final bool isDarkMode;
}

class ToggleUseSystemThemeModeEvent extends ThemeModeEvent {}

class SetUseSystemThemeModeEvent extends ThemeModeEvent {
  SetUseSystemThemeModeEvent(this.useSystemTheme);
  final bool useSystemTheme;
}
