// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'failure.dart';

class FailureMapper extends ClassMapperBase<Failure> {
  FailureMapper._();

  static FailureMapper? _instance;
  static FailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FailureMapper._());
      ApiFailureMapper.ensureInitialized();
      CacheFailureMapper.ensureInitialized();
      GpsFailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Failure';

  static String _$message(Failure v) => v.message;
  static const Field<Failure, String> _f$message = Field('message', _$message);
  static bool _$isUnknownException(Failure v) => v.isUnknownException;
  static const Field<Failure, bool> _f$isUnknownException =
      Field('isUnknownException', _$isUnknownException, opt: true, def: false);
  static int? _$statusCode(Failure v) => v.statusCode;
  static const Field<Failure, int> _f$statusCode =
      Field('statusCode', _$statusCode, opt: true);

  @override
  final MappableFields<Failure> fields = const {
    #message: _f$message,
    #isUnknownException: _f$isUnknownException,
    #statusCode: _f$statusCode,
  };

  static Failure _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Failure');
  }

  @override
  final Function instantiate = _instantiate;

  static Failure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Failure>(map);
  }

  static Failure fromJson(String json) {
    return ensureInitialized().decodeJson<Failure>(json);
  }
}

mixin FailureMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FailureCopyWith<Failure, Failure, Failure> get copyWith;
}

abstract class FailureCopyWith<$R, $In extends Failure, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message, int? statusCode});
  FailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class ApiFailureMapper extends ClassMapperBase<ApiFailure> {
  ApiFailureMapper._();

  static ApiFailureMapper? _instance;
  static ApiFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiFailureMapper._());
      FailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ApiFailure';

  static String _$message(ApiFailure v) => v.message;
  static const Field<ApiFailure, String> _f$message =
      Field('message', _$message);
  static int? _$statusCode(ApiFailure v) => v.statusCode;
  static const Field<ApiFailure, int> _f$statusCode =
      Field('statusCode', _$statusCode, opt: true);
  static bool _$isUnknownException(ApiFailure v) => v.isUnknownException;
  static const Field<ApiFailure, bool> _f$isUnknownException =
      Field('isUnknownException', _$isUnknownException, mode: FieldMode.member);

  @override
  final MappableFields<ApiFailure> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
    #isUnknownException: _f$isUnknownException,
  };

  static ApiFailure _instantiate(DecodingData data) {
    return ApiFailure(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ApiFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApiFailure>(map);
  }

  static ApiFailure fromJson(String json) {
    return ensureInitialized().decodeJson<ApiFailure>(json);
  }
}

mixin ApiFailureMappable {
  String toJson() {
    return ApiFailureMapper.ensureInitialized()
        .encodeJson<ApiFailure>(this as ApiFailure);
  }

  Map<String, dynamic> toMap() {
    return ApiFailureMapper.ensureInitialized()
        .encodeMap<ApiFailure>(this as ApiFailure);
  }

  ApiFailureCopyWith<ApiFailure, ApiFailure, ApiFailure> get copyWith =>
      _ApiFailureCopyWithImpl(this as ApiFailure, $identity, $identity);
  @override
  String toString() {
    return ApiFailureMapper.ensureInitialized()
        .stringifyValue(this as ApiFailure);
  }

  @override
  bool operator ==(Object other) {
    return ApiFailureMapper.ensureInitialized()
        .equalsValue(this as ApiFailure, other);
  }

  @override
  int get hashCode {
    return ApiFailureMapper.ensureInitialized().hashValue(this as ApiFailure);
  }
}

extension ApiFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApiFailure, $Out> {
  ApiFailureCopyWith<$R, ApiFailure, $Out> get $asApiFailure =>
      $base.as((v, t, t2) => _ApiFailureCopyWithImpl(v, t, t2));
}

abstract class ApiFailureCopyWith<$R, $In extends ApiFailure, $Out>
    implements FailureCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message, int? statusCode});
  ApiFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ApiFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApiFailure, $Out>
    implements ApiFailureCopyWith<$R, ApiFailure, $Out> {
  _ApiFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApiFailure> $mapper =
      ApiFailureMapper.ensureInitialized();
  @override
  $R call({String? message, Object? statusCode = $none}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != $none) #statusCode: statusCode
      }));
  @override
  ApiFailure $make(CopyWithData data) => ApiFailure(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  ApiFailureCopyWith<$R2, ApiFailure, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ApiFailureCopyWithImpl($value, $cast, t);
}

class CacheFailureMapper extends ClassMapperBase<CacheFailure> {
  CacheFailureMapper._();

  static CacheFailureMapper? _instance;
  static CacheFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CacheFailureMapper._());
      FailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CacheFailure';

  static String _$message(CacheFailure v) => v.message;
  static const Field<CacheFailure, String> _f$message =
      Field('message', _$message);
  static int? _$statusCode(CacheFailure v) => v.statusCode;
  static const Field<CacheFailure, int> _f$statusCode =
      Field('statusCode', _$statusCode, opt: true);
  static bool _$isUnknownException(CacheFailure v) => v.isUnknownException;
  static const Field<CacheFailure, bool> _f$isUnknownException =
      Field('isUnknownException', _$isUnknownException, mode: FieldMode.member);

  @override
  final MappableFields<CacheFailure> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
    #isUnknownException: _f$isUnknownException,
  };

  static CacheFailure _instantiate(DecodingData data) {
    return CacheFailure(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static CacheFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CacheFailure>(map);
  }

  static CacheFailure fromJson(String json) {
    return ensureInitialized().decodeJson<CacheFailure>(json);
  }
}

