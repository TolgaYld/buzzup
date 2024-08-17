// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'story.dart';

class StoryMapper extends ClassMapperBase<Story> {
  StoryMapper._();

  static StoryMapper? _instance;
  static StoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoryMapper._());
      UserMapper.ensureInitialized();
      LocationMapper.ensureInitialized();
      ChannelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Story';

  static String _$id(Story v) => v.id;
  static const Field<Story, String> _f$id = Field('id', _$id, key: '_id');
  static bool _$isActive(Story v) => v.isActive;
  static const Field<Story, bool> _f$isActive =
      Field('isActive', _$isActive, key: 'is_active');
  static bool _$isDeleted(Story v) => v.isDeleted;
  static const Field<Story, bool> _f$isDeleted =
      Field('isDeleted', _$isDeleted, key: 'is_deleted');
  static DateTime _$createdAt(Story v) => v.createdAt;
  static const Field<Story, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: 'created_at');
  static User _$createdBy(Story v) => v.createdBy;
  static const Field<Story, User> _f$createdBy =
      Field('createdBy', _$createdBy, key: 'created_by');
  static Location _$location(Story v) => v.location;
  static const Field<Story, Location> _f$location =
      Field('location', _$location);
  static PostType _$type(Story v) => v.type;
  static const Field<Story, PostType> _f$type = Field('type', _$type);
  static List<Channel> _$channels(Story v) => v.channels;
  static const Field<Story, List<Channel>> _f$channels =
      Field('channels', _$channels);
  static List<User>? _$likes(Story v) => v.likes;
  static const Field<Story, List<User>> _f$likes =
      Field('likes', _$likes, opt: true);
  static List<User>? _$dislikes(Story v) => v.dislikes;
  static const Field<Story, List<User>> _f$dislikes =
      Field('dislikes', _$dislikes, opt: true);
  static String? _$text(Story v) => v.text;
  static const Field<Story, String> _f$text = Field('text', _$text, opt: true);
  static List<String>? _$media(Story v) => v.media;
  static const Field<Story, List<String>> _f$media =
      Field('media', _$media, opt: true);
  static String? _$city(Story v) => v.city;
  static const Field<Story, String> _f$city = Field('city', _$city, opt: true);

  @override
  final MappableFields<Story> fields = const {
    #id: _f$id,
    #isActive: _f$isActive,
    #isDeleted: _f$isDeleted,
    #createdAt: _f$createdAt,
    #createdBy: _f$createdBy,
    #location: _f$location,
    #type: _f$type,
    #channels: _f$channels,
    #likes: _f$likes,
    #dislikes: _f$dislikes,
    #text: _f$text,
    #media: _f$media,
    #city: _f$city,
  };

  static Story _instantiate(DecodingData data) {
    return Story(
        id: data.dec(_f$id),
        isActive: data.dec(_f$isActive),
        isDeleted: data.dec(_f$isDeleted),
        createdAt: data.dec(_f$createdAt),
        createdBy: data.dec(_f$createdBy),
        location: data.dec(_f$location),
        type: data.dec(_f$type),
        channels: data.dec(_f$channels),
        likes: data.dec(_f$likes),
        dislikes: data.dec(_f$dislikes),
        text: data.dec(_f$text),
        media: data.dec(_f$media),
        city: data.dec(_f$city));
  }

  @override
  final Function instantiate = _instantiate;

  static Story fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Story>(map);
  }

  static Story fromJson(String json) {
    return ensureInitialized().decodeJson<Story>(json);
  }
}

mixin StoryMappable {
  String toJson() {
    return StoryMapper.ensureInitialized().encodeJson<Story>(this as Story);
  }

  Map<String, dynamic> toMap() {
    return StoryMapper.ensureInitialized().encodeMap<Story>(this as Story);
  }

  StoryCopyWith<Story, Story, Story> get copyWith =>
      _StoryCopyWithImpl(this as Story, $identity, $identity);
  @override
  String toString() {
    return StoryMapper.ensureInitialized().stringifyValue(this as Story);
  }

  @override
  bool operator ==(Object other) {
    return StoryMapper.ensureInitialized().equalsValue(this as Story, other);
  }

  @override
  int get hashCode {
    return StoryMapper.ensureInitialized().hashValue(this as Story);
  }
}

