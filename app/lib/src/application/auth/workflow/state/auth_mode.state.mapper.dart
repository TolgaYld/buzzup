// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_mode.state.dart';

class AuthModeStateMapper extends ClassMapperBase<AuthModeState> {
  AuthModeStateMapper._();

  static AuthModeStateMapper? _instance;
  static AuthModeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthModeStateMapper._());
      SignInAuthModeStateMapper.ensureInitialized();
      SignUpAuthModeStateMapper.ensureInitialized();
      ForgotPasswordAuthModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthModeState';

  static GlobalKey<State<StatefulWidget>> _$formKey(AuthModeState v) =>
      v.formKey;
  static const Field<AuthModeState, GlobalKey<State<StatefulWidget>>>
      _f$formKey = Field('formKey', _$formKey);
  static int _$numberOfTextFields(AuthModeState v) => v.numberOfTextFields;
  static const Field<AuthModeState, int> _f$numberOfTextFields =
      Field('numberOfTextFields', _$numberOfTextFields);

  @override
  final MappableFields<AuthModeState> fields = const {
    #formKey: _f$formKey,
    #numberOfTextFields: _f$numberOfTextFields,
  };

  static AuthModeState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('AuthModeState');
  }

  @override
  final Function instantiate = _instantiate;

  static AuthModeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthModeState>(map);
  }

  static AuthModeState fromJson(String json) {
    return ensureInitialized().decodeJson<AuthModeState>(json);
  }
}

mixin AuthModeStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AuthModeStateCopyWith<AuthModeState, AuthModeState, AuthModeState>
      get copyWith;
}

abstract class AuthModeStateCopyWith<$R, $In extends AuthModeState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({GlobalKey<State<StatefulWidget>>? formKey, int? numberOfTextFields});
  AuthModeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class SignInAuthModeStateMapper extends ClassMapperBase<SignInAuthModeState> {
  SignInAuthModeStateMapper._();

  static SignInAuthModeStateMapper? _instance;
  static SignInAuthModeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignInAuthModeStateMapper._());
      AuthModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignInAuthModeState';

  static GlobalKey<State<StatefulWidget>> _$formKey(SignInAuthModeState v) =>
      v.formKey;
  static const Field<SignInAuthModeState, GlobalKey<State<StatefulWidget>>>
      _f$formKey = Field('formKey', _$formKey);
  static int _$numberOfTextFields(SignInAuthModeState v) =>
      v.numberOfTextFields;
  static const Field<SignInAuthModeState, int> _f$numberOfTextFields =
      Field('numberOfTextFields', _$numberOfTextFields);

  @override
  final MappableFields<SignInAuthModeState> fields = const {
    #formKey: _f$formKey,
    #numberOfTextFields: _f$numberOfTextFields,
  };

  static SignInAuthModeState _instantiate(DecodingData data) {
    return SignInAuthModeState(
        formKey: data.dec(_f$formKey),
        numberOfTextFields: data.dec(_f$numberOfTextFields));
  }

  @override
  final Function instantiate = _instantiate;

  static SignInAuthModeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignInAuthModeState>(map);
  }

  static SignInAuthModeState fromJson(String json) {
    return ensureInitialized().decodeJson<SignInAuthModeState>(json);
  }
}

mixin SignInAuthModeStateMappable {
  String toJson() {
    return SignInAuthModeStateMapper.ensureInitialized()
        .encodeJson<SignInAuthModeState>(this as SignInAuthModeState);
  }

  Map<String, dynamic> toMap() {
    return SignInAuthModeStateMapper.ensureInitialized()
        .encodeMap<SignInAuthModeState>(this as SignInAuthModeState);
  }

  SignInAuthModeStateCopyWith<SignInAuthModeState, SignInAuthModeState,
          SignInAuthModeState>
      get copyWith => _SignInAuthModeStateCopyWithImpl(
          this as SignInAuthModeState, $identity, $identity);
  @override
  String toString() {
    return SignInAuthModeStateMapper.ensureInitialized()
        .stringifyValue(this as SignInAuthModeState);
  }

  @override
  bool operator ==(Object other) {
    return SignInAuthModeStateMapper.ensureInitialized()
        .equalsValue(this as SignInAuthModeState, other);
  }

  @override
  int get hashCode {
    return SignInAuthModeStateMapper.ensureInitialized()
        .hashValue(this as SignInAuthModeState);
  }
}

