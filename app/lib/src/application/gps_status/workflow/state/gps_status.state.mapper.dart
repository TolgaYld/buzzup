// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'gps_status.state.dart';

class GpsStatusStateMapper extends ClassMapperBase<GpsStatusState> {
  GpsStatusStateMapper._();

  static GpsStatusStateMapper? _instance;
  static GpsStatusStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GpsStatusStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GpsStatusState';

  static ServiceStatus _$status(GpsStatusState v) => v.status;
  static const Field<GpsStatusState, ServiceStatus> _f$status =
      Field('status', _$status);
  static LocationPermission _$permission(GpsStatusState v) => v.permission;
  static const Field<GpsStatusState, LocationPermission> _f$permission =
      Field('permission', _$permission);
  static String? _$failureMessage(GpsStatusState v) => v.failureMessage;
  static const Field<GpsStatusState, String> _f$failureMessage =
      Field('failureMessage', _$failureMessage, opt: true);

  @override
  final MappableFields<GpsStatusState> fields = const {
    #status: _f$status,
    #permission: _f$permission,
    #failureMessage: _f$failureMessage,
  };

  static GpsStatusState _instantiate(DecodingData data) {
    return GpsStatusState(
        status: data.dec(_f$status),
        permission: data.dec(_f$permission),
        failureMessage: data.dec(_f$failureMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static GpsStatusState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GpsStatusState>(map);
  }

  static GpsStatusState fromJson(String json) {
    return ensureInitialized().decodeJson<GpsStatusState>(json);
  }
}

mixin GpsStatusStateMappable {
  String toJson() {
    return GpsStatusStateMapper.ensureInitialized()
        .encodeJson<GpsStatusState>(this as GpsStatusState);
  }

  Map<String, dynamic> toMap() {
    return GpsStatusStateMapper.ensureInitialized()
        .encodeMap<GpsStatusState>(this as GpsStatusState);
  }

  GpsStatusStateCopyWith<GpsStatusState, GpsStatusState, GpsStatusState>
      get copyWith => _GpsStatusStateCopyWithImpl(
          this as GpsStatusState, $identity, $identity);
  @override
  String toString() {
    return GpsStatusStateMapper.ensureInitialized()
        .stringifyValue(this as GpsStatusState);
  }

  @override
  bool operator ==(Object other) {
    return GpsStatusStateMapper.ensureInitialized()
        .equalsValue(this as GpsStatusState, other);
  }

  @override
  int get hashCode {
    return GpsStatusStateMapper.ensureInitialized()
        .hashValue(this as GpsStatusState);
  }
}

extension GpsStatusStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GpsStatusState, $Out> {
  GpsStatusStateCopyWith<$R, GpsStatusState, $Out> get $asGpsStatusState =>
      $base.as((v, t, t2) => _GpsStatusStateCopyWithImpl(v, t, t2));
}

abstract class GpsStatusStateCopyWith<$R, $In extends GpsStatusState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {ServiceStatus? status,
      LocationPermission? permission,
      String? failureMessage});
  GpsStatusStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GpsStatusStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GpsStatusState, $Out>
    implements GpsStatusStateCopyWith<$R, GpsStatusState, $Out> {
  _GpsStatusStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GpsStatusState> $mapper =
      GpsStatusStateMapper.ensureInitialized();
  @override
  $R call(
          {ServiceStatus? status,
          LocationPermission? permission,
          Object? failureMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (permission != null) #permission: permission,
        if (failureMessage != $none) #failureMessage: failureMessage
      }));
  @override
  GpsStatusState $make(CopyWithData data) => GpsStatusState(
      status: data.get(#status, or: $value.status),
      permission: data.get(#permission, or: $value.permission),
      failureMessage: data.get(#failureMessage, or: $value.failureMessage));

  @override
  GpsStatusStateCopyWith<$R2, GpsStatusState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GpsStatusStateCopyWithImpl($value, $cast, t);
}
