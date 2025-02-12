// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'location.model.dart';

class LocationModelMapper extends ClassMapperBase<LocationModel> {
  LocationModelMapper._();

  static LocationModelMapper? _instance;
  static LocationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocationModelMapper._());
      LocationEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LocationModel';

  static List<double> _$coordinates(LocationModel v) => v.coordinates;
  static const Field<LocationModel, List<double>> _f$coordinates =
      Field('coordinates', _$coordinates);

  @override
  final MappableFields<LocationModel> fields = const {
    #coordinates: _f$coordinates,
  };

  static LocationModel _instantiate(DecodingData data) {
    return LocationModel(coordinates: data.dec(_f$coordinates));
  }

  @override
  final Function instantiate = _instantiate;

  static LocationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocationModel>(map);
  }

  static LocationModel fromJson(String json) {
    return ensureInitialized().decodeJson<LocationModel>(json);
  }
}

mixin LocationModelMappable {
  String toJson() {
    return LocationModelMapper.ensureInitialized()
        .encodeJson<LocationModel>(this as LocationModel);
  }

  Map<String, dynamic> toMap() {
    return LocationModelMapper.ensureInitialized()
        .encodeMap<LocationModel>(this as LocationModel);
  }

  LocationModelCopyWith<LocationModel, LocationModel, LocationModel>
      get copyWith => _LocationModelCopyWithImpl(
          this as LocationModel, $identity, $identity);
  @override
  String toString() {
    return LocationModelMapper.ensureInitialized()
        .stringifyValue(this as LocationModel);
  }

  @override
  bool operator ==(Object other) {
    return LocationModelMapper.ensureInitialized()
        .equalsValue(this as LocationModel, other);
  }

  @override
  int get hashCode {
    return LocationModelMapper.ensureInitialized()
        .hashValue(this as LocationModel);
  }
}

extension LocationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocationModel, $Out> {
  LocationModelCopyWith<$R, LocationModel, $Out> get $asLocationModel =>
      $base.as((v, t, t2) => _LocationModelCopyWithImpl(v, t, t2));
}

abstract class LocationModelCopyWith<$R, $In extends LocationModel, $Out>
    implements LocationEntityCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, double, ObjectCopyWith<$R, double, double>> get coordinates;
  @override
  $R call({List<double>? coordinates});
  LocationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LocationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocationModel, $Out>
    implements LocationModelCopyWith<$R, LocationModel, $Out> {
  _LocationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocationModel> $mapper =
      LocationModelMapper.ensureInitialized();
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
  LocationModel $make(CopyWithData data) => LocationModel(
      coordinates: data.get(#coordinates, or: $value.coordinates));

  @override
  LocationModelCopyWith<$R2, LocationModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocationModelCopyWithImpl($value, $cast, t);
}
