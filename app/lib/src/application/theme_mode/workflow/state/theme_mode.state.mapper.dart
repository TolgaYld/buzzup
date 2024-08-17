// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'theme_mode.state.dart';

class ThemeModeStateMapper extends ClassMapperBase<ThemeModeState> {
  ThemeModeStateMapper._();

  static ThemeModeStateMapper? _instance;
  static ThemeModeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ThemeModeStateMapper._());
      InitialThemeModeStateMapper.ensureInitialized();
      LoadingThemeModeStateMapper.ensureInitialized();
      ThemeModeChangedStateMapper.ensureInitialized();
      UseSystemThemeChangedStateMapper.ensureInitialized();
      ErrorThemeModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ThemeModeState';

  @override
  final MappableFields<ThemeModeState> fields = const {};

  static ThemeModeState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('ThemeModeState');
  }

  @override
  final Function instantiate = _instantiate;

  static ThemeModeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ThemeModeState>(map);
  }

  static ThemeModeState fromJson(String json) {
    return ensureInitialized().decodeJson<ThemeModeState>(json);
  }
}

mixin ThemeModeStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ThemeModeStateCopyWith<ThemeModeState, ThemeModeState, ThemeModeState>
      get copyWith;
}

abstract class ThemeModeStateCopyWith<$R, $In extends ThemeModeState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ThemeModeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class InitialThemeModeStateMapper
    extends ClassMapperBase<InitialThemeModeState> {
  InitialThemeModeStateMapper._();

  static InitialThemeModeStateMapper? _instance;
  static InitialThemeModeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InitialThemeModeStateMapper._());
      ThemeModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InitialThemeModeState';

  @override
  final MappableFields<InitialThemeModeState> fields = const {};

  static InitialThemeModeState _instantiate(DecodingData data) {
    return InitialThemeModeState();
  }

  @override
  final Function instantiate = _instantiate;

  static InitialThemeModeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InitialThemeModeState>(map);
  }

  static InitialThemeModeState fromJson(String json) {
    return ensureInitialized().decodeJson<InitialThemeModeState>(json);
  }
}

mixin InitialThemeModeStateMappable {
  String toJson() {
    return InitialThemeModeStateMapper.ensureInitialized()
        .encodeJson<InitialThemeModeState>(this as InitialThemeModeState);
  }

  Map<String, dynamic> toMap() {
    return InitialThemeModeStateMapper.ensureInitialized()
        .encodeMap<InitialThemeModeState>(this as InitialThemeModeState);
  }

  InitialThemeModeStateCopyWith<InitialThemeModeState, InitialThemeModeState,
          InitialThemeModeState>
      get copyWith => _InitialThemeModeStateCopyWithImpl(
          this as InitialThemeModeState, $identity, $identity);
  @override
  String toString() {
    return InitialThemeModeStateMapper.ensureInitialized()
        .stringifyValue(this as InitialThemeModeState);
  }

  @override
  bool operator ==(Object other) {
    return InitialThemeModeStateMapper.ensureInitialized()
        .equalsValue(this as InitialThemeModeState, other);
  }

  @override
  int get hashCode {
    return InitialThemeModeStateMapper.ensureInitialized()
        .hashValue(this as InitialThemeModeState);
  }
}

extension InitialThemeModeStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InitialThemeModeState, $Out> {
  InitialThemeModeStateCopyWith<$R, InitialThemeModeState, $Out>
      get $asInitialThemeModeState =>
          $base.as((v, t, t2) => _InitialThemeModeStateCopyWithImpl(v, t, t2));
}

abstract class InitialThemeModeStateCopyWith<
    $R,
    $In extends InitialThemeModeState,
    $Out> implements ThemeModeStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  InitialThemeModeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _InitialThemeModeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InitialThemeModeState, $Out>
    implements InitialThemeModeStateCopyWith<$R, InitialThemeModeState, $Out> {
  _InitialThemeModeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InitialThemeModeState> $mapper =
      InitialThemeModeStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  InitialThemeModeState $make(CopyWithData data) => InitialThemeModeState();

  @override
  InitialThemeModeStateCopyWith<$R2, InitialThemeModeState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _InitialThemeModeStateCopyWithImpl($value, $cast, t);
}

class LoadingThemeModeStateMapper
    extends ClassMapperBase<LoadingThemeModeState> {
  LoadingThemeModeStateMapper._();

  static LoadingThemeModeStateMapper? _instance;
  static LoadingThemeModeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoadingThemeModeStateMapper._());
      ThemeModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoadingThemeModeState';

  @override
  final MappableFields<LoadingThemeModeState> fields = const {};

  static LoadingThemeModeState _instantiate(DecodingData data) {
    return LoadingThemeModeState();
  }

  @override
  final Function instantiate = _instantiate;

  static LoadingThemeModeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoadingThemeModeState>(map);
  }

  static LoadingThemeModeState fromJson(String json) {
    return ensureInitialized().decodeJson<LoadingThemeModeState>(json);
  }
}

