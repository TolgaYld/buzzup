import 'package:buzzup/core/models/channel.dart';
import 'package:buzzup/core/models/comment.dart';
import 'package:buzzup/core/models/location.dart';
import 'package:buzzup/core/models/post.dart';
import 'package:buzzup/core/models/report.dart';
import 'package:buzzup/core/models/story.dart';
import 'package:buzzup/core/models/token.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';

part 'user.mapper.dart';

@MappableClass()
class User with UserMappable {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.isBanned,
    required this.isDeleted,
    required this.isAdmin,
    required this.official,
    required this.distance,
    required this.points,
    required this.location,
    required this.provider,
    required this.createdAt,
    required this.autoGeneratedUsername,
    required this.usernameChangeCounter,
    this.channels,
    this.deviceType,
    this.deviceId,
    this.providerId,
    this.posts,
    this.storys,
    this.comments,
    this.reports,
    this.reporteds,
    this.tokens,
  });

  factory User.empty() => User(
        id: 'empty',
        username: 'empty',
        email: 'test123@test.com',
        isAdmin: false,
        isBanned: false,
        isDeleted: false,
        official: false,
        distance: 9000,
        points: 0,
        location: Location.empty(),
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        autoGeneratedUsername: false,
        usernameChangeCounter: 0,
        provider: "local",
      );

  @MappableField(key: '_id')
  final String id;
  final String? username;
  final String? email;
  @MappableField(key: 'is_banned')
  final bool? isBanned;
  @MappableField(key: 'is_deleted')
  final bool? isDeleted;
  @MappableField(key: 'is_admin')
  final bool? isAdmin;
  final bool? official;
  final int? distance;
  final int? points;
  final Location? location;
  final String? provider;
  @DateTimeConverter()
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'auto_generated_username')
  final bool? autoGeneratedUsername;
  @MappableField(key: 'username_change_counter')
  final int? usernameChangeCounter;
  final List<Channel>? channels;
  @MappableField(key: 'device_type')
  final String? deviceType;
  @MappableField(key: 'device_id')
  final String? deviceId;
  @MappableField(key: 'provider_id')
  final String? providerId;
  final List<Post>? posts;
  final List<Story>? storys;
  final List<Comment>? comments;
  final List<Report>? reports;
  final List<Report>? reporteds;
  final Token? tokens;
}
