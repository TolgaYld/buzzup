// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'exception.dart';

class ApiExceptionMapper extends ClassMapperBase<ApiException> {
  ApiExceptionMapper._();

  static ApiExceptionMapper? _instance;
  static ApiExceptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiExceptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApiException';

  static String _$message(ApiException v) => v.message;
  static const Field<ApiException, String> _f$message =
      Field('message', _$message);
  static int? _$statusCode(ApiException v) => v.statusCode;
  static const Field<ApiException, int> _f$statusCode =
      Field('statusCode', _$statusCode, opt: true);

  @override
  final MappableFields<ApiException> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
  };

  static ApiException _instantiate(DecodingData data) {
    return ApiException(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static ApiException fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApiException>(map);
  }

  static ApiException fromJson(String json) {
    return ensureInitialized().decodeJson<ApiException>(json);
  }
}

mixin ApiExceptionMappable {
  String toJson() {
    return ApiExceptionMapper.ensureInitialized()
        .encodeJson<ApiException>(this as ApiException);
  }

  Map<String, dynamic> toMap() {
    return ApiExceptionMapper.ensureInitialized()
        .encodeMap<ApiException>(this as ApiException);
  }

  ApiExceptionCopyWith<ApiException, ApiException, ApiException> get copyWith =>
      _ApiExceptionCopyWithImpl(this as ApiException, $identity, $identity);
  @override
  String toString() {
    return ApiExceptionMapper.ensureInitialized()
        .stringifyValue(this as ApiException);
  }

  @override
  bool operator ==(Object other) {
    return ApiExceptionMapper.ensureInitialized()
        .equalsValue(this as ApiException, other);
  }

  @override
  int get hashCode {
    return ApiExceptionMapper.ensureInitialized()
        .hashValue(this as ApiException);
  }
}

extension ApiExceptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApiException, $Out> {
  ApiExceptionCopyWith<$R, ApiException, $Out> get $asApiException =>
      $base.as((v, t, t2) => _ApiExceptionCopyWithImpl(v, t, t2));
}

abstract class ApiExceptionCopyWith<$R, $In extends ApiException, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message, int? statusCode});
  ApiExceptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ApiExceptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApiException, $Out>
    implements ApiExceptionCopyWith<$R, ApiException, $Out> {
  _ApiExceptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApiException> $mapper =
      ApiExceptionMapper.ensureInitialized();
  @override
  $R call({String? message, Object? statusCode = $none}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != $none) #statusCode: statusCode
      }));
  @override
  ApiException $make(CopyWithData data) => ApiException(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  ApiExceptionCopyWith<$R2, ApiException, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ApiExceptionCopyWithImpl($value, $cast, t);
}

class CacheExceptionMapper extends ClassMapperBase<CacheException> {
  CacheExceptionMapper._();

  static CacheExceptionMapper? _instance;
  static CacheExceptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CacheExceptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CacheException';

  static String _$message(CacheException v) => v.message;
  static const Field<CacheException, String> _f$message =
      Field('message', _$message);
  static int? _$statusCode(CacheException v) => v.statusCode;
  static const Field<CacheException, int> _f$statusCode =
      Field('statusCode', _$statusCode, opt: true, def: 500);

  @override
  final MappableFields<CacheException> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
  };

  static CacheException _instantiate(DecodingData data) {
    return CacheException(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static CacheException fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CacheException>(map);
  }

  static CacheException fromJson(String json) {
    return ensureInitialized().decodeJson<CacheException>(json);
  }
}

mixin CacheExceptionMappable {
  String toJson() {
    return CacheExceptionMapper.ensureInitialized()
        .encodeJson<CacheException>(this as CacheException);
  }

  Map<String, dynamic> toMap() {
    return CacheExceptionMapper.ensureInitialized()
        .encodeMap<CacheException>(this as CacheException);
  }

  CacheExceptionCopyWith<CacheException, CacheException, CacheException>
      get copyWith => _CacheExceptionCopyWithImpl(
          this as CacheException, $identity, $identity);
  @override
  String toString() {
    return CacheExceptionMapper.ensureInitialized()
        .stringifyValue(this as CacheException);
  }

  @override
  bool operator ==(Object other) {
    return CacheExceptionMapper.ensureInitialized()
        .equalsValue(this as CacheException, other);
  }

  @override
  int get hashCode {
    return CacheExceptionMapper.ensureInitialized()
        .hashValue(this as CacheException);
  }
}