mixin LoadingThemeModeStateMappable {
  String toJson() {
    return LoadingThemeModeStateMapper.ensureInitialized()
        .encodeJson<LoadingThemeModeState>(this as LoadingThemeModeState);
  }

  Map<String, dynamic> toMap() {
    return LoadingThemeModeStateMapper.ensureInitialized()
        .encodeMap<LoadingThemeModeState>(this as LoadingThemeModeState);
  }

  LoadingThemeModeStateCopyWith<LoadingThemeModeState, LoadingThemeModeState,
          LoadingThemeModeState>
      get copyWith => _LoadingThemeModeStateCopyWithImpl(
          this as LoadingThemeModeState, $identity, $identity);
  @override
  String toString() {
    return LoadingThemeModeStateMapper.ensureInitialized()
        .stringifyValue(this as LoadingThemeModeState);
  }

  @override
  bool operator ==(Object other) {
    return LoadingThemeModeStateMapper.ensureInitialized()
        .equalsValue(this as LoadingThemeModeState, other);
  }

  @override
  int get hashCode {
    return LoadingThemeModeStateMapper.ensureInitialized()
        .hashValue(this as LoadingThemeModeState);
  }
}

extension LoadingThemeModeStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoadingThemeModeState, $Out> {
  LoadingThemeModeStateCopyWith<$R, LoadingThemeModeState, $Out>
      get $asLoadingThemeModeState =>
          $base.as((v, t, t2) => _LoadingThemeModeStateCopyWithImpl(v, t, t2));
}

abstract class LoadingThemeModeStateCopyWith<
    $R,
    $In extends LoadingThemeModeState,
    $Out> implements ThemeModeStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  LoadingThemeModeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LoadingThemeModeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoadingThemeModeState, $Out>
    implements LoadingThemeModeStateCopyWith<$R, LoadingThemeModeState, $Out> {
  _LoadingThemeModeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoadingThemeModeState> $mapper =
      LoadingThemeModeStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  LoadingThemeModeState $make(CopyWithData data) => LoadingThemeModeState();

  @override
  LoadingThemeModeStateCopyWith<$R2, LoadingThemeModeState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LoadingThemeModeStateCopyWithImpl($value, $cast, t);
}

class ThemeModeChangedStateMapper
    extends ClassMapperBase<ThemeModeChangedState> {
  ThemeModeChangedStateMapper._();

  static ThemeModeChangedStateMapper? _instance;
  static ThemeModeChangedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ThemeModeChangedStateMapper._());
      ThemeModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ThemeModeChangedState';

  static bool _$isDarkMode(ThemeModeChangedState v) => v.isDarkMode;
  static const Field<ThemeModeChangedState, bool> _f$isDarkMode =
      Field('isDarkMode', _$isDarkMode);
  static bool _$useSystemTheme(ThemeModeChangedState v) => v.useSystemTheme;
  static const Field<ThemeModeChangedState, bool> _f$useSystemTheme =
      Field('useSystemTheme', _$useSystemTheme);

  @override
  final MappableFields<ThemeModeChangedState> fields = const {
    #isDarkMode: _f$isDarkMode,
    #useSystemTheme: _f$useSystemTheme,
  };

  static ThemeModeChangedState _instantiate(DecodingData data) {
    return ThemeModeChangedState(
        data.dec(_f$isDarkMode), data.dec(_f$useSystemTheme));
  }

  @override
  final Function instantiate = _instantiate;

  static ThemeModeChangedState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ThemeModeChangedState>(map);
  }

  static ThemeModeChangedState fromJson(String json) {
    return ensureInitialized().decodeJson<ThemeModeChangedState>(json);
  }
}

mixin ThemeModeChangedStateMappable {
  String toJson() {
    return ThemeModeChangedStateMapper.ensureInitialized()
        .encodeJson<ThemeModeChangedState>(this as ThemeModeChangedState);
  }

  Map<String, dynamic> toMap() {
    return ThemeModeChangedStateMapper.ensureInitialized()
        .encodeMap<ThemeModeChangedState>(this as ThemeModeChangedState);
  }

  ThemeModeChangedStateCopyWith<ThemeModeChangedState, ThemeModeChangedState,
          ThemeModeChangedState>
      get copyWith => _ThemeModeChangedStateCopyWithImpl(
          this as ThemeModeChangedState, $identity, $identity);
  @override
  String toString() {
    return ThemeModeChangedStateMapper.ensureInitialized()
        .stringifyValue(this as ThemeModeChangedState);
  }

  @override
  bool operator ==(Object other) {
    return ThemeModeChangedStateMapper.ensureInitialized()
        .equalsValue(this as ThemeModeChangedState, other);
  }

  @override
  int get hashCode {
    return ThemeModeChangedStateMapper.ensureInitialized()
        .hashValue(this as ThemeModeChangedState);
  }
}

