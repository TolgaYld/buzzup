// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth.state.dart';

class AuthStateMapper extends ClassMapperBase<AuthState> {
  AuthStateMapper._();

  static AuthStateMapper? _instance;
  static AuthStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStateMapper._());
      InitialStateMapper.ensureInitialized();
      SignedInStateMapper.ensureInitialized();
      SignedUpStateMapper.ensureInitialized();
      SignedOutStateMapper.ensureInitialized();
      AuthenticatedWithProviderStateMapper.ensureInitialized();
      UserUpdatedStateMapper.ensureInitialized();
      PasswordChangedStateMapper.ensureInitialized();
      PasswordResettedStateMapper.ensureInitialized();
      LoadingStateMapper.ensureInitialized();
      ErrorAuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthState';

  @override
  final MappableFields<AuthState> fields = const {};

  static AuthState _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('AuthState');
  }

  @override
  final Function instantiate = _instantiate;

  static AuthState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthState>(map);
  }

  static AuthState fromJson(String json) {
    return ensureInitialized().decodeJson<AuthState>(json);
  }
}

mixin AuthStateMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AuthStateCopyWith<AuthState, AuthState, AuthState> get copyWith;
}

abstract class AuthStateCopyWith<$R, $In extends AuthState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AuthStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class InitialStateMapper extends ClassMapperBase<InitialState> {
  InitialStateMapper._();

  static InitialStateMapper? _instance;
  static InitialStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InitialStateMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InitialState';

  @override
  final MappableFields<InitialState> fields = const {};

  static InitialState _instantiate(DecodingData data) {
    return InitialState();
  }

  @override
  final Function instantiate = _instantiate;

  static InitialState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InitialState>(map);
  }

  static InitialState fromJson(String json) {
    return ensureInitialized().decodeJson<InitialState>(json);
  }
}

mixin InitialStateMappable {
  String toJson() {
    return InitialStateMapper.ensureInitialized()
        .encodeJson<InitialState>(this as InitialState);
  }

  Map<String, dynamic> toMap() {
    return InitialStateMapper.ensureInitialized()
        .encodeMap<InitialState>(this as InitialState);
  }

  InitialStateCopyWith<InitialState, InitialState, InitialState> get copyWith =>
      _InitialStateCopyWithImpl(this as InitialState, $identity, $identity);
  @override
  String toString() {
    return InitialStateMapper.ensureInitialized()
        .stringifyValue(this as InitialState);
  }

  @override
  bool operator ==(Object other) {
    return InitialStateMapper.ensureInitialized()
        .equalsValue(this as InitialState, other);
  }

  @override
  int get hashCode {
    return InitialStateMapper.ensureInitialized()
        .hashValue(this as InitialState);
  }
}

extension InitialStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InitialState, $Out> {
  InitialStateCopyWith<$R, InitialState, $Out> get $asInitialState =>
      $base.as((v, t, t2) => _InitialStateCopyWithImpl(v, t, t2));
}

abstract class InitialStateCopyWith<$R, $In extends InitialState, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  InitialStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _InitialStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InitialState, $Out>
    implements InitialStateCopyWith<$R, InitialState, $Out> {
  _InitialStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InitialState> $mapper =
      InitialStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  InitialState $make(CopyWithData data) => InitialState();

  @override
  InitialStateCopyWith<$R2, InitialState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _InitialStateCopyWithImpl($value, $cast, t);
}

class SignedInStateMapper extends ClassMapperBase<SignedInState> {
  SignedInStateMapper._();

  static SignedInStateMapper? _instance;
  static SignedInStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignedInStateMapper._());
      AuthStateMapper.ensureInitialized();
      UserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignedInState';

  static User? _$user(SignedInState v) => v.user;
  static const Field<SignedInState, User> _f$user = Field('user', _$user);

  @override
  final MappableFields<SignedInState> fields = const {
    #user: _f$user,
  };

  static SignedInState _instantiate(DecodingData data) {
    return SignedInState(data.dec(_f$user));
  }

  @override
  final Function instantiate = _instantiate;

  static SignedInState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignedInState>(map);
  }

  static SignedInState fromJson(String json) {
    return ensureInitialized().decodeJson<SignedInState>(json);
  }
}

