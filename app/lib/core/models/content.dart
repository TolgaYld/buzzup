import 'package:buzzup/core/enums/post_type.dart';
import 'package:buzzup/core/models/channel.dart';
import 'package:buzzup/core/models/comment.dart';
import 'package:buzzup/core/models/location.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'content.mapper.dart';

@MappableClass()
sealed class Content with ContentMappable {
  const Content({
    required this.id,
    required this.channels,
    required this.location,
    required this.type,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.likes,
    this.dislikes,
    this.text,
    this.media,
    this.city,
    this.comments,
    this.linkedUsers,
  });

  final String id;
  final List<Channel>? channels;
  final List<User>? likes;
  final List<User>? dislikes;
  final String? text;
  final List<String>? media;
  final String? city;
  final Location location;
  final ContentType type;
  final List<Comment>? comments;
  @MappableField(key: 'linked_users')
  final List<User>? linkedUsers;

  @MappableField(key: 'is_active')
  final bool isActive;
  @MappableField(key: 'is_deleted')
  final bool isDeleted;
  @DateTimeConverter()
  @MappableField(key: 'created_at')
  final DateTime createdAt;
  @MappableField(key: 'created_by')
  final User createdBy;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  @MappableField(key: 'updated_by')
  final User? updatedBy;
}

@MappableClass()
class Post extends Content with PostMappable {
  Post({
    required super.id,
    required super.channels,
    required super.location,
    required super.type,
    required super.isActive,
    required super.isDeleted,
    required super.createdAt,
    required super.createdBy,
    super.updatedAt,
    super.updatedBy,
    super.likes,
    super.dislikes,
    super.text,
    super.media,
    super.city,
    super.comments,
    this.endDate,
  });

  factory Post.empty() => Post(
        id: 'empty',
        location: Location.empty(),
        type: ContentType.anonymous,
        channels: [Channel.empty()],
        endDate: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: User.empty(),
        isActive: true,
        isDeleted: false,
      );

  @MappableField(key: 'end_date')
  final DateTime? endDate;
}

@MappableClass()
class Story extends Content with StoryMappable {
  Story({
    required super.id,
    required super.channels,
    required super.location,
    required super.type,
    required super.isActive,
    required super.isDeleted,
    required super.createdAt,
    required super.createdBy,
    super.updatedAt,
    super.updatedBy,
    super.likes,
    super.dislikes,
    super.text,
    super.media,
    super.city,
    super.comments,
  });

  factory Story.empty() => Story(
        id: 'empty',
        location: Location.empty(),
        type: ContentType.public,
        channels: [Channel.empty()],
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: User.empty(),
        isActive: true,
        isDeleted: false,
      );
}
