import 'package:buzzup/core/common/domain/entities/channel.entity.dart';
import 'package:buzzup/core/common/domain/entities/comment.entity.dart';
import 'package:buzzup/core/common/domain/entities/location.entity.dart';
import 'package:buzzup/core/common/domain/entities/media_item.entity.dart';
import 'package:buzzup/core/common/domain/entities/user.entity.dart';
import 'package:buzzup/core/enums/content_visibility.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'content.entity.mapper.dart';

@MappableClass()
sealed class ContentEntity with ContentEntityMappable {
  ContentEntity({
    required this.id,
    required this.channels,
    required this.location,
    required this.visibility,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.likes,
    this.dislikes,
    this.text,
    List<MediaItemEntity>? media,
    this.city,
    this.comments,
    this.linkedUsers,
  }) : media = media?..sort((a, b) => a.position.compareTo(b.position));

  final String id;
  final List<ChannelEntity> channels;
  final List<UserEntity>? likes;
  final List<UserEntity>? dislikes;
  final String? text;
  final List<MediaItemEntity>? media;
  final String? city;
  final LocationEntity location;
  final ContentVisibility visibility;
  final List<CommentEntity>? comments;
  final List<UserEntity>? linkedUsers;
  final bool isActive;
  final bool isDeleted;
  final DateTime createdAt;
  final UserEntity createdBy;
  final DateTime? updatedAt;
  final UserEntity? updatedBy;
}

@MappableClass()
class PostEntity extends ContentEntity with PostEntityMappable {
  PostEntity({
    required super.id,
    required super.channels,
    required super.location,
    required super.visibility,
    required super.isActive,
    required super.isDeleted,
    required super.createdAt,
    required super.createdBy,
    super.updatedAt,
    super.updatedBy,
    super.likes,
    super.dislikes,
    super.text,
    List<MediaItemEntity>? media,
    super.city,
    super.comments,
    this.endDate,
  }) : super(media: media?..sort((a, b) => a.position.compareTo(b.position)));

  factory PostEntity.empty() => PostEntity(
        id: 'empty',
        location: LocationEntity.empty(),
        visibility: ContentVisibility.anonymous,
        channels: [ChannelEntity.empty()],
        endDate: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: UserEntity.empty(),
        isActive: true,
        isDeleted: false,
      );
  final DateTime? endDate;
}

@MappableClass()
class StoryEntity extends ContentEntity with StoryEntityMappable {
  StoryEntity({
    required super.id,
    required super.channels,
    required super.location,
    required super.visibility,
    required super.isActive,
    required super.isDeleted,
    required super.createdAt,
    required super.createdBy,
    super.updatedAt,
    super.updatedBy,
    super.likes,
    super.dislikes,
    super.text,
    List<MediaItemEntity>? media,
    super.city,
    super.comments,
  }) : super(media: media?..sort((a, b) => a.position.compareTo(b.position)));

  factory StoryEntity.empty() => StoryEntity(
        id: 'empty',
        location: LocationEntity.empty(),
        visibility: ContentVisibility.public,
        channels: [ChannelEntity.empty()],
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: UserEntity.empty(),
        isActive: true,
        isDeleted: false,
      );
}