extension CacheExceptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CacheException, $Out> {
  CacheExceptionCopyWith<$R, CacheException, $Out> get $asCacheException =>
      $base.as((v, t, t2) => _CacheExceptionCopyWithImpl(v, t, t2));
}

abstract class CacheExceptionCopyWith<$R, $In extends CacheException, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message, int? statusCode});
  CacheExceptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CacheExceptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CacheException, $Out>
    implements CacheExceptionCopyWith<$R, CacheException, $Out> {
  _CacheExceptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CacheException> $mapper =
      CacheExceptionMapper.ensureInitialized();
  @override
  $R call({String? message, Object? statusCode = $none}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != $none) #statusCode: statusCode
      }));
  @override
  CacheException $make(CopyWithData data) => CacheException(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  CacheExceptionCopyWith<$R2, CacheException, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CacheExceptionCopyWithImpl($value, $cast, t);
}

class GpsExceptionMapper extends ClassMapperBase<GpsException> {
  GpsExceptionMapper._();

  static GpsExceptionMapper? _instance;
  static GpsExceptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GpsExceptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GpsException';

  static String _$message(GpsException v) => v.message;
  static const Field<GpsException, String> _f$message =
      Field('message', _$message);
  static int? _$statusCode(GpsException v) => v.statusCode;
  static const Field<GpsException, int> _f$statusCode =
      Field('statusCode', _$statusCode, opt: true, def: 500);

  @override
  final MappableFields<GpsException> fields = const {
    #message: _f$message,
    #statusCode: _f$statusCode,
  };

  static GpsException _instantiate(DecodingData data) {
    return GpsException(
        message: data.dec(_f$message), statusCode: data.dec(_f$statusCode));
  }

  @override
  final Function instantiate = _instantiate;

  static GpsException fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GpsException>(map);
  }

  static GpsException fromJson(String json) {
    return ensureInitialized().decodeJson<GpsException>(json);
  }
}

mixin GpsExceptionMappable {
  String toJson() {
    return GpsExceptionMapper.ensureInitialized()
        .encodeJson<GpsException>(this as GpsException);
  }

  Map<String, dynamic> toMap() {
    return GpsExceptionMapper.ensureInitialized()
        .encodeMap<GpsException>(this as GpsException);
  }

  GpsExceptionCopyWith<GpsException, GpsException, GpsException> get copyWith =>
      _GpsExceptionCopyWithImpl(this as GpsException, $identity, $identity);
  @override
  String toString() {
    return GpsExceptionMapper.ensureInitialized()
        .stringifyValue(this as GpsException);
  }

  @override
  bool operator ==(Object other) {
    return GpsExceptionMapper.ensureInitialized()
        .equalsValue(this as GpsException, other);
  }

  @override
  int get hashCode {
    return GpsExceptionMapper.ensureInitialized()
        .hashValue(this as GpsException);
  }
}

extension GpsExceptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GpsException, $Out> {
  GpsExceptionCopyWith<$R, GpsException, $Out> get $asGpsException =>
      $base.as((v, t, t2) => _GpsExceptionCopyWithImpl(v, t, t2));
}

abstract class GpsExceptionCopyWith<$R, $In extends GpsException, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message, int? statusCode});
  GpsExceptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GpsExceptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GpsException, $Out>
    implements GpsExceptionCopyWith<$R, GpsException, $Out> {
  _GpsExceptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GpsException> $mapper =
      GpsExceptionMapper.ensureInitialized();
  @override
  $R call({String? message, Object? statusCode = $none}) =>
      $apply(FieldCopyWithData({
        if (message != null) #message: message,
        if (statusCode != $none) #statusCode: statusCode
      }));
  @override
  GpsException $make(CopyWithData data) => GpsException(
      message: data.get(#message, or: $value.message),
      statusCode: data.get(#statusCode, or: $value.statusCode));

  @override
  GpsExceptionCopyWith<$R2, GpsException, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GpsExceptionCopyWithImpl($value, $cast, t);
}