extension ThemeModeChangedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ThemeModeChangedState, $Out> {
  ThemeModeChangedStateCopyWith<$R, ThemeModeChangedState, $Out>
      get $asThemeModeChangedState =>
          $base.as((v, t, t2) => _ThemeModeChangedStateCopyWithImpl(v, t, t2));
}

abstract class ThemeModeChangedStateCopyWith<
    $R,
    $In extends ThemeModeChangedState,
    $Out> implements ThemeModeStateCopyWith<$R, $In, $Out> {
  @override
  $R call({bool? isDarkMode, bool? useSystemTheme});
  ThemeModeChangedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ThemeModeChangedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ThemeModeChangedState, $Out>
    implements ThemeModeChangedStateCopyWith<$R, ThemeModeChangedState, $Out> {
  _ThemeModeChangedStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ThemeModeChangedState> $mapper =
      ThemeModeChangedStateMapper.ensureInitialized();
  @override
  $R call({bool? isDarkMode, bool? useSystemTheme}) =>
      $apply(FieldCopyWithData({
        if (isDarkMode != null) #isDarkMode: isDarkMode,
        if (useSystemTheme != null) #useSystemTheme: useSystemTheme
      }));
  @override
  ThemeModeChangedState $make(CopyWithData data) => ThemeModeChangedState(
      data.get(#isDarkMode, or: $value.isDarkMode),
      data.get(#useSystemTheme, or: $value.useSystemTheme));

  @override
  ThemeModeChangedStateCopyWith<$R2, ThemeModeChangedState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ThemeModeChangedStateCopyWithImpl($value, $cast, t);
}

class UseSystemThemeChangedStateMapper
    extends ClassMapperBase<UseSystemThemeChangedState> {
  UseSystemThemeChangedStateMapper._();

  static UseSystemThemeChangedStateMapper? _instance;
  static UseSystemThemeChangedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = UseSystemThemeChangedStateMapper._());
      ThemeModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UseSystemThemeChangedState';

  static bool _$useSystemTheme(UseSystemThemeChangedState v) =>
      v.useSystemTheme;
  static const Field<UseSystemThemeChangedState, bool> _f$useSystemTheme =
      Field('useSystemTheme', _$useSystemTheme);

  @override
  final MappableFields<UseSystemThemeChangedState> fields = const {
    #useSystemTheme: _f$useSystemTheme,
  };

  static UseSystemThemeChangedState _instantiate(DecodingData data) {
    return UseSystemThemeChangedState(data.dec(_f$useSystemTheme));
  }

  @override
  final Function instantiate = _instantiate;

  static UseSystemThemeChangedState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UseSystemThemeChangedState>(map);
  }

  static UseSystemThemeChangedState fromJson(String json) {
    return ensureInitialized().decodeJson<UseSystemThemeChangedState>(json);
  }
}

mixin UseSystemThemeChangedStateMappable {
  String toJson() {
    return UseSystemThemeChangedStateMapper.ensureInitialized()
        .encodeJson<UseSystemThemeChangedState>(
            this as UseSystemThemeChangedState);
  }

  Map<String, dynamic> toMap() {
    return UseSystemThemeChangedStateMapper.ensureInitialized()
        .encodeMap<UseSystemThemeChangedState>(
            this as UseSystemThemeChangedState);
  }

  UseSystemThemeChangedStateCopyWith<UseSystemThemeChangedState,
          UseSystemThemeChangedState, UseSystemThemeChangedState>
      get copyWith => _UseSystemThemeChangedStateCopyWithImpl(
          this as UseSystemThemeChangedState, $identity, $identity);
  @override
  String toString() {
    return UseSystemThemeChangedStateMapper.ensureInitialized()
        .stringifyValue(this as UseSystemThemeChangedState);
  }

  @override
  bool operator ==(Object other) {
    return UseSystemThemeChangedStateMapper.ensureInitialized()
        .equalsValue(this as UseSystemThemeChangedState, other);
  }

  @override
  int get hashCode {
    return UseSystemThemeChangedStateMapper.ensureInitialized()
        .hashValue(this as UseSystemThemeChangedState);
  }
}

extension UseSystemThemeChangedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UseSystemThemeChangedState, $Out> {
  UseSystemThemeChangedStateCopyWith<$R, UseSystemThemeChangedState, $Out>
      get $asUseSystemThemeChangedState => $base
          .as((v, t, t2) => _UseSystemThemeChangedStateCopyWithImpl(v, t, t2));
}

abstract class UseSystemThemeChangedStateCopyWith<
    $R,
    $In extends UseSystemThemeChangedState,
    $Out> implements ThemeModeStateCopyWith<$R, $In, $Out> {
  @override
  $R call({bool? useSystemTheme});
  UseSystemThemeChangedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UseSystemThemeChangedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UseSystemThemeChangedState, $Out>
    implements
        UseSystemThemeChangedStateCopyWith<$R, UseSystemThemeChangedState,
            $Out> {
  _UseSystemThemeChangedStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UseSystemThemeChangedState> $mapper =
      UseSystemThemeChangedStateMapper.ensureInitialized();
  @override
  $R call({bool? useSystemTheme}) => $apply(FieldCopyWithData(
      {if (useSystemTheme != null) #useSystemTheme: useSystemTheme}));
  @override
  UseSystemThemeChangedState $make(CopyWithData data) =>
      UseSystemThemeChangedState(
          data.get(#useSystemTheme, or: $value.useSystemTheme));

  @override
  UseSystemThemeChangedStateCopyWith<$R2, UseSystemThemeChangedState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _UseSystemThemeChangedStateCopyWithImpl($value, $cast, t);
}

class ErrorThemeModeStateMapper extends ClassMapperBase<ErrorThemeModeState> {
  ErrorThemeModeStateMapper._();

  static ErrorThemeModeStateMapper? _instance;
  static ErrorThemeModeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorThemeModeStateMapper._());
      ThemeModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ErrorThemeModeState';

  static String _$message(ErrorThemeModeState v) => v.message;
  static const Field<ErrorThemeModeState, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<ErrorThemeModeState> fields = const {
    #message: _f$message,
  };

  static ErrorThemeModeState _instantiate(DecodingData data) {
    return ErrorThemeModeState(data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ErrorThemeModeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ErrorThemeModeState>(map);
  }

  static ErrorThemeModeState fromJson(String json) {
    return ensureInitialized().decodeJson<ErrorThemeModeState>(json);
  }
}

mixin ErrorThemeModeStateMappable {
  String toJson() {
    return ErrorThemeModeStateMapper.ensureInitialized()
        .encodeJson<ErrorThemeModeState>(this as ErrorThemeModeState);
  }

  Map<String, dynamic> toMap() {
    return ErrorThemeModeStateMapper.ensureInitialized()
        .encodeMap<ErrorThemeModeState>(this as ErrorThemeModeState);
  }

  ErrorThemeModeStateCopyWith<ErrorThemeModeState, ErrorThemeModeState,
          ErrorThemeModeState>
      get copyWith => _ErrorThemeModeStateCopyWithImpl(
          this as ErrorThemeModeState, $identity, $identity);
  @override
  String toString() {
    return ErrorThemeModeStateMapper.ensureInitialized()
        .stringifyValue(this as ErrorThemeModeState);
  }

  @override
  bool operator ==(Object other) {
    return ErrorThemeModeStateMapper.ensureInitialized()
        .equalsValue(this as ErrorThemeModeState, other);
  }

  @override
  int get hashCode {
    return ErrorThemeModeStateMapper.ensureInitialized()
        .hashValue(this as ErrorThemeModeState);
  }
}

extension ErrorThemeModeStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ErrorThemeModeState, $Out> {
  ErrorThemeModeStateCopyWith<$R, ErrorThemeModeState, $Out>
      get $asErrorThemeModeState =>
          $base.as((v, t, t2) => _ErrorThemeModeStateCopyWithImpl(v, t, t2));
}

abstract class ErrorThemeModeStateCopyWith<$R, $In extends ErrorThemeModeState,
    $Out> implements ThemeModeStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  ErrorThemeModeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ErrorThemeModeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ErrorThemeModeState, $Out>
    implements ErrorThemeModeStateCopyWith<$R, ErrorThemeModeState, $Out> {
  _ErrorThemeModeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ErrorThemeModeState> $mapper =
      ErrorThemeModeStateMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  ErrorThemeModeState $make(CopyWithData data) =>
      ErrorThemeModeState(data.get(#message, or: $value.message));

  @override
  ErrorThemeModeStateCopyWith<$R2, ErrorThemeModeState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ErrorThemeModeStateCopyWithImpl($value, $cast, t);
}
