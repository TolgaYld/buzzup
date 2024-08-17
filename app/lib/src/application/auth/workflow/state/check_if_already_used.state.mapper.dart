// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'check_if_already_used.state.dart';

class CheckIfAlreadyUsedStateMapper
    extends ClassMapperBase<CheckIfAlreadyUsedState> {
  CheckIfAlreadyUsedStateMapper._();

  static CheckIfAlreadyUsedStateMapper? _instance;
  static CheckIfAlreadyUsedStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CheckIfAlreadyUsedStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CheckIfAlreadyUsedState';

  static bool _$emailIsAlreadyUsed(CheckIfAlreadyUsedState v) =>
      v.emailIsAlreadyUsed;
  static const Field<CheckIfAlreadyUsedState, bool> _f$emailIsAlreadyUsed =
      Field('emailIsAlreadyUsed', _$emailIsAlreadyUsed);
  static bool _$usernameIsAlreadyUsed(CheckIfAlreadyUsedState v) =>
      v.usernameIsAlreadyUsed;
  static const Field<CheckIfAlreadyUsedState, bool> _f$usernameIsAlreadyUsed =
      Field('usernameIsAlreadyUsed', _$usernameIsAlreadyUsed);
  static bool _$hasFailure(CheckIfAlreadyUsedState v) => v.hasFailure;
  static const Field<CheckIfAlreadyUsedState, bool> _f$hasFailure =
      Field('hasFailure', _$hasFailure);

  @override
  final MappableFields<CheckIfAlreadyUsedState> fields = const {
    #emailIsAlreadyUsed: _f$emailIsAlreadyUsed,
    #usernameIsAlreadyUsed: _f$usernameIsAlreadyUsed,
    #hasFailure: _f$hasFailure,
  };

  static CheckIfAlreadyUsedState _instantiate(DecodingData data) {
    return CheckIfAlreadyUsedState(
        emailIsAlreadyUsed: data.dec(_f$emailIsAlreadyUsed),
        usernameIsAlreadyUsed: data.dec(_f$usernameIsAlreadyUsed),
        hasFailure: data.dec(_f$hasFailure));
  }

  @override
  final Function instantiate = _instantiate;

  static CheckIfAlreadyUsedState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CheckIfAlreadyUsedState>(map);
  }

  static CheckIfAlreadyUsedState fromJson(String json) {
    return ensureInitialized().decodeJson<CheckIfAlreadyUsedState>(json);
  }
}

mixin CheckIfAlreadyUsedStateMappable {
  String toJson() {
    return CheckIfAlreadyUsedStateMapper.ensureInitialized()
        .encodeJson<CheckIfAlreadyUsedState>(this as CheckIfAlreadyUsedState);
  }

  Map<String, dynamic> toMap() {
    return CheckIfAlreadyUsedStateMapper.ensureInitialized()
        .encodeMap<CheckIfAlreadyUsedState>(this as CheckIfAlreadyUsedState);
  }

  CheckIfAlreadyUsedStateCopyWith<CheckIfAlreadyUsedState,
          CheckIfAlreadyUsedState, CheckIfAlreadyUsedState>
      get copyWith => _CheckIfAlreadyUsedStateCopyWithImpl(
          this as CheckIfAlreadyUsedState, $identity, $identity);
  @override
  String toString() {
    return CheckIfAlreadyUsedStateMapper.ensureInitialized()
        .stringifyValue(this as CheckIfAlreadyUsedState);
  }

  @override
  bool operator ==(Object other) {
    return CheckIfAlreadyUsedStateMapper.ensureInitialized()
        .equalsValue(this as CheckIfAlreadyUsedState, other);
  }

  @override
  int get hashCode {
    return CheckIfAlreadyUsedStateMapper.ensureInitialized()
        .hashValue(this as CheckIfAlreadyUsedState);
  }
}

extension CheckIfAlreadyUsedStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CheckIfAlreadyUsedState, $Out> {
  CheckIfAlreadyUsedStateCopyWith<$R, CheckIfAlreadyUsedState, $Out>
      get $asCheckIfAlreadyUsedState => $base
          .as((v, t, t2) => _CheckIfAlreadyUsedStateCopyWithImpl(v, t, t2));
}

abstract class CheckIfAlreadyUsedStateCopyWith<
    $R,
    $In extends CheckIfAlreadyUsedState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {bool? emailIsAlreadyUsed,
      bool? usernameIsAlreadyUsed,
      bool? hasFailure});
  CheckIfAlreadyUsedStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CheckIfAlreadyUsedStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CheckIfAlreadyUsedState, $Out>
    implements
        CheckIfAlreadyUsedStateCopyWith<$R, CheckIfAlreadyUsedState, $Out> {
  _CheckIfAlreadyUsedStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CheckIfAlreadyUsedState> $mapper =
      CheckIfAlreadyUsedStateMapper.ensureInitialized();
  @override
  $R call(
          {bool? emailIsAlreadyUsed,
          bool? usernameIsAlreadyUsed,
          bool? hasFailure}) =>
      $apply(FieldCopyWithData({
        if (emailIsAlreadyUsed != null) #emailIsAlreadyUsed: emailIsAlreadyUsed,
        if (usernameIsAlreadyUsed != null)
          #usernameIsAlreadyUsed: usernameIsAlreadyUsed,
        if (hasFailure != null) #hasFailure: hasFailure
      }));
  @override
  CheckIfAlreadyUsedState $make(CopyWithData data) => CheckIfAlreadyUsedState(
      emailIsAlreadyUsed:
          data.get(#emailIsAlreadyUsed, or: $value.emailIsAlreadyUsed),
      usernameIsAlreadyUsed:
          data.get(#usernameIsAlreadyUsed, or: $value.usernameIsAlreadyUsed),
      hasFailure: data.get(#hasFailure, or: $value.hasFailure));

  @override
  CheckIfAlreadyUsedStateCopyWith<$R2, CheckIfAlreadyUsedState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CheckIfAlreadyUsedStateCopyWithImpl($value, $cast, t);
}
