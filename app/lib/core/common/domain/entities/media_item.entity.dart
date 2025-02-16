import 'dart:io';
import 'package:dart_mappable/dart_mappable.dart';

part 'media_item.entity.mapper.dart';

@MappableClass()
class MediaItemEntity with MediaItemEntityMappable {
  MediaItemEntity({
    required this.id,
    this.uri,
    this.file,
    required this.position,
    this.isNew = false,
  });

  final String id;
  final String? uri;
  final File? file;
  final int position;
  final bool isNew;

  bool get isUploaded => uri != null && file == null && isNew;
}
