import 'package:buzzup/core/enums/upload_status.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'upload_job.entity.mapper.dart';

@MappableClass()
class UploadJobEntity with UploadJobEntityMappable {
  UploadJobEntity({
    required this.id,
    required this.userId,
    required this.fileIds,
    required this.fileUris,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.progress,
    required this.totalFiles,
    required this.completedFiles,
    this.errorMessage,
  });

  final String id;
  final String userId;
  final List<String> fileIds;
  final List<String> fileUris;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UploadStatus status;
  final double progress;
  final int totalFiles;
  final int completedFiles;
  final String? errorMessage;
}
