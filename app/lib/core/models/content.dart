import 'package:buzzup/core/enums/post_type.dart';
import 'package:buzzup/core/models/channel.dart';
import 'package:buzzup/core/models/comment.dart';
import 'package:buzzup/core/models/location.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'metadata.dart';

part 'content.mapper.dart';

@MappableClass()
sealed class Content with ContentMappable {
  const Content({
    required this.id,
    required this.metadata,
    required this.channels,
    required this.location,
    required this.type,
    this.likes,
    this.dislikes,
    this.text,
    this.media,
    this.city,
    this.comments,
  });

  final String id;
  final List<Channel>? channels;
  final Metadata metadata;
  final List<User>? likes;
  final List<User>? dislikes;
  final String? text;
  final List<String>? media;
  final String? city;
  final Location location;
  final ContentType type;
  final List<Comment>? comments;
}

@MappableClass()
class Post extends Content with PostMappable {
  Post({
    required super.id,
    required super.metadata,
    required super.channels,
    required super.location,
    required super.type,
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
        metadata: Metadata.empty(),
        location: Location.empty(),
        type: ContentType.anonymous,
        channels: [Channel.empty()],
        endDate: DateTime.parse('2024-02-10T14:38:36.936Z'),
      );

  @MappableField(key: 'end_date')
  final DateTime? endDate;
}

@MappableClass()
class Story extends Content with StoryMappable {
  Story({
    required super.id,
    required super.metadata,
    required super.channels,
    required super.location,
    required super.type,
    super.likes,
    super.dislikes,
    super.text,
    super.media,
    super.city,
    super.comments,
  });

  factory Story.empty() => Story(
        id: 'empty',
        metadata: Metadata.empty(),
        location: Location.empty(),
        type: ContentType.public,
        channels: [Channel.empty()],
      );
}
