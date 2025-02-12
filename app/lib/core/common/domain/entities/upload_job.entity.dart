import 'package:buzzup/core/enums/upload_status.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'upload_job.entity.mapper.dart';

@MappableClass()
class UploadJobEntity with UploadJobEntityMappable {
  UploadJobEntity({
    required this.uid,
    required this.userUid,
    required this.itemUid,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.progress,
    required this.totalFiles,
    required this.completedFiles,
    required this.fileIds,
    this.errorMessage,
  });

  final String uid;
  final String userUid;
  final String itemUid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UploadStatus status;
  final double progress;
  final int totalFiles;
  final int completedFiles;
  final List<String> fileIds;
  final String? errorMessage;
}