mixin CacheFailureMappable {
  String toJson() {
    return CacheFailureMapper.ensureInitialized()
        .encodeJson<CacheFailure>(this as CacheFailure);
  }

  Map<String, dynamic> toMap() {
    return CacheFailureMapper.ensureInitialized()
        .encodeMap<CacheFailure>(this as CacheFailure);
  }

  CacheFailureCopyWith<CacheFailure, CacheFailure, CacheFailure> get copyWith =>
      _CacheFailureCopyWithImpl(this as CacheFailure, $identity, $identity);
  @override
  String toString() {
    return CacheFailureMapper.ensureInitialized()
        .stringifyValue(this as CacheFailure);
  }

  @override
  bool operator ==(Object other) {
    return CacheFailureMapper.ensureInitialized()
        .equalsValue(this as CacheFailure, other);
  }

  @override
  int get hashCode {
    return CacheFailureMapper.ensureInitialized()
        .hashValue(this as CacheFailure);
  }
}

extension CacheFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CacheFailure, $Out> {
  CacheFailureCopyWith<$R, CacheFailure, $Out> get $asCacheFailure =>
      $base.as((v, t, t2) => _CacheFailureCopyWithImpl(v, t, t2));
}

abstract class CacheFailureCopyWith<$R, $In extends CacheFailure, $Out>
    implements FailureCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message, int? statusCode});
  CacheFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CacheFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CacheFailure, $Out>
    implements CacheFailureCopyWith<$R, CacheFailure, $Out> {
  _CacheFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CacheFailure> $mapper =
      CacheFailureMapper.ensureInitialized();
  @override
  $R call({String? message, Object? statusCode = $none}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != $none) #statusCode: statusCode
      }));
  @override
  CacheFailure $make(CopyWithData data) => CacheFailure(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  CacheFailureCopyWith<$R2, CacheFailure, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CacheFailureCopyWithImpl($value, $cast, t);
}

class GpsFailureMapper extends ClassMapperBase<GpsFailure> {
  GpsFailureMapper._();

  static GpsFailureMapper? _instance;
  static GpsFailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GpsFailureMapper._());
      FailureMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GpsFailure';

  static String _$message(GpsFailure v) => v.message;
  static const Field<GpsFailure, String> _f$message =
      Field('message', _$message);
  static int? _$statusCode(GpsFailure v) => v.statusCode;
  static const Field<GpsFailure, int> _f$statusCode =
      Field('statusCode', _$statusCode, opt: true);
  static bool _$isUnknownException(GpsFailure v) => v.isUnknownException;
  static const Field<GpsFailure, bool> _f$isUnknownException =
      Field('isUnknownException', _$isUnknownException, mode: FieldMode.member);

  @override
  final MappableFields<GpsFailure> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
    #isUnknownException: _f$isUnknownException,
  };

  static GpsFailure _instantiate(DecodingData data) {
    return GpsFailure(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static GpsFailure fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GpsFailure>(map);
  }

  static GpsFailure fromJson(String json) {
    return ensureInitialized().decodeJson<GpsFailure>(json);
  }
}

mixin GpsFailureMappable {
  String toJson() {
    return GpsFailureMapper.ensureInitialized()
        .encodeJson<GpsFailure>(this as GpsFailure);
  }

  Map<String, dynamic> toMap() {
    return GpsFailureMapper.ensureInitialized()
        .encodeMap<GpsFailure>(this as GpsFailure);
  }

  GpsFailureCopyWith<GpsFailure, GpsFailure, GpsFailure> get copyWith =>
      _GpsFailureCopyWithImpl(this as GpsFailure, $identity, $identity);
  @override
  String toString() {
    return GpsFailureMapper.ensureInitialized()
        .stringifyValue(this as GpsFailure);
  }

  @override
  bool operator ==(Object other) {
    return GpsFailureMapper.ensureInitialized()
        .equalsValue(this as GpsFailure, other);
  }

  @override
  int get hashCode {
    return GpsFailureMapper.ensureInitialized().hashValue(this as GpsFailure);
  }
}

extension GpsFailureValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GpsFailure, $Out> {
  GpsFailureCopyWith<$R, GpsFailure, $Out> get $asGpsFailure =>
      $base.as((v, t, t2) => _GpsFailureCopyWithImpl(v, t, t2));
}

abstract class GpsFailureCopyWith<$R, $In extends GpsFailure, $Out>
    implements FailureCopyWith<$R, $In, $Out> {
  @override
  $R call({String? message, int? statusCode});
  GpsFailureCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GpsFailureCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GpsFailure, $Out>
    implements GpsFailureCopyWith<$R, GpsFailure, $Out> {
  _GpsFailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GpsFailure> $mapper =
      GpsFailureMapper.ensureInitialized();
  @override
  $R call({String? message, Object? statusCode = $none}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != $none) #statusCode: statusCode
      }));
  @override
  GpsFailure $make(CopyWithData data) => GpsFailure(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  GpsFailureCopyWith<$R2, GpsFailure, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GpsFailureCopyWithImpl($value, $cast, t);
}
