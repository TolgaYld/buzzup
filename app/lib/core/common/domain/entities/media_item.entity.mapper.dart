// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'media_item.entity.dart';

class MediaItemEntityMapper extends ClassMapperBase<MediaItemEntity> {
  MediaItemEntityMapper._();

  static MediaItemEntityMapper? _instance;
  static MediaItemEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaItemEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MediaItemEntity';

  static String _$id(MediaItemEntity v) => v.id;
  static const Field<MediaItemEntity, String> _f$id = Field('id', _$id);
  static String? _$uri(MediaItemEntity v) => v.uri;
  static const Field<MediaItemEntity, String> _f$uri =
      Field('uri', _$uri, opt: true);
  static File? _$file(MediaItemEntity v) => v.file;
  static const Field<MediaItemEntity, File> _f$file =
      Field('file', _$file, opt: true);
  static int _$position(MediaItemEntity v) => v.position;
  static const Field<MediaItemEntity, int> _f$position =
      Field('position', _$position);
  static bool _$isNew(MediaItemEntity v) => v.isNew;
  static const Field<MediaItemEntity, bool> _f$isNew =
      Field('isNew', _$isNew, opt: true, def: false);
  static bool _$isDeleted(MediaItemEntity v) => v.isDeleted;
  static const Field<MediaItemEntity, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<MediaItemEntity> fields = const {
    #id: _f$id,
    #uri: _f$uri,
    #file: _f$file,
    #position: _f$position,
    #isNew: _f$isNew,
    #isDeleted: _f$isDeleted,
  };

  static MediaItemEntity _instantiate(DecodingData data) {
    return MediaItemEntity(
        id: data.dec(_f$id),
        uri: data.dec(_f$uri),
        file: data.dec(_f$file),
        position: data.dec(_f$position),
        isNew: data.dec(_f$isNew),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static MediaItemEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MediaItemEntity>(map);
  }

  static MediaItemEntity fromJson(String json) {
    return ensureInitialized().decodeJson<MediaItemEntity>(json);
  }
}

mixin MediaItemEntityMappable {
  String toJson() {
    return MediaItemEntityMapper.ensureInitialized()
        .encodeJson<MediaItemEntity>(this as MediaItemEntity);
  }

  Map<String, dynamic> toMap() {
    return MediaItemEntityMapper.ensureInitialized()
        .encodeMap<MediaItemEntity>(this as MediaItemEntity);
  }

  MediaItemEntityCopyWith<MediaItemEntity, MediaItemEntity, MediaItemEntity>
      get copyWith => _MediaItemEntityCopyWithImpl(
          this as MediaItemEntity, $identity, $identity);
  @override
  String toString() {
    return MediaItemEntityMapper.ensureInitialized()
        .stringifyValue(this as MediaItemEntity);
  }

  @override
  bool operator ==(Object other) {
    return MediaItemEntityMapper.ensureInitialized()
        .equalsValue(this as MediaItemEntity, other);
  }

  @override
  int get hashCode {
    return MediaItemEntityMapper.ensureInitialized()
        .hashValue(this as MediaItemEntity);
  }
}

extension MediaItemEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MediaItemEntity, $Out> {
  MediaItemEntityCopyWith<$R, MediaItemEntity, $Out> get $asMediaItemEntity =>
      $base.as((v, t, t2) => _MediaItemEntityCopyWithImpl(v, t, t2));
}

abstract class MediaItemEntityCopyWith<$R, $In extends MediaItemEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? uri,
      File? file,
      int? position,
      bool? isNew,
      bool? isDeleted});
  MediaItemEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MediaItemEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MediaItemEntity, $Out>
    implements MediaItemEntityCopyWith<$R, MediaItemEntity, $Out> {
  _MediaItemEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MediaItemEntity> $mapper =
      MediaItemEntityMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? uri = $none,
          Object? file = $none,
          int? position,
          bool? isNew,
          bool? isDeleted}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (uri != $none) #uri: uri,
        if (file != $none) #file: file,
        if (position != null) #position: position,
        if (isNew != null) #isNew: isNew,
        if (isDeleted != null) #isDeleted: isDeleted
      }));
  @override
  MediaItemEntity $make(CopyWithData data) => MediaItemEntity(
      id: data.get(#id, or: $value.id),
      uri: data.get(#uri, or: $value.uri),
      file: data.get(#file, or: $value.file),
      position: data.get(#position, or: $value.position),
      isNew: data.get(#isNew, or: $value.isNew),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  MediaItemEntityCopyWith<$R2, MediaItemEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MediaItemEntityCopyWithImpl($value, $cast, t);
}