mixin SignedInStateMappable {
  String toJson() {
    return SignedInStateMapper.ensureInitialized()
        .encodeJson<SignedInState>(this as SignedInState);
  }

  Map<String, dynamic> toMap() {
    return SignedInStateMapper.ensureInitialized()
        .encodeMap<SignedInState>(this as SignedInState);
  }

  SignedInStateCopyWith<SignedInState, SignedInState, SignedInState>
      get copyWith => _SignedInStateCopyWithImpl(
          this as SignedInState, $identity, $identity);
  @override
  String toString() {
    return SignedInStateMapper.ensureInitialized()
        .stringifyValue(this as SignedInState);
  }

  @override
  bool operator ==(Object other) {
    return SignedInStateMapper.ensureInitialized()
        .equalsValue(this as SignedInState, other);
  }

  @override
  int get hashCode {
    return SignedInStateMapper.ensureInitialized()
        .hashValue(this as SignedInState);
  }
}

extension SignedInStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SignedInState, $Out> {
  SignedInStateCopyWith<$R, SignedInState, $Out> get $asSignedInState =>
      $base.as((v, t, t2) => _SignedInStateCopyWithImpl(v, t, t2));
}

abstract class SignedInStateCopyWith<$R, $In extends SignedInState, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User>? get user;
  @override
  $R call({User? user});
  SignedInStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SignedInStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SignedInState, $Out>
    implements SignedInStateCopyWith<$R, SignedInState, $Out> {
  _SignedInStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignedInState> $mapper =
      SignedInStateMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  $R call({Object? user = $none}) =>
      $apply(FieldCopyWithData({if (user != $none) #user: user}));
  @override
  SignedInState $make(CopyWithData data) =>
      SignedInState(data.get(#user, or: $value.user));

  @override
  SignedInStateCopyWith<$R2, SignedInState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SignedInStateCopyWithImpl($value, $cast, t);
}

class SignedUpStateMapper extends ClassMapperBase<SignedUpState> {
  SignedUpStateMapper._();

  static SignedUpStateMapper? _instance;
  static SignedUpStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignedUpStateMapper._());
      AuthStateMapper.ensureInitialized();
      UserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignedUpState';

  static User _$user(SignedUpState v) => v.user;
  static const Field<SignedUpState, User> _f$user = Field('user', _$user);

  @override
  final MappableFields<SignedUpState> fields = const {
    #user: _f$user,
  };

  static SignedUpState _instantiate(DecodingData data) {
    return SignedUpState(data.dec(_f$user));
  }

  @override
  final Function instantiate = _instantiate;

  static SignedUpState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignedUpState>(map);
  }

  static SignedUpState fromJson(String json) {
    return ensureInitialized().decodeJson<SignedUpState>(json);
  }
}

mixin SignedUpStateMappable {
  String toJson() {
    return SignedUpStateMapper.ensureInitialized()
        .encodeJson<SignedUpState>(this as SignedUpState);
  }

  Map<String, dynamic> toMap() {
    return SignedUpStateMapper.ensureInitialized()
        .encodeMap<SignedUpState>(this as SignedUpState);
  }

  SignedUpStateCopyWith<SignedUpState, SignedUpState, SignedUpState>
      get copyWith => _SignedUpStateCopyWithImpl(
          this as SignedUpState, $identity, $identity);
  @override
  String toString() {
    return SignedUpStateMapper.ensureInitialized()
        .stringifyValue(this as SignedUpState);
  }

  @override
  bool operator ==(Object other) {
    return SignedUpStateMapper.ensureInitialized()
        .equalsValue(this as SignedUpState, other);
  }

  @override
  int get hashCode {
    return SignedUpStateMapper.ensureInitialized()
        .hashValue(this as SignedUpState);
  }
}

extension SignedUpStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SignedUpState, $Out> {
  SignedUpStateCopyWith<$R, SignedUpState, $Out> get $asSignedUpState =>
      $base.as((v, t, t2) => _SignedUpStateCopyWithImpl(v, t, t2));
}

abstract class SignedUpStateCopyWith<$R, $In extends SignedUpState, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get user;
  @override
  $R call({User? user});
  SignedUpStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SignedUpStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SignedUpState, $Out>
    implements SignedUpStateCopyWith<$R, SignedUpState, $Out> {
  _SignedUpStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignedUpState> $mapper =
      SignedUpStateMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call({User? user}) =>
      $apply(FieldCopyWithData({if (user != null) #user: user}));
  @override
  SignedUpState $make(CopyWithData data) =>
      SignedUpState(data.get(#user, or: $value.user));

  @override
  SignedUpStateCopyWith<$R2, SignedUpState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SignedUpStateCopyWithImpl($value, $cast, t);
}

class SignedOutStateMapper extends ClassMapperBase<SignedOutState> {
  SignedOutStateMapper._();

  static SignedOutStateMapper? _instance;
  static SignedOutStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SignedOutStateMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SignedOutState';

  @override
  final MappableFields<SignedOutState> fields = const {};

  static SignedOutState _instantiate(DecodingData data) {
    return SignedOutState();
  }

  @override
  final Function instantiate = _instantiate;

  static SignedOutState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SignedOutState>(map);
  }

  static SignedOutState fromJson(String json) {
    return ensureInitialized().decodeJson<SignedOutState>(json);
  }
}

mixin SignedOutStateMappable {
  String toJson() {
    return SignedOutStateMapper.ensureInitialized()
        .encodeJson<SignedOutState>(this as SignedOutState);
  }

  Map<String, dynamic> toMap() {
    return SignedOutStateMapper.ensureInitialized()
        .encodeMap<SignedOutState>(this as SignedOutState);
  }

  SignedOutStateCopyWith<SignedOutState, SignedOutState, SignedOutState>
      get copyWith => _SignedOutStateCopyWithImpl(
          this as SignedOutState, $identity, $identity);
  @override
  String toString() {
    return SignedOutStateMapper.ensureInitialized()
        .stringifyValue(this as SignedOutState);
  }

  @override
  bool operator ==(Object other) {
    return SignedOutStateMapper.ensureInitialized()
        .equalsValue(this as SignedOutState, other);
  }

  @override
  int get hashCode {
    return SignedOutStateMapper.ensureInitialized()
        .hashValue(this as SignedOutState);
  }
}

extension SignedOutStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SignedOutState, $Out> {
  SignedOutStateCopyWith<$R, SignedOutState, $Out> get $asSignedOutState =>
      $base.as((v, t, t2) => _SignedOutStateCopyWithImpl(v, t, t2));
}

abstract class SignedOutStateCopyWith<$R, $In extends SignedOutState, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  SignedOutStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SignedOutStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SignedOutState, $Out>
    implements SignedOutStateCopyWith<$R, SignedOutState, $Out> {
  _SignedOutStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SignedOutState> $mapper =
      SignedOutStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  SignedOutState $make(CopyWithData data) => SignedOutState();

  @override
  SignedOutStateCopyWith<$R2, SignedOutState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SignedOutStateCopyWithImpl($value, $cast, t);
}

class AuthenticatedWithProviderStateMapper
    extends ClassMapperBase<AuthenticatedWithProviderState> {
  AuthenticatedWithProviderStateMapper._();

  static AuthenticatedWithProviderStateMapper? _instance;
  static AuthenticatedWithProviderStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AuthenticatedWithProviderStateMapper._());
      AuthStateMapper.ensureInitialized();
      UserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthenticatedWithProviderState';

  static User _$user(AuthenticatedWithProviderState v) => v.user;
  static const Field<AuthenticatedWithProviderState, User> _f$user =
      Field('user', _$user);

  @override
  final MappableFields<AuthenticatedWithProviderState> fields = const {
    #user: _f$user,
  };

  static AuthenticatedWithProviderState _instantiate(DecodingData data) {
    return AuthenticatedWithProviderState(data.dec(_f$user));
  }

  @override
  final Function instantiate = _instantiate;

  static AuthenticatedWithProviderState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthenticatedWithProviderState>(map);
  }

  static AuthenticatedWithProviderState fromJson(String json) {
    return ensureInitialized().decodeJson<AuthenticatedWithProviderState>(json);
  }
}

mixin AuthenticatedWithProviderStateMappable {
  String toJson() {
    return AuthenticatedWithProviderStateMapper.ensureInitialized()
        .encodeJson<AuthenticatedWithProviderState>(
            this as AuthenticatedWithProviderState);
  }

  Map<String, dynamic> toMap() {
    return AuthenticatedWithProviderStateMapper.ensureInitialized()
        .encodeMap<AuthenticatedWithProviderState>(
            this as AuthenticatedWithProviderState);
  }

  AuthenticatedWithProviderStateCopyWith<AuthenticatedWithProviderState,
          AuthenticatedWithProviderState, AuthenticatedWithProviderState>
      get copyWith => _AuthenticatedWithProviderStateCopyWithImpl(
          this as AuthenticatedWithProviderState, $identity, $identity);
  @override
  String toString() {
    return AuthenticatedWithProviderStateMapper.ensureInitialized()
        .stringifyValue(this as AuthenticatedWithProviderState);
  }

  @override
  bool operator ==(Object other) {
    return AuthenticatedWithProviderStateMapper.ensureInitialized()
        .equalsValue(this as AuthenticatedWithProviderState, other);
  }

  @override
  int get hashCode {
    return AuthenticatedWithProviderStateMapper.ensureInitialized()
        .hashValue(this as AuthenticatedWithProviderState);
  }
}

extension AuthenticatedWithProviderStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthenticatedWithProviderState, $Out> {
  AuthenticatedWithProviderStateCopyWith<$R, AuthenticatedWithProviderState,
          $Out>
      get $asAuthenticatedWithProviderState => $base.as(
          (v, t, t2) => _AuthenticatedWithProviderStateCopyWithImpl(v, t, t2));
}

abstract class AuthenticatedWithProviderStateCopyWith<
    $R,
    $In extends AuthenticatedWithProviderState,
    $Out> implements AuthStateCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get user;
  @override
  $R call({User? user});
  AuthenticatedWithProviderStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AuthenticatedWithProviderStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthenticatedWithProviderState, $Out>
    implements
        AuthenticatedWithProviderStateCopyWith<$R,
            AuthenticatedWithProviderState, $Out> {
  _AuthenticatedWithProviderStateCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthenticatedWithProviderState> $mapper =
      AuthenticatedWithProviderStateMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get user =>
      $value.user.copyWith.$chain((v) => call(user: v));
  @override
  $R call({User? user}) =>
      $apply(FieldCopyWithData({if (user != null) #user: user}));
  @override
  AuthenticatedWithProviderState $make(CopyWithData data) =>
      AuthenticatedWithProviderState(data.get(#user, or: $value.user));

  @override
  AuthenticatedWithProviderStateCopyWith<$R2, AuthenticatedWithProviderState,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AuthenticatedWithProviderStateCopyWithImpl($value, $cast, t);
}

class UserUpdatedStateMapper extends ClassMapperBase<UserUpdatedState> {
  UserUpdatedStateMapper._();

  static UserUpdatedStateMapper? _instance;
  static UserUpdatedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserUpdatedStateMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserUpdatedState';

  @override
  final MappableFields<UserUpdatedState> fields = const {};

  static UserUpdatedState _instantiate(DecodingData data) {
    return UserUpdatedState();
  }

  @override
  final Function instantiate = _instantiate;

  static UserUpdatedState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserUpdatedState>(map);
  }

  static UserUpdatedState fromJson(String json) {
    return ensureInitialized().decodeJson<UserUpdatedState>(json);
  }
}

mixin UserUpdatedStateMappable {
  String toJson() {
    return UserUpdatedStateMapper.ensureInitialized()
        .encodeJson<UserUpdatedState>(this as UserUpdatedState);
  }

  Map<String, dynamic> toMap() {
    return UserUpdatedStateMapper.ensureInitialized()
        .encodeMap<UserUpdatedState>(this as UserUpdatedState);
  }

  UserUpdatedStateCopyWith<UserUpdatedState, UserUpdatedState, UserUpdatedState>
      get copyWith => _UserUpdatedStateCopyWithImpl(
          this as UserUpdatedState, $identity, $identity);
  @override
  String toString() {
    return UserUpdatedStateMapper.ensureInitialized()
        .stringifyValue(this as UserUpdatedState);
  }

  @override
  bool operator ==(Object other) {
    return UserUpdatedStateMapper.ensureInitialized()
        .equalsValue(this as UserUpdatedState, other);
  }

  @override
  int get hashCode {
    return UserUpdatedStateMapper.ensureInitialized()
        .hashValue(this as UserUpdatedState);
  }
}

extension UserUpdatedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserUpdatedState, $Out> {
  UserUpdatedStateCopyWith<$R, UserUpdatedState, $Out>
      get $asUserUpdatedState =>
          $base.as((v, t, t2) => _UserUpdatedStateCopyWithImpl(v, t, t2));
}

abstract class UserUpdatedStateCopyWith<$R, $In extends UserUpdatedState, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  UserUpdatedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UserUpdatedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserUpdatedState, $Out>
    implements UserUpdatedStateCopyWith<$R, UserUpdatedState, $Out> {
  _UserUpdatedStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserUpdatedState> $mapper =
      UserUpdatedStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  UserUpdatedState $make(CopyWithData data) => UserUpdatedState();

  @override
  UserUpdatedStateCopyWith<$R2, UserUpdatedState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserUpdatedStateCopyWithImpl($value, $cast, t);
}

class PasswordChangedStateMapper extends ClassMapperBase<PasswordChangedState> {
  PasswordChangedStateMapper._();

  static PasswordChangedStateMapper? _instance;
  static PasswordChangedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PasswordChangedStateMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PasswordChangedState';

  @override
  final MappableFields<PasswordChangedState> fields = const {};

  static PasswordChangedState _instantiate(DecodingData data) {
    return PasswordChangedState();
  }

  @override
  final Function instantiate = _instantiate;

  static PasswordChangedState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PasswordChangedState>(map);
  }

  static PasswordChangedState fromJson(String json) {
    return ensureInitialized().decodeJson<PasswordChangedState>(json);
  }
}

mixin PasswordChangedStateMappable {
  String toJson() {
    return PasswordChangedStateMapper.ensureInitialized()
        .encodeJson<PasswordChangedState>(this as PasswordChangedState);
  }

  Map<String, dynamic> toMap() {
    return PasswordChangedStateMapper.ensureInitialized()
        .encodeMap<PasswordChangedState>(this as PasswordChangedState);
  }

  PasswordChangedStateCopyWith<PasswordChangedState, PasswordChangedState,
          PasswordChangedState>
      get copyWith => _PasswordChangedStateCopyWithImpl(
          this as PasswordChangedState, $identity, $identity);
  @override
  String toString() {
    return PasswordChangedStateMapper.ensureInitialized()
        .stringifyValue(this as PasswordChangedState);
  }

  @override
  bool operator ==(Object other) {
    return PasswordChangedStateMapper.ensureInitialized()
        .equalsValue(this as PasswordChangedState, other);
  }

  @override
  int get hashCode {
    return PasswordChangedStateMapper.ensureInitialized()
        .hashValue(this as PasswordChangedState);
  }
}

extension PasswordChangedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PasswordChangedState, $Out> {
  PasswordChangedStateCopyWith<$R, PasswordChangedState, $Out>
      get $asPasswordChangedState =>
          $base.as((v, t, t2) => _PasswordChangedStateCopyWithImpl(v, t, t2));
}

abstract class PasswordChangedStateCopyWith<
    $R,
    $In extends PasswordChangedState,
    $Out> implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  PasswordChangedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PasswordChangedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PasswordChangedState, $Out>
    implements PasswordChangedStateCopyWith<$R, PasswordChangedState, $Out> {
  _PasswordChangedStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PasswordChangedState> $mapper =
      PasswordChangedStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  PasswordChangedState $make(CopyWithData data) => PasswordChangedState();

  @override
  PasswordChangedStateCopyWith<$R2, PasswordChangedState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PasswordChangedStateCopyWithImpl($value, $cast, t);
}

class PasswordResettedStateMapper
    extends ClassMapperBase<PasswordResettedState> {
  PasswordResettedStateMapper._();

  static PasswordResettedStateMapper? _instance;
  static PasswordResettedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PasswordResettedStateMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PasswordResettedState';

  @override
  final MappableFields<PasswordResettedState> fields = const {};

  static PasswordResettedState _instantiate(DecodingData data) {
    return PasswordResettedState();
  }

  @override
  final Function instantiate = _instantiate;

  static PasswordResettedState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PasswordResettedState>(map);
  }

  static PasswordResettedState fromJson(String json) {
    return ensureInitialized().decodeJson<PasswordResettedState>(json);
  }
}

mixin PasswordResettedStateMappable {
  String toJson() {
    return PasswordResettedStateMapper.ensureInitialized()
        .encodeJson<PasswordResettedState>(this as PasswordResettedState);
  }

  Map<String, dynamic> toMap() {
    return PasswordResettedStateMapper.ensureInitialized()
        .encodeMap<PasswordResettedState>(this as PasswordResettedState);
  }

  PasswordResettedStateCopyWith<PasswordResettedState, PasswordResettedState,
          PasswordResettedState>
      get copyWith => _PasswordResettedStateCopyWithImpl(
          this as PasswordResettedState, $identity, $identity);
  @override
  String toString() {
    return PasswordResettedStateMapper.ensureInitialized()
        .stringifyValue(this as PasswordResettedState);
  }

  @override
  bool operator ==(Object other) {
    return PasswordResettedStateMapper.ensureInitialized()
        .equalsValue(this as PasswordResettedState, other);
  }

  @override
  int get hashCode {
    return PasswordResettedStateMapper.ensureInitialized()
        .hashValue(this as PasswordResettedState);
  }
}

extension PasswordResettedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PasswordResettedState, $Out> {
  PasswordResettedStateCopyWith<$R, PasswordResettedState, $Out>
      get $asPasswordResettedState =>
          $base.as((v, t, t2) => _PasswordResettedStateCopyWithImpl(v, t, t2));
}

abstract class PasswordResettedStateCopyWith<
    $R,
    $In extends PasswordResettedState,
    $Out> implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  PasswordResettedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PasswordResettedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PasswordResettedState, $Out>
    implements PasswordResettedStateCopyWith<$R, PasswordResettedState, $Out> {
  _PasswordResettedStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PasswordResettedState> $mapper =
      PasswordResettedStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  PasswordResettedState $make(CopyWithData data) => PasswordResettedState();

  @override
  PasswordResettedStateCopyWith<$R2, PasswordResettedState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PasswordResettedStateCopyWithImpl($value, $cast, t);
}

class LoadingStateMapper extends ClassMapperBase<LoadingState> {
  LoadingStateMapper._();

  static LoadingStateMapper? _instance;
  static LoadingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoadingStateMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LoadingState';

  @override
  final MappableFields<LoadingState> fields = const {};

  static LoadingState _instantiate(DecodingData data) {
    return LoadingState();
  }

  @override
  final Function instantiate = _instantiate;

  static LoadingState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoadingState>(map);
  }

  static LoadingState fromJson(String json) {
    return ensureInitialized().decodeJson<LoadingState>(json);
  }
}

mixin LoadingStateMappable {
  String toJson() {
    return LoadingStateMapper.ensureInitialized()
        .encodeJson<LoadingState>(this as LoadingState);
  }

  Map<String, dynamic> toMap() {
    return LoadingStateMapper.ensureInitialized()
        .encodeMap<LoadingState>(this as LoadingState);
  }

  LoadingStateCopyWith<LoadingState, LoadingState, LoadingState> get copyWith =>
      _LoadingStateCopyWithImpl(this as LoadingState, $identity, $identity);
  @override
  String toString() {
    return LoadingStateMapper.ensureInitialized()
        .stringifyValue(this as LoadingState);
  }

  @override
  bool operator ==(Object other) {
    return LoadingStateMapper.ensureInitialized()
        .equalsValue(this as LoadingState, other);
  }

  @override
  int get hashCode {
    return LoadingStateMapper.ensureInitialized()
        .hashValue(this as LoadingState);
  }
}

extension LoadingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoadingState, $Out> {
  LoadingStateCopyWith<$R, LoadingState, $Out> get $asLoadingState =>
      $base.as((v, t, t2) => _LoadingStateCopyWithImpl(v, t, t2));
}

abstract class LoadingStateCopyWith<$R, $In extends LoadingState, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  LoadingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoadingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoadingState, $Out>
    implements LoadingStateCopyWith<$R, LoadingState, $Out> {
  _LoadingStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoadingState> $mapper =
      LoadingStateMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  LoadingState $make(CopyWithData data) => LoadingState();

  @override
  LoadingStateCopyWith<$R2, LoadingState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LoadingStateCopyWithImpl($value, $cast, t);
}

class ErrorAuthStateMapper extends ClassMapperBase<ErrorAuthState> {
  ErrorAuthStateMapper._();

  static ErrorAuthStateMapper? _instance;
  static ErrorAuthStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorAuthStateMapper._());
      AuthStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ErrorAuthState';

  static String _$message(ErrorAuthState v) => v.message;
  static const Field<ErrorAuthState, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<ErrorAuthState> fields = const {
    #message: _f$message,
  };

  static ErrorAuthState _instantiate(DecodingData data) {
    return ErrorAuthState(data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ErrorAuthState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ErrorAuthState>(map);
  }

  static ErrorAuthState fromJson(String json) {
    return ensureInitialized().decodeJson<ErrorAuthState>(json);
  }
}

mixin ErrorAuthStateMappable {
  String toJson() {
    return ErrorAuthStateMapper.ensureInitialized()
        .encodeJson<ErrorAuthState>(this as ErrorAuthState);
  }

  Map<String, dynamic> toMap() {
    return ErrorAuthStateMapper.ensureInitialized()
        .encodeMap<ErrorAuthState>(this as ErrorAuthState);
  }

  ErrorAuthStateCopyWith<ErrorAuthState, ErrorAuthState, ErrorAuthState>
      get copyWith => _ErrorAuthStateCopyWithImpl(
          this as ErrorAuthState, $identity, $identity);
  @override
  String toString() {
    return ErrorAuthStateMapper.ensureInitialized()
        .stringifyValue(this as ErrorAuthState);
  }

  @override
  bool operator ==(Object other) {
    return ErrorAuthStateMapper.ensureInitialized()
        .equalsValue(this as ErrorAuthState, other);
  }

  @override
  int get hashCode {
    return ErrorAuthStateMapper.ensureInitialized()
        .hashValue(this as ErrorAuthState);
  }
}

extension ErrorAuthStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ErrorAuthState, $Out> {
  ErrorAuthStateCopyWith<$R, ErrorAuthState, $Out> get $asErrorAuthState =>
      $base.as((v, t, t2) => _ErrorAuthStateCopyWithImpl(v, t, t2));
}

abstract class ErrorAuthStateCopyWith<$R, $In extends ErrorAuthState, $Out>
    implements AuthStateCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message});
  ErrorAuthStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ErrorAuthStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ErrorAuthState, $Out>
    implements ErrorAuthStateCopyWith<$R, ErrorAuthState, $Out> {
  _ErrorAuthStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ErrorAuthState> $mapper =
      ErrorAuthStateMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  ErrorAuthState $make(CopyWithData data) =>
      ErrorAuthState(data.get(#message, or: $value.message));

  @override
  ErrorAuthStateCopyWith<$R2, ErrorAuthState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ErrorAuthStateCopyWithImpl($value, $cast, t);
}
