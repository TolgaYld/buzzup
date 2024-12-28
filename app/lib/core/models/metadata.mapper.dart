// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'metadata.dart';

class MetadataMapper extends ClassMapperBase<Metadata> {
  MetadataMapper._();

  static MetadataMapper? _instance;
  static MetadataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MetadataMapper._());
      UserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Metadata';

  static String _$id(Metadata v) => v.id;
  static const Field<Metadata, String> _f$id = Field('id', _$id, key: '_id');
  static bool _$isActive(Metadata v) => v.isActive;
  static const Field<Metadata, bool> _f$isActive =
      Field('isActive', _$isActive, key: 'is_active');
  static bool _$isDeleted(Metadata v) => v.isDeleted;
  static const Field<Metadata, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: 'is_deleted');
  static DateTime _$createdAt(Metadata v) => v.createdAt;
  static const Field<Metadata, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: 'created_at');
  static User _$createdBy(Metadata v) => v.createdBy;
  static const Field<Metadata, User> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by');
  static DateTime? _$updatedAt(Metadata v) => v.updatedAt;
  static const Field<Metadata, DateTime> _f$updatedAt =
      Field('updatedAt', _$updatedAt, key: 'updated_at', opt: true);
  static User? _$updatedBy(Metadata v) => v.updatedBy;
  static const Field<Metadata, User> _f$updatedBy =
      Field('updatedBy', _$updatedBy, key: 'updated_by', opt: true);

  @override
  final MappableFields<Metadata> fields = const {
    #id: _f$id,
    #isActive: _f$isActive,
    #isDeleted: _f$isDeleted,
    #createdAt: _f$createdAt,
    #createdBy: _f$createdBy,
    #updatedAt: _f$updatedAt,
    #updatedBy: _f$updatedBy,
  };

  static Metadata _instantiate(DecodingData data) {
    return Metadata(
        id: data.dec(_f$id),
        isActive: data.dec(_f$isActive),
        isDeleted: data.dec(_f$isDeleted),
        createdAt: data.dec(_f$createdAt),
        createdBy: data.dec(_f$createdBy),
        updatedAt: data.dec(_f$updatedAt),
        updatedBy: data.dec(_f$updatedBy));
  }

  @override
  final Function instantiate = _instantiate;

  static Metadata fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Metadata>(map);
  }

  static Metadata fromJson(String json) {
    return ensureInitialized().decodeJson<Metadata>(json);
  }
}

mixin MetadataMappable {
  String toJson() {
    return MetadataMapper.ensureInitialized()
        .encodeJson<Metadata>(this as Metadata);
  }

  Map<String, dynamic> toMap() {
    return MetadataMapper.ensureInitialized()
        .encodeMap<Metadata>(this as Metadata);
  }

  MetadataCopyWith<Metadata, Metadata, Metadata> get copyWith =>
      _MetadataCopyWithImpl(this as Metadata, $identity, $identity);
  @override
  String toString() {
    return MetadataMapper.ensureInitialized().stringifyValue(this as Metadata);
  }

  @override
  bool operator ==(Object other) {
    return MetadataMapper.ensureInitialized()
        .equalsValue(this as Metadata, other);
  }

  @override
  int get hashCode {
    return MetadataMapper.ensureInitialized().hashValue(this as Metadata);
  }
}

extension MetadataValueCopy<$R, $Out> on ObjectCopyWith<$R, Metadata, $Out> {
  MetadataCopyWith<$R, Metadata, $Out> get $asMetadata =>
      $base.as((v, t, t2) => _MetadataCopyWithImpl(v, t, t2));
}

abstract class MetadataCopyWith<$R, $In extends Metadata, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get createdBy;
  UserCopyWith<$R, User, User>? get updatedBy;
  $R call(
      {String? id,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      User? createdBy,
      DateTime? updatedAt,
      User? updatedBy});
  MetadataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MetadataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Metadata, $Out>
    implements MetadataCopyWith<$R, Metadata, $Out> {
  _MetadataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Metadata> $mapper =
      MetadataMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  UserCopyWith<$R, User, User>? get updatedBy =>
      $value.updatedBy?.copyWith.$chain((v) => call(updatedBy: v));
  @override
  $R call(
          {String? id,
          bool? isActive,
          bool? isDeleted,
          DateTime? createdAt,
          User? createdBy,
          Object? updatedAt = $none,
          Object? updatedBy = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (isActive != null) #isActive: isActive,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (createdAt != null) #createdAt: createdAt,
        if (createdBy != null) #createdBy: createdBy,
        if (updatedAt != $none) #updatedAt: updatedAt,
        if (updatedBy != $none) #updatedBy: updatedBy
      }));
  @override
  Metadata $make(CopyWithData data) => Metadata(
      id: data.get(#id, or: $value.id),
      isActive: data.get(#isActive, or: $value.isActive),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      updatedBy: data.get(#updatedBy, or: $value.updatedBy));

  @override
  MetadataCopyWith<$R2, Metadata, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MetadataCopyWithImpl($value, $cast, t);
}
