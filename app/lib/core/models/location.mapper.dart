// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'location.dart';

class LocationMapper extends ClassMapperBase<Location> {
  LocationMapper._();

  static LocationMapper? _instance;
  static LocationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Location';

  static List<double> _$coordinates(Location v) => v.coordinates;
  static const Field<Location, List<double>> _f$coordinates =
      Field('coordinates', _$coordinates);

  @override
  final MappableFields<Location> fields = const {
    #coordinates: _f$coordinates,
  };

  static Location _instantiate(DecodingData data) {
    return Location(coordinates: data.dec(_f$coordinates));
  }

  @override
  final Function instantiate = _instantiate;

  static Location fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Location>(map);
  }

  static Location fromJson(String json) {
    return ensureInitialized().decodeJson<Location>(json);
  }
}

mixin LocationMappable {
  String toJson() {
    return LocationMapper.ensureInitialized()
        .encodeJson<Location>(this as Location);
  }

  Map<String, dynamic> toMap() {
    return LocationMapper.ensureInitialized()
        .encodeMap<Location>(this as Location);
  }

  LocationCopyWith<Location, Location, Location> get copyWith =>
      _LocationCopyWithImpl(this as Location, $identity, $identity);
  @override
  String toString() {
    return LocationMapper.ensureInitialized().stringifyValue(this as Location);
  }

  @override
  bool operator ==(Object other) {
    return LocationMapper.ensureInitialized()
        .equalsValue(this as Location, other);
  }

  @override
  int get hashCode {
    return LocationMapper.ensureInitialized().hashValue(this as Location);
  }
}

extension LocationValueCopy<$R, $Out> on ObjectCopyWith<$R, Location, $Out> {
  LocationCopyWith<$R, Location, $Out> get $asLocation =>
      $base.as((v, t, t2) => _LocationCopyWithImpl(v, t, t2));
}

abstract class LocationCopyWith<$R, $In extends Location, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get coordinates;
  $R call({List<double>? coordinates});
  LocationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LocationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Location, $Out>
    implements LocationCopyWith<$R, Location, $Out> {
  _LocationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Location> $mapper =
      LocationMapper.ensureInitialized();
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
  Location $make(CopyWithData data) =>
      Location(coordinates: data.get(#coordinates, or: $value.coordinates));

  @override
  LocationCopyWith<$R2, Location, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocationCopyWithImpl($value, $cast, t);
}