extension StoryValueCopy<$R, $Out> on ObjectCopyWith<$R, Story, $Out> {
  StoryCopyWith<$R, Story, $Out> get $asStory =>
      $base.as((v, t, t2) => _StoryCopyWithImpl(v, t, t2));
}

abstract class StoryCopyWith<$R, $In extends Story, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserCopyWith<$R, User, User> get createdBy;
  LocationCopyWith<$R, Location, Location> get location;
  ListCopyWith<$R, Channel, ChannelCopyWith<$R, Channel, Channel>> get channels;
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get likes;
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get dislikes;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media;
  $R call(
      {String? id,
      bool? isActive,
      bool? isDeleted,
      DateTime? createdAt,
      User? createdBy,
      Location? location,
      PostType? type,
      List<Channel>? channels,
      List<User>? likes,
      List<User>? dislikes,
      String? text,
      List<String>? media,
      String? city});
  StoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StoryCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Story, $Out>
    implements StoryCopyWith<$R, Story, $Out> {
  _StoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Story> $mapper = StoryMapper.ensureInitialized();
  @override
  UserCopyWith<$R, User, User> get createdBy =>
      $value.createdBy.copyWith.$chain((v) => call(createdBy: v));
  @override
  LocationCopyWith<$R, Location, Location> get location =>
      $value.location.copyWith.$chain((v) => call(location: v));
  @override
  ListCopyWith<$R, Channel, ChannelCopyWith<$R, Channel, Channel>>
      get channels => ListCopyWith($value.channels,
          (v, t) => v.copyWith.$chain(t), (v) => call(channels: v));
  @override
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get likes =>
      $value.likes != null
          ? ListCopyWith($value.likes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(likes: v))
          : null;
  @override
  ListCopyWith<$R, User, UserCopyWith<$R, User, User>>? get dislikes =>
      $value.dislikes != null
          ? ListCopyWith($value.dislikes!, (v, t) => v.copyWith.$chain(t),
              (v) => call(dislikes: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get media =>
      $value.media != null
          ? ListCopyWith($value.media!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(media: v))
          : null;
  @override
  $R call(
          {String? id,
          bool? isActive,
          bool? isDeleted,
          DateTime? createdAt,
          User? createdBy,
          Location? location,
          PostType? type,
          List<Channel>? channels,
          Object? likes = $none,
          Object? dislikes = $none,
          Object? text = $none,
          Object? media = $none,
          Object? city = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (isActive != null) #isActive: isActive,
        if (isDeleted != null) #isDeleted: isDeleted,
        if (createdAt != null) #createdAt: createdAt,
        if (createdBy != null) #createdBy: createdBy,
        if (location != null) #location: location,
        if (type != null) #type: type,
        if (channels != null) #channels: channels,
        if (likes != $none) #likes: likes,
        if (dislikes != $none) #dislikes: dislikes,
        if (text != $none) #text: text,
        if (media != $none) #media: media,
        if (city != $none) #city: city
      }));
  @override
  Story $make(CopyWithData data) => Story(
      id: data.get(#id, or: $value.id),
      isActive: data.get(#isActive, or: $value.isActive),
      isDeleted: data.get(#isDeleted, or: $value.isDeleted),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      location: data.get(#location, or: $value.location),
      type: data.get(#type, or: $value.type),
      channels: data.get(#channels, or: $value.channels),
      likes: data.get(#likes, or: $value.likes),
      dislikes: data.get(#dislikes, or: $value.dislikes),
      text: data.get(#text, or: $value.text),
      media: data.get(#media, or: $value.media),
      city: data.get(#city, or: $value.city));

  @override
  StoryCopyWith<$R2, Story, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StoryCopyWithImpl($value, $cast, t);
}
