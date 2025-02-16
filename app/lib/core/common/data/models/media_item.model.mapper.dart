// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'media_item.model.dart';

class MediaItemModelMapper extends ClassMapperBase<MediaItemModel> {
  MediaItemModelMapper._();

  static MediaItemModelMapper? _instance;
  static MediaItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaItemModelMapper._());
      MediaItemEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MediaItemModel';

  static String _$id(MediaItemModel v) => v.id;
  static const Field<MediaItemModel, String> _f$id = Field('id', _$id);
  static String? _$uri(MediaItemModel v) => v.uri;
  static const Field<MediaItemModel, String> _f$uri = Field('uri', _$uri);
  static int _$position(MediaItemModel v) => v.position;
  static const Field<MediaItemModel, int> _f$position =
      Field('position', _$position);
  static File? _$file(MediaItemModel v) => v.file;
  static const Field<MediaItemModel, File> _f$file =
      Field('file', _$file, opt: true);
  static bool _$isNew(MediaItemModel v) => v.isNew;
  static const Field<MediaItemModel, bool> _f$isNew =
      Field('isNew', _$isNew, opt: true, def: false);
  static bool _$isDeleted(MediaItemModel v) => v.isDeleted;
  static const Field<MediaItemModel, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, opt: true, def: false);

  @override
  final MappableFields<MediaItemModel> fields = const {
    #id: _f$id,
    #uri: _f$uri,
    #position: _f$position,
    #file: _f$file,
    #isNew: _f$isNew,
    #isDeleted: _f$isDeleted,
  };

  static MediaItemModel _instantiate(DecodingData data) {
    return MediaItemModel(
        id: data.dec(_f$id),
        uri: data.dec(_f$uri),
        position: data.dec(_f$position),
        file: data.dec(_f$file),
        isNew: data.dec(_f$isNew),
        isDeleted: data.dec(_f$isDeleted));
  }

  @override
  final Function instantiate = _instantiate;

  static MediaItemModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MediaItemModel>(map);
  }

  static MediaItemModel fromJson(String json) {
    return ensureInitialized().decodeJson<MediaItemModel>(json);
  }
}

mixin MediaItemModelMappable {
  String toJson() {
    return MediaItemModelMapper.ensureInitialized()
        .encodeJson<MediaItemModel>(this as MediaItemModel);
  }

  Map<String, dynamic> toMap() {
    return MediaItemModelMapper.ensureInitialized()
        .encodeMap<MediaItemModel>(this as MediaItemModel);
  }

  MediaItemModelCopyWith<MediaItemModel, MediaItemModel, MediaItemModel>
      get copyWith => _MediaItemModelCopyWithImpl(
          this as MediaItemModel, $identity, $identity);
  @override
  String toString() {
    return MediaItemModelMapper.ensureInitialized()
        .stringifyValue(this as MediaItemModel);
  }

  @override
  bool operator ==(Object other) {
    return MediaItemModelMapper.ensureInitialized()
        .equalsValue(this as MediaItemModel, other);
  }

  @override
  int get hashCode {
    return MediaItemModelMapper.ensureInitialized()
        .hashValue(this as MediaItemModel);
  }
}

extension MediaItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MediaItemModel, $Out> {
  MediaItemModelCopyWith<$R, MediaItemModel, $Out> get $asMediaItemModel =>
      $base.as((v, t, t2) => _MediaItemModelCopyWithImpl(v, t, t2));
}

abstract class MediaItemModelCopyWith<$R, $In extends MediaItemModel, $Out>
    implements MediaItemEntityCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? id,
      String? uri,
      int? position,
      File? file,
      bool? isNew,
      bool? isDeleted});
  MediaItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MediaItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MediaItemModel, $Out>
    implements MediaItemModelCopyWith<$R, MediaItemModel, $Out> {
  _MediaItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MediaItemModel> $mapper =
      MediaItemModelMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? uri = $none,
          int? position,
          Object? file = $none,
          bool? isNew,
          bool? isDeleted}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (uri != $none) #uri: uri,
        if (position != null) #position: position,
        if (file != $none) #file: file,
        if (isNew != null) #isNew: isNew,
        if (isDeleted != null) #isDeleted: isDeleted
      }));
  @override
  MediaItemModel $make(CopyWithData data) => MediaItemModel(
      id: data.get(#id, or: $value.id),
      uri: data.get(#uri, or: $value.uri),
      position: data.get(#position, or: $value.position),
      file: data.get(#file, or: $value.file),
      isNew: data.get(#isNew, or: $value.isNew),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted));

  @override
  MediaItemModelCopyWith<$R2, MediaItemModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MediaItemModelCopyWithImpl($value, $cast, t);
}
