// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'location.entity.dart';

class LocationEntityMapper extends ClassMapperBase<LocationEntity> {
  LocationEntityMapper._();

  static LocationEntityMapper? _instance;
  static LocationEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocationEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocationEntity';

  static List<double> _$coordinates(LocationEntity v) => v.coordinates;
  static const Field<LocationEntity, List<double>> _f$coordinates =
      Field('coordinates', _$coordinates);

  @override
  final MappableFields<LocationEntity> fields = const {
    #coordinates: _f$coordinates,
  };

  static LocationEntity _instantiate(DecodingData data) {
    return LocationEntity(coordinates: data.dec(_f$coordinates));
  }

  @override
  final Function instantiate = _instantiate;

  static LocationEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocationEntity>(map);
  }

  static LocationEntity fromJson(String json) {
    return ensureInitialized().decodeJson<LocationEntity>(json);
  }
}

mixin LocationEntityMappable {
  String toJson() {
    return LocationEntityMapper.ensureInitialized()
        .encodeJson<LocationEntity>(this as LocationEntity);
  }

  Map<String, dynamic> toMap() {
    return LocationEntityMapper.ensureInitialized()
        .encodeMap<LocationEntity>(this as LocationEntity);
  }

  LocationEntityCopyWith<LocationEntity, LocationEntity, LocationEntity>
      get copyWith => _LocationEntityCopyWithImpl(
          this as LocationEntity, $identity, $identity);
  @override
  String toString() {
    return LocationEntityMapper.ensureInitialized()
        .stringifyValue(this as LocationEntity);
  }

  @override
  bool operator ==(Object other) {
    return LocationEntityMapper.ensureInitialized()
        .equalsValue(this as LocationEntity, other);
  }

  @override
  int get hashCode {
    return LocationEntityMapper.ensureInitialized()
        .hashValue(this as LocationEntity);
  }
}

extension LocationEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocationEntity, $Out> {
  LocationEntityCopyWith<$R, LocationEntity, $Out> get $asLocationEntity =>
      $base.as((v, t, t2) => _LocationEntityCopyWithImpl(v, t, t2));
}

abstract class LocationEntityCopyWith<$R, $In extends LocationEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get coordinates;
  $R call({List<double>? coordinates});
  LocationEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocationEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocationEntity, $Out>
    implements LocationEntityCopyWith<$R, LocationEntity, $Out> {
  _LocationEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocationEntity> $mapper =
      LocationEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>>
      get coordinates => ListCopyWith(
          $value.coordinates,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(coordinates: v));
  @override
  $R call({List<double>? coordinates}) => $apply(
      FieldCopyWithData({if (coordinates != null) #coordinates: coordinates}));
  @override
  LocationEntity $make(CopyWithData data) => LocationEntity(
      coordinates: data.get(#coordinates, or: $value.coordinates));

  @override
  LocationEntityCopyWith<$R2, LocationEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocationEntityCopyWithImpl($value, $cast, t);
}
