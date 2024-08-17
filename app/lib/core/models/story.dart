import 'package:buzzup/core/models/channel.dart';
import 'package:buzzup/core/models/location.dart';
import 'package:buzzup/core/models/user.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:buzzup/core/enums/post_type.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';

part 'story.mapper.dart';

@MappableClass()
class Story with StoryMappable {
  Story({
    required this.id,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.createdBy,
    required this.location,
    required this.type,
    required this.channels,
    this.likes,
    this.dislikes,
    this.text,
    this.media,
    this.city,
  });

  factory Story.empty() => Story(
        id: 'empty',
        isActive: true,
        isDeleted: false,
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: User.empty(),
        location: Location.empty(),
        type: PostType.public,
        channels: [Channel.empty()],
      );

  @MappableField(key: '_id')
  final String id;
  @MappableField(key: 'is_active')
  final bool isActive;
  @MappableField(key: 'is_deleted')
  final bool isDeleted;
  @DateTimeConverter()
  @MappableField(key: 'created_at')
  final DateTime createdAt;
  @MappableField(key: 'created_by')
  final User createdBy;
  @MappableField(key: 'location')
  final Location location;
  final PostType type;
  final List<Channel> channels;
  final List<User>? likes;
  final List<User>? dislikes;
  final String? text;
  final List<String>? media;
  final String? city;
}
