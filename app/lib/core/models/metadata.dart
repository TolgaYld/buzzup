import 'package:buzzup/core/models/user.dart';
import 'package:buzzup/core/utils/datetime_converter.dart';
import 'package:dart_mappable/dart_mappable.dart';

part "metadata.mapper.dart";

@MappableClass()
class Metadata with MetadataMappable {
  const Metadata({
    required this.id,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  factory Metadata.empty() => Metadata(
        id: 'empty',
        isActive: true,
        isDeleted: false,
        createdAt: DateTime.parse('2024-02-10T14:38:36.936Z'),
        createdBy: User.empty(),
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
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  @MappableField(key: 'updated_by')
  final User? updatedBy;
}