extension SignInAuthModeStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SignInAuthModeState, $Out> {
  SignInAuthModeStateCopyWith<$R, SignInAuthModeState, $Out>
      get $asSignInAuthModeState =>
          $base.as((v, t, t2) => _SignInAuthModeStateCopyWithImpl(v, t, t2));
}

abstract class SignInAuthModeStateCopyWith<$R, $In extends SignInAuthModeState,
    $Out> implements AuthModeStateCopyWith<$R, $In, $Out> {
  @override
  $R call({GlobalKey<State<StatefulWidget>>? formKey, int? numberOfTextFields});
  SignInAuthModeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SignInAuthModeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SignInAuthModeState, $Out>
    implements SignInAuthModeStateCopyWith<$R, SignInAuthModeState, $Out> {
  _SignInAuthModeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignInAuthModeState> $mapper =
      SignInAuthModeStateMapper.ensureInitialized();
  @override
  $R call(
          {GlobalKey<State<StatefulWidget>>? formKey,
          int? numberOfTextFields}) =>
      $apply(FieldCopyWithData({
        if (formKey != null) #formKey: formKey,
        if (numberOfTextFields != null) #numberOfTextFields: numberOfTextFields
      }));
  @override
  SignInAuthModeState $make(CopyWithData data) => SignInAuthModeState(
      formKey: data.get(#formKey, or: $value.formKey),
      numberOfTextFields:
          data.get(#numberOfTextFields, or: $value.numberOfTextFields));

  @override
  SignInAuthModeStateCopyWith<$R2, SignInAuthModeState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SignInAuthModeStateCopyWithImpl($value, $cast, t);
}

class SignUpAuthModeStateMapper extends ClassMapperBase<SignUpAuthModeState> {
  SignUpAuthModeStateMapper._();

  static SignUpAuthModeStateMapper? _instance;
  static SignUpAuthModeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignUpAuthModeStateMapper._());
      AuthModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignUpAuthModeState';

  static GlobalKey<State<StatefulWidget>> _$formKey(SignUpAuthModeState v) =>
      v.formKey;
  static const Field<SignUpAuthModeState, GlobalKey<State<StatefulWidget>>>
      _f$formKey = Field('formKey', _$formKey);
  static int _$numberOfTextFields(SignUpAuthModeState v) =>
      v.numberOfTextFields;
  static const Field<SignUpAuthModeState, int> _f$numberOfTextFields =
      Field('numberOfTextFields', _$numberOfTextFields);

  @override
  final MappableFields<SignUpAuthModeState> fields = const {
    #formKey: _f$formKey,
    #numberOfTextFields: _f$numberOfTextFields,
  };

  static SignUpAuthModeState _instantiate(DecodingData data) {
    return SignUpAuthModeState(
        formKey: data.dec(_f$formKey),
        numberOfTextFields: data.dec(_f$numberOfTextFields));
  }

  @override
  final Function instantiate = _instantiate;

  static SignUpAuthModeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignUpAuthModeState>(map);
  }

  static SignUpAuthModeState fromJson(String json) {
    return ensureInitialized().decodeJson<SignUpAuthModeState>(json);
  }
}

mixin SignUpAuthModeStateMappable {
  String toJson() {
    return SignUpAuthModeStateMapper.ensureInitialized()
        .encodeJson<SignUpAuthModeState>(this as SignUpAuthModeState);
  }

  Map<String, dynamic> toMap() {
    return SignUpAuthModeStateMapper.ensureInitialized()
        .encodeMap<SignUpAuthModeState>(this as SignUpAuthModeState);
  }

  SignUpAuthModeStateCopyWith<SignUpAuthModeState, SignUpAuthModeState,
          SignUpAuthModeState>
      get copyWith => _SignUpAuthModeStateCopyWithImpl(
          this as SignUpAuthModeState, $identity, $identity);
  @override
  String toString() {
    return SignUpAuthModeStateMapper.ensureInitialized()
        .stringifyValue(this as SignUpAuthModeState);
  }

  @override
  bool operator ==(Object other) {
    return SignUpAuthModeStateMapper.ensureInitialized()
        .equalsValue(this as SignUpAuthModeState, other);
  }

  @override
  int get hashCode {
    return SignUpAuthModeStateMapper.ensureInitialized()
        .hashValue(this as SignUpAuthModeState);
  }
}

extension SignUpAuthModeStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SignUpAuthModeState, $Out> {
  SignUpAuthModeStateCopyWith<$R, SignUpAuthModeState, $Out>
      get $asSignUpAuthModeState =>
          $base.as((v, t, t2) => _SignUpAuthModeStateCopyWithImpl(v, t, t2));
}

abstract class SignUpAuthModeStateCopyWith<$R, $In extends SignUpAuthModeState,
    $Out> implements AuthModeStateCopyWith<$R, $In, $Out> {
  @override
  $R call({GlobalKey<State<StatefulWidget>>? formKey, int? numberOfTextFields});
  SignUpAuthModeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SignUpAuthModeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SignUpAuthModeState, $Out>
    implements SignUpAuthModeStateCopyWith<$R, SignUpAuthModeState, $Out> {
  _SignUpAuthModeStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignUpAuthModeState> $mapper =
      SignUpAuthModeStateMapper.ensureInitialized();
  @override
  $R call(
          {GlobalKey<State<StatefulWidget>>? formKey,
          int? numberOfTextFields}) =>
      $apply(FieldCopyWithData({
        if (formKey != null) #formKey: formKey,
        if (numberOfTextFields != null) #numberOfTextFields: numberOfTextFields
      }));
  @override
  SignUpAuthModeState $make(CopyWithData data) => SignUpAuthModeState(
      formKey: data.get(#formKey, or: $value.formKey),
      numberOfTextFields:
          data.get(#numberOfTextFields, or: $value.numberOfTextFields));

  @override
  SignUpAuthModeStateCopyWith<$R2, SignUpAuthModeState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SignUpAuthModeStateCopyWithImpl($value, $cast, t);
}

class ForgotPasswordAuthModeStateMapper
    extends ClassMapperBase<ForgotPasswordAuthModeState> {
  ForgotPasswordAuthModeStateMapper._();

  static ForgotPasswordAuthModeStateMapper? _instance;
  static ForgotPasswordAuthModeStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ForgotPasswordAuthModeStateMapper._());
      AuthModeStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ForgotPasswordAuthModeState';

  static GlobalKey<State<StatefulWidget>> _$formKey(
          ForgotPasswordAuthModeState v) =>
      v.formKey;
  static const Field<ForgotPasswordAuthModeState,
          GlobalKey<State<StatefulWidget>>> _f$formKey =
      Field('formKey', _$formKey);
  static int _$numberOfTextFields(ForgotPasswordAuthModeState v) =>
      v.numberOfTextFields;
  static const Field<ForgotPasswordAuthModeState, int> _f$numberOfTextFields =
      Field('numberOfTextFields', _$numberOfTextFields);

  @override
  final MappableFields<ForgotPasswordAuthModeState> fields = const {
    #formKey: _f$formKey,
    #numberOfTextFields: _f$numberOfTextFields,
  };

  static ForgotPasswordAuthModeState _instantiate(DecodingData data) {
    return ForgotPasswordAuthModeState(
        formKey: data.dec(_f$formKey),
        numberOfTextFields: data.dec(_f$numberOfTextFields));
  }

  @override
  final Function instantiate = _instantiate;

  static ForgotPasswordAuthModeState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ForgotPasswordAuthModeState>(map);
  }

  static ForgotPasswordAuthModeState fromJson(String json) {
    return ensureInitialized().decodeJson<ForgotPasswordAuthModeState>(json);
  }
}

mixin ForgotPasswordAuthModeStateMappable {
  String toJson() {
    return ForgotPasswordAuthModeStateMapper.ensureInitialized()
        .encodeJson<ForgotPasswordAuthModeState>(
            this as ForgotPasswordAuthModeState);
  }

  Map<String, dynamic> toMap() {
    return ForgotPasswordAuthModeStateMapper.ensureInitialized()
        .encodeMap<ForgotPasswordAuthModeState>(
            this as ForgotPasswordAuthModeState);
  }

  ForgotPasswordAuthModeStateCopyWith<ForgotPasswordAuthModeState,
          ForgotPasswordAuthModeState, ForgotPasswordAuthModeState>
      get copyWith => _ForgotPasswordAuthModeStateCopyWithImpl(
          this as ForgotPasswordAuthModeState, $identity, $identity);
  @override
  String toString() {
    return ForgotPasswordAuthModeStateMapper.ensureInitialized()
        .stringifyValue(this as ForgotPasswordAuthModeState);
  }

  @override
  bool operator ==(Object other) {
    return ForgotPasswordAuthModeStateMapper.ensureInitialized()
        .equalsValue(this as ForgotPasswordAuthModeState, other);
  }

  @override
  int get hashCode {
    return ForgotPasswordAuthModeStateMapper.ensureInitialized()
        .hashValue(this as ForgotPasswordAuthModeState);
  }
}

extension ForgotPasswordAuthModeStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ForgotPasswordAuthModeState, $Out> {
  ForgotPasswordAuthModeStateCopyWith<$R, ForgotPasswordAuthModeState, $Out>
      get $asForgotPasswordAuthModeState => $base
          .as((v, t, t2) => _ForgotPasswordAuthModeStateCopyWithImpl(v, t, t2));
}

abstract class ForgotPasswordAuthModeStateCopyWith<
    $R,
    $In extends ForgotPasswordAuthModeState,
    $Out> implements AuthModeStateCopyWith<$R, $In, $Out> {
  @override
  $R call({GlobalKey<State<StatefulWidget>>? formKey, int? numberOfTextFields});
  ForgotPasswordAuthModeStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ForgotPasswordAuthModeStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ForgotPasswordAuthModeState, $Out>
    implements
        ForgotPasswordAuthModeStateCopyWith<$R, ForgotPasswordAuthModeState,
            $Out> {
  _ForgotPasswordAuthModeStateCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ForgotPasswordAuthModeState> $mapper =
      ForgotPasswordAuthModeStateMapper.ensureInitialized();
  @override
  $R call(
          {GlobalKey<State<StatefulWidget>>? formKey,
          int? numberOfTextFields}) =>
      $apply(FieldCopyWithData({
        if (formKey != null) #formKey: formKey,
        if (numberOfTextFields != null) #numberOfTextFields: numberOfTextFields
      }));
  @override
  ForgotPasswordAuthModeState $make(CopyWithData data) =>
      ForgotPasswordAuthModeState(
          formKey: data.get(#formKey, or: $value.formKey),
          numberOfTextFields:
              data.get(#numberOfTextFields, or: $value.numberOfTextFields));

  @override
  ForgotPasswordAuthModeStateCopyWith<$R2, ForgotPasswordAuthModeState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ForgotPasswordAuthModeStateCopyWithImpl($value, $cast, t);
}
